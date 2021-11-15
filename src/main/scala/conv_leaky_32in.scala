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


class Conv extends Module with Conv_config{
  val io=IO(new Bundle() {
         //clk & rst
    val clk=Input(Clock())
    val clk_x2=Input(Clock())
    val rsval=Input(Bool())
         //pix
    val ap_start=Input(Bool())
    val conv_in=Input(Vector(INPUT_CN,SInt(CONV_DW.W)))//
    val conv_in_valid=Input(Bool())
         //wgt bias
    val param_in=Input(Vector(WT_BYTE_NUM,SInt(CONV_DW.W)))
         // AXI_DATA_W
    val param_valid=Input(Bool())
         //====== repeat sum =======//
    val bias_or_rpt=Input(UInt(2.W)) //selector for bias and rpt_sum
    val rpt_sum_in=Input(Vector(OUTPUT_CN,SInt(CONV_DW.W)))
    val param_load_complete=Output(Bool())
    val conv_out_before_sum_valid=Output(Bool())
    val conv_out=Output(Vec(OUTPUT_CN,SInt(CONV_OUT_W.W)))
    val conv_out_valid=Output(Bool())
  })




}
