import chisel3._
import chisel3.util._
import lapar_package._

class FlowFSM extends Module{
  val io = IO(new Bundle {
    val start = Input(Bool())
    val next_round_start = Input(Bool())
    val dma_valid = Input(Bool())
    val dma_irq = Input(Bool())
    val fm_ready = Input(Bool())
    val sub_loop_done = Input(Bool())
    val loop_done = Input(Bool())
    val all_loop_done = Input(Bool())
    val fmRdDone = Input(Bool())

    val is_fm_start      = Output(Bool())
    val is_fm_rcv        = Output(Bool())
    val is_round_done    = Output(Bool())
    val is_sub_loop_done = Output(Bool())
    val is_loop_done     = Output(Bool())
  })
  val idle :: fm_chk :: fm_start :: fm_rcv :: round_done :: sub_loop_done :: loop_done :: wait_next_round :: all_loop_done :: Nil = Enum(9)
  val stateReg = RegInit(idle)

  io.is_fm_start      := stateReg === fm_start
  io.is_fm_rcv        := stateReg === fm_rcv
  io.is_round_done    := stateReg === round_done
  io.is_sub_loop_done := stateReg === sub_loop_done
  io.is_loop_done     := stateReg === loop_done

  switch(stateReg){
    is(idle){
      when(io.start){
        stateReg := fm_chk
      }
    }
    is(fm_chk){
      when(io.fmRdDone){
        stateReg := round_done
      }.elsewhen(io.fm_ready){
        stateReg := fm_start
      }
    }
    is(fm_start){
      when(io.dma_valid){
        stateReg := fm_rcv
      }
    }
    is(fm_rcv){
      when(io.dma_irq) {
        stateReg := round_done
      }
    }
    is(round_done){
      when(io.sub_loop_done) {
        stateReg := sub_loop_done
      }.otherwise{
        stateReg := wait_next_round
      }
    }
    is(sub_loop_done){
      when(io.loop_done) {
        stateReg := loop_done
      }.otherwise{
        stateReg := wait_next_round
      }
    }
    is(loop_done){
      when(io.all_loop_done) {
        stateReg := all_loop_done
      }.otherwise{
        stateReg := wait_next_round
      }
    }
    is(wait_next_round){
      when(io.next_round_start) {
        stateReg := fm_chk
      }.otherwise{
        stateReg := wait_next_round
      }
    }
    is(all_loop_done){
      stateReg := idle
    }
  }

}


class rd_fm_ctrl extends Module with nConfig {
  val io = IO(new RdFmCtrlIO)


  // flow control FSM


  val start_dly = RegInit(0.U(4.W))
  start_dly := Cat(start_dly(2, 0), io.start)

  val is_first_round = RegInit(1.U)
  val roundCntReg = RegInit(0.U)
  val subLoopCntReg = RegInit(0.U)
  val loopCntReg = RegInit(0.U)

  val loop_done = WireInit(false.B)
  val sub_loop_done = WireInit(false.B)
  val all_loop_done = WireInit(false.B)

  val posDmaDone = WireInit(false.B)
  val DmaDoneDly = RegInit(false.B)
  val fmRdCnt = RegInit(0.U)
  val subLoopLen = RegInit(0.U)
  val singleRoundLen = RegInit(0.U)
  val fmRdAddr = RegInit(0.U)
  val fmRdDone = WireInit(false.B)
  val dma_start = RegInit(false.B)

  DmaDoneDly := RegNext(io.dma.done)

  posDmaDone := ((!DmaDoneDly) && io.dma.done)




  val fsm = Module(new FlowFSM)

  fsm.io.start := io.start
  fsm.io.next_round_start := io.next_round_start
  fsm.io.dma_valid := io.dma.start
  fsm.io.dma_irq := io.dma.done
  fsm.io.fm_ready := io.usr_ready
  fsm.io.fmRdDone := posDmaDone

  fsm.io.sub_loop_done := sub_loop_done
  fsm.io.loop_done := loop_done
  fsm.io.all_loop_done := all_loop_done


  when(fsm.io.is_sub_loop_done) {
    is_first_round := 1.U
  }.elsewhen(fsm.io.is_round_done) {
    is_first_round := 0.U
  }

  when(sub_loop_done) {
    roundCntReg := 0.U
  }.elsewhen(fsm.io.is_round_done) {
    roundCntReg := roundCntReg + 1.U
  }
  sub_loop_done := (roundCntReg === (io.cfg_sub_loop_time - 1.U)) && fsm.io.is_round_done




  when(loop_done) {
    subLoopCntReg := 0.U
  }.elsewhen(fsm.io.is_sub_loop_done) {
    subLoopCntReg := subLoopCntReg + 1.U
  }

  loop_done := (subLoopCntReg === (io.cfg_loop_time - 1.U)) && fsm.io.is_sub_loop_done

  when(all_loop_done) {
    loopCntReg := 0.U
  }.elsewhen(fsm.io.is_loop_done) {
    loopCntReg := loopCntReg + 1.U
  }
  all_loop_done := (loopCntReg === 0.U) && fsm.io.is_loop_done


  when(fsm.io.is_round_done){
    fmRdCnt := 0.U
  }.elsewhen(io.dma.tready&io.dma.tvalid){
    fmRdCnt := fmRdCnt + 1.U
  }


  when(start_dly(3)){
    subLoopLen := io.cfg_cin.rd_len
  }

  when(start_dly(3)){
    singleRoundLen := io.cfg_cin_size
  }
  fmRdDone := fmRdCnt === singleRoundLen

// generate DMA read address
  when(start_dly(2)){
    fmRdAddr := Cat(io.cfg_cin.base_addr_msb,io.cfg_cin.base_addr)
  }.elsewhen(fsm.io.is_sub_loop_done){
    fmRdAddr := Cat(io.cfg_cin.base_addr_msb,io.cfg_cin.base_addr)
  }.elsewhen(fsm.io.is_round_done) {
    fmRdAddr := Cat(io.cfg_cin.base_addr_msb, io.cfg_cin.base_addr) + subLoopLen
  }

  // generate dma_start
  when(dma_start){
    dma_start := false.B
  }.elsewhen(io.dma.idle & fsm.io.is_fm_start){
    dma_start := true.B
  }

  //
  io.dma.addr := fmRdAddr(AXI_ADDR_W-1,0)
  io.dma.addr_msb := fmRdAddr(AXI_ADDR_W+AXI_ADDR_W-1,AXI_ADDR_W)
  io.dma.start := dma_start
  io.dma.len := subLoopLen
  // user port assignment
  io.usr.tdata := io.dma.tdata
  io.usr.tkeep := io.dma.tkeep
  io.usr.tvalid:= io.dma.tvalid & fsm.io.is_fm_rcv
  io.usr.tlast := io.dma.tvalid & fsm.io.is_fm_rcv
  io.dma.tready:= io.usr.tready

}


//object rd_fm_ctrl extends App{
//  chisel3.Driver.emitVerilog(new rd_fm_ctrl())
//}