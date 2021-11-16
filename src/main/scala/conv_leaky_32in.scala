import chisel3._
import chisel3.util._
import chisel3.experimental._
import lapar_package._



trait Conv_config {
  //data_bits_wide and decimal_bits
  val CONV_DW = 16
  val IN_DECIMAL_BIT = 14
  val WGT_W = 16
  val WT_DECIMAL_BIT = 14
  val BIAS_W = 16
  val BIAS_DECIMAL_BIT = 14
  //figure
  val IM_WIDTH = 256
  val IM_HEIGHT = 256
  val WT_BYTE_NUM = 4
  val KERNEL_LENGTH = 3
  //channel
  val INPUT_CN = 32
  val OUTPUT_CN = 32
  //out data bits and decimal
  val CONV_OUT_W = 38
  val OUT_DECIMAL_BIT = 14
  //

  val KERNEL_SIZE  = KERNEL_LENGTH * KERNEL_LENGTH ;// kernel data size
  val BIAS_SIZE    = OUTPUT_CN * BIAS_W / WGT_W;// bias data size
  val WGT_SIZE     = OUTPUT_CN * INPUT_CN * KERNEL_SIZE;// wgt data size
  val PARAM_SIZE   = WGT_SIZE + BIAS_SIZE;
  val IN_CYC = IM_WIDTH * IM_HEIGHT;  // cycle number of inputing all the image data

  val IN_RAM_ROW   = 3 ;//num of ram of row
  val LAST_LINE_RAM_0 = (IM_HEIGHT + 1) % IN_RAM_ROW;
  val LAST_LINE_RAM_1 = (IM_HEIGHT + 2) % IN_RAM_ROW;
  val AHEAD_AFTER_IN_VAILD = 1 + (KERNEL_LENGTH - 1)/2 + 1;// ram write cyc + fill conv array + ram stable lantency
  val CONV_RD_LATENCY = 7;
  val CONV_RD_AFTER_CAL = 5;
  val ADDR_W = 10 ;//row addr
  val DECIMAL_ALIGN = IN_DECIMAL_BIT + WT_DECIMAL_BIT - BIAS_DECIMAL_BIT;
  val IN_RAM_SIZE = IN_RAM_ROW * IM_WIDTH ;
  val SUM_DECIMAL = IN_DECIMAL_BIT + WT_DECIMAL_BIT;
  val INPUT_CN_WIDTH = log2Ceil( INPUT_CN ); //5
  val CONV_OUTPUT_WIDTH = 2 * CONV_DW + INPUT_CN_WIDTH; //2*16+5
}



class Base_set_IO extends Bundle{
  val clk=Input(Clock())
  val clk_x2=Input(Clock())
  val rst=Input(Bool())
  val ap_start=Input(Bool())
}

class Data_in_IO extends Bundle with Conv_config {
  val conv_in=Input(UInt((INPUT_CN*CONV_DW).W))//
  val conv_in_valid=Input(Bool())
  val param_in=Input(UInt((WT_BYTE_NUM*CONV_DW).W))//
  val param_valid=Input(Bool())
}

class Data_out_IO extends Bundle with Conv_config {
  val conv_in_channel=Output(Vec(INPUT_CN,UInt(CONV_DW.W)))
  val mac_wgt_in=Output(Vec(OUTPUT_CN,UInt((INPUT_CN * KERNEL_SIZE * CONV_DW).W)))
  val conv_in_valid_dn=Output(Vec(4,Bool()))
  val bias_reg=Output(Vec(OUTPUT_CN,UInt(CONV_DW.W)))
  val param_load_complete=Output(Bool())
}

