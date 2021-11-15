import chisel3._
import chisel3.util._
import lapar_package._



class laparPart0CfgIO extends Bundle with nConfig{
  val reg_loop_time = new CfgIO
  val reg_cin_size = new CfgIO
  val reg_cout_size = new CfgIO
  val reg_kernel_part0_start = new CfgIO
  val reg_cin_base_addr = new CfgIO
  val reg_cin_base_addr_msb = new CfgIO
  val reg_cin_rd_len = new CfgIO
  val reg_cout_base_addr = new CfgIO
  val reg_cout_base_addr_msb = new CfgIO
  val reg_cout_wr_len = new CfgIO
  val reg_param_base_addr = new CfgIO
  val reg_param_base_addr_msb = new CfgIO
  val reg_param_rd_len = new CfgIO
}


class laparPart0StatusIO extends Bundle with nConfig {
  val reg_rd_fm_cin_cnt               =Input(UInt(32.W))
  val reg_rd_fm_dout_cnt              =Input(UInt(32.W))
  val reg_rd_sum_param_din_cnt        =Input(UInt(32.W))
  val reg_rd_sum_cnt                  =Input(UInt(32.W))
  val reg_rd_param_cnt                =Input(UInt(32.W))
  val reg_conv_relu_in_cnt            =Input(UInt(32.W))
  val reg_conv_relu_out_cnt           =Input(UInt(32.W))
  val reg_relu_valid_cnt              =Input(UInt(32.W))
  val reg_layer_out_valid_cnt         =Input(UInt(32.W))
  val reg_wr_fm_din_cnt               =Input(UInt(32.W))
  val reg_wr_fm_dout_cnt              =Input(UInt(32.W))
  val reg_rd_fm_tstvec                =Input(UInt(32.W))
  val reg_rd_sum_param_tstvec         =Input(UInt(32.W))
  val reg_wr_fm_tstvec                =Input(UInt(32.W))
  val reg_part0_kernel_tstvec         =Input(UInt(32.W))
}


class ConvOutChannel extends BlackBox with nConfig{
  val io = IO(new Bundle{
    val clk = Input(Clock())
    val clk_x2 = Input(Clock())
    val mac_in_valid = Input(Bool())
    val mac_in = Input(UInt((INPUT_CN*KERNEL_SIZE*DATA_W).W))
    val wgt_in_valid = Input(Bool())
    val wgt_in_0 = Input(UInt((INPUT_CN*KERNEL_SIZE*DATA_W).W))
    val wgt_in_1 = Input(UInt((INPUT_CN*KERNEL_SIZE*DATA_W).W))
    val conv_out_valid = Output(Bool())
    val conv_cn_out_0 = Output(UInt((INPUT_CN*KERNEL_SIZE*DATA_W).W))
    val conv_cn_out_1 = Output(UInt((INPUT_CN*KERNEL_SIZE*DATA_W).W))
  })
}


//class LeakyRelu extends BlackBox with nConfig{
//  val io = IO(new Bundle() {
//    val clk = Input(Clock)
//    val relu_valid = Input(Bool())
//    val leaky_relu_in_valid = Input(Bool())
//    val leaky_relu_in = Input(UInt((LEAKY_RELU_CN*LEAKY_RELU_IN_DW).W))
//    val leaky_relu_out_valid = Output(Bool())
//    val leaky_relu_out = Output(UInt((LEAKY_RELU_CN*LEAKY_RELU_OUT_DW).W))
//  })
//}


class laparRart0KernelIO extends Bundle{
  val rd_fm = new DmaReadIO
  val rd_sum_param = new DmaReadIO
  val wr_fm = new DmaWriteIO
  val cfg = new laparPart0CfgIO
  val status = new laparPart0StatusIO

}


//class ConvRelu extends Module with nConfig{
//  val io = IO()
//  val UIm2Col = new im2col
//  val UConvOutChannel = new ConvOutChannel // BlackBox
//  val UPostAdder = new PostAdder // Adder for Bias or Sum
//  val ULeakyRelu = new LeakyRelu // BlackBox
//}
//
//
//
//
//class laparPart0Kernel extends Module with nConfig {
//  val io = IO(new laparRart0KernelIO)
//  val URdFmCtrl = new rd_fm_ctrl
//  val URdSumParamCtrl = new rd_sum_param_ctrl
//  val UConvRelu = new ConvRelu
//  val UWrFmCtrl = new wr_fm_ctrl
//
//}
