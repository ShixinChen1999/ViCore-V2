package lapar_package

import chisel3._
import chisel3.core.Analog
import chisel3.util._


trait nConfig {
  val AXI_DATA_W = 512
  val AXI_ADDR_W = 32
  val DATA_W = 16
  val BURST_LEN = 26
  val INPUT_CN = 32
  val KERNEL_SIZE = 9
  val LEAKY_RELU_CN = 48
  val LEAKY_RELU_IN_DW = 48
  val LEAKY_RELU_OUT_DW = 48
}

trait Config {
  val IN_HIGHT=360//12*16
  val IN_WIDTH=640////16
  val PADDING=2//左右各一个
  val IN_BIT_WIDTH=8
  val OUT_BIT_WIDTH=8
  val ADDR_WIDTH=10
  val RAM_NUM=2
  val RAM_GRP=3
  val OUT_NUM=4
  val LATANCY=3*(IN_WIDTH)

  val BT_WIDTH=8
  val BT_WIDTH_1=8
  val B_WIDTH=9
  val MUL_WIDTH=10
  val CONW=8
  val MAC_WIDTH=4
  val KERNEL_SIZE=MAC_WIDTH*MAC_WIDTH

  /////////////long_2_short
  val DIN_W=26
  val DOUT_W=8
  val DIN_DECIMAL=14
  val DOUT_DECIMAL=7
}



class AxiCtrlIO extends Bundle with nConfig {
  val araddr   =Output(UInt(32.W))
  val arprot   =Output(UInt(3.W))
  val arready  =Input (Bool())
  val arvalid  =Output(Bool())
  val awaddr   =Output(UInt(32.W))
  val awprot   =Output(UInt(3.W))
  val awready  =Input (Bool())
  val awvalid  =Output(Bool())
  val bready   =Output(Bool())
  val bresp    =Input (UInt(2.W))
  val bvalid   =Input (Bool())
  val rdata    =Input (UInt(32.W))
  val rready   =Output(Bool())
  val rresp    =Input (UInt(2.W))
  val rvalid   =Input (Bool())
  val wdata    =Output(UInt(32.W))
  val wready   =Input (Bool())
  val wstrb    =Output(UInt(4.W))
  val wvalid   =Output(Bool())
}


class DDRAxiCtrlIO extends Bundle with nConfig {
  val araddr   =Input (UInt(32.W))
  val arready  =Output(Bool())
  val arvalid  =Input (Bool())
  val awaddr   =Input (UInt(32.W))
  val awready  =Output(Bool())
  val awvalid  =Input (Bool())
  val bready   =Input (Bool())
  val bresp    =Output(UInt(2.W))
  val bvalid   =Output(Bool())
  val rdata    =Output(UInt(32.W))
  val rready   =Input (Bool())
  val rresp    =Output(UInt(2.W))
  val rvalid   =Output(Bool())
  val wdata    =Input (UInt(32.W))
  val wready   =Output(Bool())
  val wvalid   =Input (Bool())
}


class DDRIO extends Bundle with nConfig {
  val act_n       =Output(Bool())
  val adr         =Output(UInt(17.W))
  val ba          =Output(UInt(2.W))
  val bg          =Output(UInt(2.W))
  val ck_c        =Output(Bool())
  val ck_t        =Output(Bool())
  val cke         =Output(Bool())
  val cs_n        =Output(Bool())
  val dq          =Analog(72.W)
  val dqs_c       =Analog(18.W)
  val dqs_t       =Analog(18.W)
  val odt         =Output(Bool())
  val par         =Output(Bool())
  val reset_n     =Output(Bool())
}


class DmaWriteIO extends Bundle with nConfig {
  val start=Output(Bool())
  val addr=Output(UInt(AXI_ADDR_W.W))
  val len=Output(UInt(BURST_LEN.W))
  val done=Input(Bool())
  val idle=Input(Bool())
  val tdata=Output(UInt(AXI_DATA_W.W))
  val tkeep=Output(UInt((AXI_DATA_W/8).W))
  val tvalid=Output(Bool())
  val tlast=Output(Bool())
  val tready=Input(Bool())
}

