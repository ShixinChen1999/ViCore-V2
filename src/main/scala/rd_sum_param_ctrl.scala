import chisel3._
import chisel3.util._
import lapar_package._

class RdSumParamFlowFSM extends Module {
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
    val param_rd_len = Input(UInt(32.W))
    val param_ready = Input(Bool())
    val paramRdDone = Input(Bool())

    val is_param_start = Output(Bool())
    val is_param_rcv = Output(Bool())
    val is_fm_start = Output(Bool())
    val is_fm_rcv = Output(Bool())
    val is_round_done = Output(Bool())
    val is_sub_loop_done = Output(Bool())
    val is_loop_done = Output(Bool())
    val stateReg = Output(UInt(8.W))
  })
  val idle :: param_chk :: param_start :: param_rcv :: fm_chk :: fm_start :: fm_rcv :: round_done :: sub_loop_done :: loop_done :: wait_next_round :: all_loop_done :: Nil = Enum(12)
  val stateReg = RegInit(idle)
  io.stateReg := stateReg
  io.is_param_start := stateReg === param_start
  io.is_param_rcv := stateReg === param_rcv
  io.is_fm_start := stateReg === fm_start
  io.is_fm_rcv := stateReg === fm_rcv
  io.is_round_done := stateReg === round_done
  io.is_sub_loop_done := stateReg === sub_loop_done
  io.is_loop_done := stateReg === loop_done

  switch(stateReg) {
    is(idle) {
      when(io.start && (io.param_rd_len === 0.U)) {
        stateReg := fm_chk
      }.elsewhen(io.start) {
        stateReg := param_chk
      }
    }
    is(param_chk) {
      when(io.paramRdDone || (!io.param_ready)) {
        stateReg := fm_chk
      }.elsewhen(io.fm_ready) {
        stateReg := param_start
      }
    }
    is(param_start) {
      when(io.dma_valid) {
        stateReg := param_rcv
      }
    }
    is(param_rcv) {
      when(io.dma_irq) {
        stateReg := wait_next_round
      }
    }
    is(fm_chk) {
      when(io.fmRdDone) {
        stateReg := round_done
      }.elsewhen(io.fm_ready) {
        stateReg := fm_start
      }
    }
    is(fm_start) {
      when(io.dma_valid) {
        stateReg := fm_rcv
      }
    }
    is(fm_rcv) {
      when(io.dma_irq) {
        stateReg := round_done
      }
    }
    is(round_done) {
      when(io.sub_loop_done) {
        stateReg := sub_loop_done
      }.otherwise {
        stateReg := wait_next_round
      }
    }
    is(sub_loop_done) {
      when(io.loop_done) {
        stateReg := loop_done
      }.otherwise {
        stateReg := wait_next_round
      }
    }
    is(loop_done) {
      when(io.all_loop_done) {
        stateReg := all_loop_done
      }.otherwise {
        stateReg := wait_next_round
      }
    }
    is(wait_next_round) {
      when(io.next_round_start) {
        stateReg := fm_chk
      }.otherwise {
        stateReg := wait_next_round
      }
    }
    is(all_loop_done) {
      stateReg := idle
    }
  }
}

class rd_sum_param_ctrl extends Module with nConfig {
  val io = IO(new RdSumParamCtrlIO)


  // flow control FSM


  val start_dly = RegInit(0.U(4.W))
  start_dly := Cat(start_dly(2, 0), io.start)

  val is_first_round = RegInit(1.U)
  val roundCntReg = RegInit(0.U(4.W))
  val subLoopCntReg = RegInit(0.U(4.W))
  val loopCntReg = RegInit(0.U(4.W))

  val loop_done = WireInit(false.B)
  val sub_loop_done = WireInit(false.B)
  val all_loop_done = WireInit(false.B)

  val posDmaDone = WireInit(false.B)
  val DmaDoneDly = RegInit(false.B)
  val fmRdAddr = RegInit(0.U)
  val paramRdLen = RegInit(0.U(BURST_LEN.W))
  val paramRdAddr = RegInit(0.U)
  val dma_start = RegInit(false.B)
  val paramDmaStart = RegInit(false.B)
  val fmRdCnt = RegInit(0.U(32.W))
  val subLoopLen = RegInit(0.U(BURST_LEN.W))
  val singleRoundLen = RegInit(0.U)
  val fmRdDone = WireInit(false.B)
  val dmaRdCnt = RegInit(0.U(32.W))


  DmaDoneDly := RegNext(io.dma.done)

  posDmaDone := ((!DmaDoneDly) && io.dma.done)




  val fsm = Module(new RdSumParamFlowFSM)

