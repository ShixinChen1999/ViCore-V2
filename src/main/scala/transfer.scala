import chisel3._
import chisel3.util._

import lapar_package._

class Transfer extends Module with Config{
  val io=IO(new Bundle{
    val dIn=Input(UInt(IN_BIT_WIDTH.W))
    val input_valid=Input(Bool())//输入有效，低电平则为无效
    //val row_finish=Input(Bool())//行结束信号，意味着需要切换RAM,在知道图片大小的情况下，可以忽略这一层
    //val dOut=Output(Vec(OUT_NUM,UInt(OUT_BIT_WIDTH.W)))
    val RAM_OUT=Output(Vec(RAM_GRP+1,SInt(OUT_BIT_WIDTH.W)))
    val out_valid=Output(Bool())
  })


  def ram_write(RAM:DualPortRAM_IO,address:UInt,data:UInt)={
    RAM.clock:=clock
    RAM.reset:=reset
    RAM.io_input_valid:=true.B
    RAM.io_in_addr:=address
    RAM.io_dataIn:=data
    RAM.io_output_valid:=DontCare
    RAM.io_output_addr:=DontCare
    RAM.io_dataOut:=DontCare
  }
  def ram_read(RAM:DualPortRAM_IO,address:UInt):UInt={
    RAM.clock:=clock
    RAM.reset:=reset
    RAM.io_input_valid:=DontCare
    RAM.io_in_addr:=DontCare
    RAM.io_dataIn:=DontCare
    RAM.io_output_valid:=true.B
    RAM.io_output_addr:=address
    RAM.io_dataOut
  }
  def ram_keep(RAM:DualPortRAM_IO)={
    RAM.clock:=clock
    RAM.reset:=reset
    RAM.io_input_valid:=false.B
    RAM.io_in_addr:=DontCare
    RAM.io_dataIn:=DontCare
    RAM.io_output_valid:=false.B
    RAM.io_output_addr:=DontCare
    RAM.io_dataOut:=DontCare
  }



  //先存储零

  val (cnt,cnt_valid)=Counter(RegNext(io.input_valid),(IN_WIDTH))

  //行计数器
  //val (cnt_col,cnt_col_valid)=Conter_pause(io.input_valid,(IN_HIGHT+2).U,cnt_valid)
  //SRAM计数器
  val (cnt_ram,cnt_ram_valid)=Conter_pause(io.input_valid,(RAM_GRP+1).U,cnt_valid)
  //val (cnt_1,cnt_valid_1)=Counter(io.input_valid,IN_HIGHT*IN_WIDTH)
  val U_ram=VecInit(Seq.fill(RAM_GRP+1)(Module(new DualPortRAM).io))//能否使用二维数组


  when(io.input_valid){
    when(cnt_ram===0.U){
        ram_write(U_ram(0),cnt,io.dIn)
        ram_keep(U_ram(1))
        ram_keep(U_ram(2))
        ram_keep(U_ram(3))


    }.elsewhen(cnt_ram===1.U){

//      when(start||end){
//        ram_write(U_ram(1),cnt,0.U)
//      }.otherwise{
        ram_write(U_ram(1),cnt,io.dIn)
 //    }
      ram_keep(U_ram(0))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
    }.elsewhen(cnt_ram===2.U){

      ram_write(U_ram(2),cnt,io.dIn)
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(3))
    }.elsewhen(cnt_ram===3.U){
      ram_write(U_ram(3),cnt,io.dIn)
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
    }.otherwise{
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
    }
  }.otherwise{
    ram_keep(U_ram(0))
    ram_keep(U_ram(1))
    ram_keep(U_ram(2))
    ram_keep(U_ram(3))
  }


  val (cnt_inter,cnt_inter_valid)=Counter(io.input_valid,LATANCY)//
  val out_valid=RegInit(false.B)

  when(cnt_inter_valid){
    out_valid:=true.B
  }

  when(out_valid){
    out_valid:=true.B
  }

  io.out_valid:=RegNext(out_valid)
  val (cnt2,cnt2_valid)=Counter(out_valid,1)//1个周期读一拍
  val (cnt_ram_out,cnt_ram_out_valid)=Conter_pause(out_valid,(IN_WIDTH).U,cnt2_valid)//三种模式
  val (cnt_out,cnt_out_valid)=Conter_pause(out_valid,(RAM_GRP+1).U,cnt_ram_out_valid)//三种模式

  val out_temp=Reg(Vec((RAM_GRP+1),UInt(IN_BIT_WIDTH.W)))
  //VecInit(Seq.fill(4)(0.U(IN_BIT_WIDTH.W)))



  when(out_valid){
    when(cnt_out===0.U){
      out_temp(0):=ram_read(U_ram(0),cnt_ram_out)
      out_temp(1):=ram_read(U_ram(1),cnt_ram_out)
      out_temp(2):=ram_read(U_ram(2),cnt_ram_out)
    }.elsewhen(cnt_out===1.U){
      out_temp(0):=ram_read(U_ram(1),cnt_ram_out)
      out_temp(1):=ram_read(U_ram(2),cnt_ram_out)
      out_temp(2):=ram_read(U_ram(3),cnt_ram_out)

    }.elsewhen(cnt_out===2.U){
      out_temp(0):=ram_read(U_ram(2),cnt_ram_out)
      out_temp(1):=ram_read(U_ram(3),cnt_ram_out)
      out_temp(2):=ram_read(U_ram(0),cnt_ram_out)
    }.elsewhen(cnt_out===3.U){
      out_temp(0):=ram_read(U_ram(3),cnt_ram_out)
      out_temp(1):=ram_read(U_ram(0),cnt_ram_out)
      out_temp(2):=ram_read(U_ram(1),cnt_ram_out)
    }
  }


  for(i <- 0 until RAM_GRP+1 ){

    io.RAM_OUT(i):= U_ram(i).io_dataOut.asSInt()
  }
}



//object Transfer extends App{
//
//  chisel3.Driver.emitVerilog(new Transfer())
//
//}