class DmaReadIO extends Bundle with nConfig {
  val start       =Output(Bool())
  val addr        =Output(UInt(AXI_ADDR_W.W))
  val addr_msb    =Output(UInt(AXI_ADDR_W.W))
  val len         =Output(UInt(BURST_LEN.W))
  val done        =Input(Bool())
  val idle        =Input(Bool())
  val tdata       =Input(UInt(AXI_DATA_W.W))
  val tkeep       =Input(UInt((AXI_DATA_W/8).W))
  val tvalid      =Input(Bool())
  val tlast       =Input(Bool())
  val tready      =Output(Bool())
}

class DmaReadIO_2 extends Bundle with nConfig {
  val idle      =Output(Bool())
  val irq       =Output(Bool())
  val valid     =Input (Bool())
  val sa        =Input (UInt(32.W))
  val sa_msb    =Input (UInt(32.W))
  val len       =Input (UInt(BURST_LEN.W))
  val tdata     =Output(UInt(AXI_DATA_W.W))
  val tkeep     =Output(UInt((AXI_DATA_W/8).W))
  val tlast     =Output(Bool())
  val tready    =Input (Bool())
  val tvalid    =Output(Bool())
}


class DmaWriteIO_2 extends Bundle with nConfig {
  val idle      =Output(Bool())
  val irq       =Output(Bool())
  val valid     =Input (Bool())
  val da        =Input (UInt(32.W))
  val da_msb    =Input (UInt(32.W))
  val len       =Input (UInt(BURST_LEN.W))
  val tdata     =Input (UInt(AXI_DATA_W.W))
  val tkeep     =Input (UInt((AXI_DATA_W/8).W))
  val tlast     =Input (Bool())
  val tready    =Output(Bool())
  val tvalid    =Input (Bool())
}

class UsrDeqIO extends Bundle with nConfig {
  val tdata=Input(UInt(AXI_DATA_W.W))
  val tkeep=Input(UInt((AXI_DATA_W/8).W))
  val tvalid=Input(Bool())
  val tlast=Input(Bool())
  val tready=Output(Bool())
}

class UsrEnqIO extends Bundle with nConfig {
  val tdata=Output(UInt(AXI_DATA_W.W))
  val tkeep=Output(UInt((AXI_DATA_W/8).W))
  val tvalid=Output(Bool())
  val tlast=Output(Bool())
  val tready=Input(Bool())
}

class BurstCfgIO extends Bundle with nConfig {
  val base_addr     =Input(UInt(32.W))
  val base_addr_msb =Input(UInt(32.W))
  val rd_len        =Input(UInt(32.W))
}


// SystemVerilog blackbox
class RdFmCtrlIO extends Bundle with nConfig{
  val usr           = new UsrEnqIO()
  val dma           = new DmaReadIO()
  val cfg_cin       = new BurstCfgIO()
  val start         = Input(Bool())
  val next_round_start = Input(Bool())
  val usr_ready     = Input(Bool())
  val cfg_sub_loop_time =Input(UInt(32.W))
  val cfg_loop_time     =Input(UInt(32.W))
  val cfg_cin_size      =Input(UInt(32.W))
}

class RdSumParamCtrlIO extends Bundle with nConfig{
  val usr_param     = new UsrEnqIO()
  val usr_sum       = new UsrEnqIO()
  val dma           = new DmaReadIO()
  val cfg_sum       = new BurstCfgIO()
  val cfg_param     = new BurstCfgIO()
  val start         = Input(Bool())
  val next_round_start = Input(Bool())
  val usr_ready = Input(Bool())
  val usr_param_ready = Input(Bool())
  val sub_loop_time =Input(UInt(32.W))
  val loop_time     =Input(UInt(32.W))
  val cin_size      =Input(UInt(32.W))
  val rdDataCnt     =Output(UInt(32.W))
}