  fsm.io.start := start_dly(3)
  fsm.io.next_round_start := io.next_round_start
  fsm.io.dma_valid := io.dma.start
  fsm.io.dma_irq := io.dma.done
  fsm.io.fm_ready := io.usr_ready
  fsm.io.sub_loop_done := sub_loop_done
  fsm.io.loop_done := loop_done
  fsm.io.all_loop_done := all_loop_done
  fsm.io.fmRdDone := fmRdDone
  fsm.io.param_rd_len := paramRdLen
  fsm.io.param_ready := io.usr_param_ready
  fsm.io.paramRdDone := posDmaDone



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
  sub_loop_done := (roundCntReg === (io.sub_loop_time - 2.U)) && fsm.io.is_round_done




  when(loop_done) {
    subLoopCntReg := 0.U
  }.elsewhen(fsm.io.is_sub_loop_done) {
    subLoopCntReg := subLoopCntReg + 1.U
  }

  loop_done := (subLoopCntReg === (io.loop_time - 1.U)) && fsm.io.is_sub_loop_done

  when(all_loop_done) {
    loopCntReg := 0.U
  }.elsewhen(fsm.io.is_loop_done) {
    loopCntReg := loopCntReg + 1.U
  }
  all_loop_done := (loopCntReg === 0.U) && fsm.io.is_loop_done


  when(fmRdDone){
    fmRdCnt := 0.U
  }.elsewhen(io.dma.tready&io.dma.tvalid&fsm.io.is_fm_rcv){
    fmRdCnt := fmRdCnt + 1.U
  }

  when(start_dly(0)){
    singleRoundLen := io.cin_size
  }
  fmRdDone := (fmRdCnt === singleRoundLen-1.U) && io.dma.tready&io.dma.tvalid&fsm.io.is_fm_rcv

  when(io.dma.tready&io.dma.tvalid){
    dmaRdCnt := dmaRdCnt + 1.U
  }

  io.rdDataCnt := dmaRdCnt

  when(start_dly(0)){
    subLoopLen := io.cin_size << log2Ceil(AXI_DATA_W/8)
  }

// generate feature DMA address
  when(start_dly(0)){
    fmRdAddr := Cat(io.cfg_sum.base_addr_msb,io.cfg_sum.base_addr)
  }.elsewhen(fsm.io.is_sub_loop_done){
    fmRdAddr := fmRdAddr + (singleRoundLen << log2Ceil(AXI_DATA_W/8))
  }

  when(start_dly(0)){
    paramRdLen := io.cfg_param.rd_len
  }

// generate Parameter DMA address
  when(start_dly(0)){
    paramRdAddr := Cat(io.cfg_param.base_addr_msb, io.cfg_param.base_addr)
  }


  // generate Sum dma_start
  when(dma_start){
    dma_start := false.B
  }.elsewhen(io.dma.idle & fsm.io.is_fm_start){
    dma_start := true.B
  }

  // generate parameter dma_start
  when(paramDmaStart){
    paramDmaStart := false.B
  }.elsewhen(io.dma.idle & fsm.io.is_param_start){
    paramDmaStart := true.B
  }

  //
  io.dma.addr := Mux(fsm.io.is_fm_start, fmRdAddr(AXI_ADDR_W-1,0),
    Mux(fsm.io.is_param_start, paramRdAddr(AXI_ADDR_W-1,0),0.U))
  io.dma.addr_msb := Mux(fsm.io.is_fm_start, fmRdAddr(AXI_ADDR_W+AXI_ADDR_W-1,AXI_ADDR_W),
    Mux(fsm.io.is_param_start, paramRdAddr(AXI_ADDR_W+AXI_ADDR_W-1,AXI_ADDR_W),0.U))
  io.dma.start := Mux(fsm.io.is_fm_start, dma_start,
    Mux(fsm.io.is_param_start,paramDmaStart,false.B))
  io.dma.len := Mux(fsm.io.is_fm_start, subLoopLen,
    Mux(fsm.io.is_param_start,paramRdLen,0.U))


  // user port assignment
  io.usr_sum.tdata := io.dma.tdata
  io.usr_sum.tkeep := io.dma.tkeep
  io.usr_sum.tvalid:= io.dma.tvalid & fsm.io.is_fm_rcv
  io.usr_sum.tlast := io.dma.tlast & fsm.io.is_fm_rcv
  io.usr_param.tdata := io.dma.tdata
  io.usr_param.tkeep := io.dma.tkeep
  io.usr_param.tvalid:= io.dma.tvalid & fsm.io.is_param_rcv
  io.usr_param.tlast := io.dma.tlast & fsm.io.is_param_rcv
  io.dma.tready:= fsm.io.is_fm_rcv&io.usr_sum.tready | fsm.io.is_param_rcv&io.usr_param.tready

}

object rd_sum_param_ctrl extends App{
  chisel3.Driver.emitVerilog(new rd_sum_param_ctrl())
}