class conv_leaky_32in extends Module with Conv_config{
  val io=IO(new Bundle() {
    val base=new Base_set_IO
    val data_in=new Data_in_IO
    val data_out=new Data_out_IO
//    val rpt_sum_in=Input(UInt((OUTPUT_CN*CONV_DW).W))
//    val bias_or_rpt=Input(UInt(2.W)) //selector for bias and rpt_sum
//
//    val param_load_complete=Output(Bool())
//    val conv_out_before_sum_valid=Output(Bool())
//    val conv_out=Output(UInt((OUTPUT_CN*CONV_OUT_W).W))
//    val conv_out_valid=Output(Bool())
  })


//    new Bundle() {
//         //clk & rst
//    val clk=Input(Clock())
//    val clk_x2=Input(Clock())
//    val rst=Input(Bool())
//    val ap_start=Input(Bool())
//        //
//    val conv_in=Input(UInt((INPUT_CN*CONV_DW).W))//
//    val conv_in_valid=Input(Bool())
//         //wgt bias
//    val param_in=Input(UInt((WT_BYTE_NUM*CONV_DW).W))//
//         // AXI_DATA_W
//    val param_valid=Input(Bool())
         //====== repeat sum =======//
//    val rpt_sum_in=Input(UInt((OUTPUT_CN*CONV_DW).W))
//    val bias_or_rpt=Input(UInt(2.W)) //selector for bias and rpt_sum
//
//    val param_load_complete=Output(Bool())
//    val conv_out_before_sum_valid=Output(Bool())
//    val conv_out=Output(UInt((OUTPUT_CN*CONV_OUT_W).W))
//    val conv_out_valid=Output(Bool())
  //}
//)

//  class Conv_in_IO extends Bundle{
//    val conv_in_reg=Reg(Vec(INPUT_CN,SInt(CONV_DW.W)))
//  }
//  class Param_in_IO extends Bundle{
//    val param_in_reg=Reg(Vector(WT_BYTE_NUM,SInt(CONV_DW.W)))
//  }
//  class Rpt_sum_in_IO extends Bundle{
//    val rpt_sum_in_reg=Reg(Vector(OUTPUT_CN,SInt(CONV_DW.W)))
//  }
//  class Conv_out_IO extends Bundle{
//    val rpt_sum_in_reg=Reg(Vector(OUTPUT_CN,SInt(CONV_OUT_W.W)))
//  }
//  //data segmentation from ports
//  val conv_in_reg=io.conv_in.asTypeOf(new Conv_in_IO).conv_in_reg
//  val param_in_reg=io.param_in.asTypeOf(new Param_in_IO).param_in_reg
//  val rpt_sum_in_reg=io.rpt_sum_in.asTypeOf(new Rpt_sum_in_IO).rpt_sum_in_reg
//  //data valid signal
//  //TODO:val (param_cyc_cnt,io.param_load_complete)=OneShortTimer(io.ap_start,WT_BYTE_NUM,PARAM_SIZE)
//  //封装有效计时器
//
//  io.param_load_complete:=OneShotTimer(io.param_valid,WT_BYTE_NUM,PARAM_SIZE)
//  val wgt_enable=OneShotTimer(io.param_valid,WT_BYTE_NUM,BIAS_SIZE)
//  val bias_enable=(!wgt_enable)

  //此处封装
        class data_process extends BlackBox(Map(
          "CONV_DW          "->  CONV_DW          ,
          "IN_DECIMAL_BIT   "->  IN_DECIMAL_BIT   ,
          "WGT_W            "->  WGT_W            ,
          "WT_DECIMAL_BIT   "->  WT_DECIMAL_BIT   ,
          "BIAS_W           "->  BIAS_W           ,
          "BIAS_DECIMAL_BIT "->  BIAS_DECIMAL_BIT ,
          "IM_WIDTH         "->  IM_WIDTH         ,
          "IM_HEIGHT        "->  IM_HEIGHT        ,
          "WT_BYTE_NUM      "->  WT_BYTE_NUM      ,
          "INPUT_CN         "->  INPUT_CN         ,
          "KERNEL_LENGTH    "->  KERNEL_LENGTH    ,
          "OUTPUT_CN        "->  OUTPUT_CN        ,
          "CONV_OUT_W       "->  CONV_OUT_W       ,
          "OUT_DECIMAL_BIT  "->  OUT_DECIMAL_BIT
        )){
          val io=IO(new Bundle() {
            val base=new Base_set_IO
            val data_in=new Data_in_IO
            val data_out=new Data_out_IO
          })
        }

  val data_seg=Module(new data_process)
  data_seg.io.base:=io.base
  data_seg.io.data_in:=io.data_in
  io.data_out:=data_seg.io.data_out
}

object conv_leaky_32in extends App{
  chisel3.Driver.emitVerilog(new conv_leaky_32in())
}
