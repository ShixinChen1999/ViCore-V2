import chisel3._
import chisel3.util._

import lapar_package._

class Rank_Change extends Module with Config {
  val io = IO(new Bundle {
    val input_valid = Input(Bool())
    val dIn = Input(Vec(RAM_GRP + 1, SInt(OUT_BIT_WIDTH.W))) //4进9出
    val dOut = Output(Vec(9, SInt(OUT_BIT_WIDTH.W)))
    val output_valid = Output(Bool())
  })

  val out_temp = VecInit(Seq.fill(3)(0.S(OUT_BIT_WIDTH.W)))


  //val in_valid = io.input_valid
  //val (cnt,cnt_valid)=Counter(in_valid,IN_WIDTH*IN_HIGHT)
  //  val cnt_out_1=cnt/2.U//慢速情况
  //  val cnt_out=cnt_out_1-1.U
  val start = RegNext(io.input_valid)
  val (cnt1, cnt1_valid) = Counter(start, 1)
  val output_valid=RegInit(false.B)
  output_valid:=ShiftRegister(start, 2)
  val (cnt_in, cnt_in_valid) = Conter_pause(start, IN_WIDTH.U,cnt1_valid) //0-17
  val (cnt_out, cnt_out_valid) = Conter_pause(start, (RAM_GRP+1).U, cnt_in_valid) //三种模式

  //when(in_valid){
  //{
  when(cnt_out === 0.U) { //对应读取1，2，3，4 ram
    out_temp(0) := io.dIn(0)
    out_temp(1) := io.dIn(1)
    out_temp(2) := io.dIn(2)
  }.elsewhen(cnt_out === 1.U) {
    out_temp(0) := io.dIn(1)
    out_temp(1) := io.dIn(2)
    out_temp(2) := io.dIn(3)
  }.elsewhen(cnt_out === 2.U) {
    out_temp(0) := io.dIn(2)
    out_temp(1) := io.dIn(3)
    out_temp(2) := io.dIn(0)
  }.elsewhen(cnt_out===3.U){
    out_temp(0) := io.dIn(3)
    out_temp(1) := io.dIn(0)
    out_temp(2) := io.dIn(1)
  }


  //val (cnt_rank, cnt_rank_valid) = Conter_pause(start, 3.U, cnt1_valid)
  val reg_1 = VecInit(Seq.fill(3)(0.S(OUT_BIT_WIDTH.W)))
  val reg_2 = VecInit(Seq.fill(3)(0.S(OUT_BIT_WIDTH.W)))
  val reg_3 = VecInit(Seq.fill(3)(0.S(OUT_BIT_WIDTH.W)))
  //val reg_end=VecInit(Seq.fill(8)(0.S(OUT_BIT_WIDTH.W)))

  reg_1 := RegNext(out_temp)
  reg_2 := RegNext(reg_1)
  reg_3 := RegNext(reg_2)


  when(output_valid&&ShiftRegister(cnt_in,3)<(IN_WIDTH-2).U){
    io.output_valid:=true.B
  }.otherwise{
    io.output_valid:=false.B
  }
  when(output_valid) {
    io.dOut(0) := reg_3(0)
    io.dOut(1) := reg_3(1)
    io.dOut(2) := reg_3(2)
    io.dOut(3) := reg_2(0)
    io.dOut(4) := reg_2(1)
    io.dOut(5) := reg_2(2)
    io.dOut(6) := reg_1(0)
    io.dOut(7) := reg_1(1)
    io.dOut(8) := reg_1(2)

  }.otherwise{
    for(i<-0 until(9)){
      io.dOut(i):=0.S
    }
  }
}




class Transfer_B extends BlackBox with Config {
  val io = IO(new Bundle{
    val clock=Input(Clock())
    val reset=Input(Bool())
    val io_dIn=Input(SInt(IN_BIT_WIDTH.W))
    val io_input_valid=Input(Bool())//输入有效，低电平则为无效
    //val row_finish=Input(Bool())//行结束信号，意味着需要切换RAM,在知道图片大小的情况下，可以忽略这一层
    val io_RAM_OUT_0=Output(SInt(OUT_BIT_WIDTH.W))
    val io_RAM_OUT_1=Output(SInt(OUT_BIT_WIDTH.W))
    val io_RAM_OUT_2=Output(SInt(OUT_BIT_WIDTH.W))
    val io_RAM_OUT_3=Output(SInt(OUT_BIT_WIDTH.W))
    val io_out_valid=Output(Bool())
  })
}

class im2col extends Module with Config {
  val io = IO(new Bundle {
    val dIn=Input(UInt(IN_BIT_WIDTH.W))
    val input_valid=Input(Bool())//输入有效，低电平则为无效
    //val row_finish=Input(Bool())//行结束信号，意味着需要切换RAM,在知道图片大小的情况下，可以忽略这一层
    //val dOut=Output(Vec(OUT_NUM,UInt(OUT_BIT_WIDTH.W)))
    val RAM_OUT=Output(Vec(9,SInt(OUT_BIT_WIDTH.W)))
    val out_valid=Output(Bool())
  })
  val transfer=Module(new Transfer_B)
  val rank_change=Module(new Rank_Change)

  transfer.io.reset:=reset
  transfer.io.clock:=clock
  //data_gen.io.input_valid:=io.input_valid


  //transfer.io.io_dIn_addr:=data_gen.io.dOut_addr

  transfer.io.io_input_valid:=io.input_valid
  transfer.io.io_dIn:=io.dIn.asSInt()

  //reshape
  rank_change.io.input_valid:=transfer.io.io_out_valid
  rank_change.io.dIn(0):=transfer.io.io_RAM_OUT_0
  rank_change.io.dIn(1):=transfer.io.io_RAM_OUT_1
  rank_change.io.dIn(2):=transfer.io.io_RAM_OUT_2
  rank_change.io.dIn(3):=transfer.io.io_RAM_OUT_3

  io.out_valid:=rank_change.io.output_valid
  io.RAM_OUT:=rank_change.io.dOut
}


object im2col extends App{

  chisel3.Driver.emitVerilog(new im2col())

}