class CfgIO extends Bundle with nConfig{
  val strobe = Output(Bool())
  val value  = Output(UInt(32.W))
}


//class OneShortTimer(step: Int,goal_num:Int) extends Module{
//  val io=IO(new Bundle() {
//    val start_vaild=Input(Bool())
//    val cnt=Output(UInt(log2Ceil(goal_num).W))//需要的位数
//    val done=Output(Bool())
//  })
//  val reg = RegInit (goal_num.U(log2Ceil(goal_num).W))
//
//  val done = reg === 0.U
//  val next = RegInit (0.U)
//  when(io.start_vaild){
//    when(! done) {
//      next := reg - step.U
//    }.otherwise{
//      next :=0.U
//    }
//  }
//  reg := next
//  io.cnt:=reg
//  io.done:=done
//}
//
//object OneShortTimer{
//  def apply(valid:Bool,step: Int,goal_num:Int):(UInt,Bool)={
//    val inst=Module(new OneShortTimer(step,goal_num))
//    inst.io.start_vaild:=valid
//    (inst.io.cnt,inst.io.done)
//  }
//}

class OneShotTimer(WT_BYTE_NUM:Int,PARAM_SIZE: Int) extends Module{
  val io=IO(new Bundle() {
    //val rst=Input(Bool())
    //val ap_start=Input(Bool())
    val start_valid=Input(Bool())
    //val clk=Input(Clock())
    val done=Output(Bool())
  })
  val cnt_reg=RegInit(0.U(log2Ceil(PARAM_SIZE).W))
  //when(io.rst){
  //  param_cyc_cnt:= 0.U
  //}.elsewhen(io.ap_start){
  //  param_cyc_cnt:= 0.U
  //}.otherwise{
  cnt_reg:= RegNext(Mux(io.start_valid,cnt_reg+WT_BYTE_NUM.U,cnt_reg))
  //}
  io.done:=(cnt_reg>=PARAM_SIZE.U)
}
object OneShotTimer{
  def apply(valid:Bool,step:Int,goal_num: Int):Bool={
    val inst=Module(new OneShotTimer(step,goal_num))
    inst.io.start_valid:=valid
    inst.io.done
  }
}

class Conter_pause extends Module{
  val io=IO(new Bundle{
    val valid=Input(Bool())
    val goal_num=Input(UInt(12.W))//可配置
    val pulse=Input(Bool())
    val cnt=Output(UInt(12.W))
    val out_valid=Output(Bool())
  })

  val cnt_temp=RegInit(0.U(12.W))
  when(io.valid) {
    when(io.pulse && (io.cnt =/= (io.goal_num - 1.U))) {
      cnt_temp := cnt_temp+ 1.U
      io.out_valid := false.B
    }.elsewhen(io.pulse && (io.cnt === (io.goal_num - 1.U))) {
      cnt_temp := 0.U
      io.out_valid := true.B
    }.otherwise{
      cnt_temp := cnt_temp
      io.out_valid := false.B
    }
  }.otherwise{
    cnt_temp := 0.U
    io.out_valid := false.B
  }

  io.cnt:=cnt_temp
}


object Conter_pause{
  def apply(valid:Bool,goal_num:UInt,pulse:Bool):(UInt,Bool)={
    val inst=Module(new Conter_pause())
    inst.io.valid:=valid
    inst.io.goal_num:=goal_num
    inst.io.pulse:=pulse
    (inst.io.cnt,inst.io.out_valid)
  }
}

class DualPortRAM_IO extends Bundle{
  val clock  = Input(Clock())
  val reset = Input(Bool())
  val io_in_addr = Input(UInt(10.W))//输入地址
  val io_dataIn = Input(UInt(16.W))//输入数据
  val io_input_valid = Input(Bool())//表示信号写有效
  val io_output_addr =Input(UInt(10.W))
  val io_output_valid = Input(Bool())//表示信号读有效
  val io_dataOut = Output(UInt(16.W))
}
class DualPortRAM extends BlackBox{
  val io=IO(new DualPortRAM_IO)
}