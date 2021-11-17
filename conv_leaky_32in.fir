;buildInfoPackage: chisel3, version: 3.2.4, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit conv_leaky_32in : 
  extmodule data_process : 
    output base : {flip clk : Clock, flip clk_x2 : Clock, flip rst : UInt<1>, flip ap_start : UInt<1>}
    output data_in : {flip conv_in : UInt<512>, flip conv_in_valid : UInt<1>, flip param_in : UInt<64>, flip param_valid : UInt<1>}
    output data_out : {conv_in_channel : UInt<16>[32], mac_wgt_in : UInt<4608>[32], conv_in_valid_dn : UInt<1>[4], bias_reg : UInt<16>[32], param_load_complete : UInt<1>}
    
    defname = data_process
    parameter OUT_DECIMAL_BIT   = 14
    parameter BIAS_DECIMAL_BIT  = 14
    parameter IN_DECIMAL_BIT    = 14
    parameter WT_DECIMAL_BIT    = 14
    parameter WT_BYTE_NUM       = 4
    parameter KERNEL_LENGTH     = 3
    parameter INPUT_CN          = 32
    parameter BIAS_W            = 16
    parameter OUTPUT_CN         = 32
    parameter IM_HEIGHT         = 256
    parameter WGT_W             = 16
    parameter CONV_DW           = 16
    parameter CONV_OUT_W        = 38
    parameter IM_WIDTH          = 256
    
  module conv_leaky_32in : 
    input clock : Clock
    input reset : UInt<1>
    output io : {base : {flip clk : Clock, flip clk_x2 : Clock, flip rst : UInt<1>, flip ap_start : UInt<1>}, data_in : {flip conv_in : UInt<512>, flip conv_in_valid : UInt<1>, flip param_in : UInt<64>, flip param_valid : UInt<1>}, data_out : {conv_in_channel : UInt<16>[32], mac_wgt_in : UInt<4608>[32], conv_in_valid_dn : UInt<1>[4], bias_reg : UInt<16>[32], param_load_complete : UInt<1>}}
    
    inst data_seg of data_process @[conv_leaky_32in.scala 160:22]
    data_seg.data_out is invalid
    data_seg.data_in is invalid
    data_seg.base is invalid
    data_seg.base.ap_start <= io.base.ap_start @[conv_leaky_32in.scala 161:19]
    data_seg.base.rst <= io.base.rst @[conv_leaky_32in.scala 161:19]
    data_seg.base.clk_x2 <= io.base.clk_x2 @[conv_leaky_32in.scala 161:19]
    data_seg.base.clk <= io.base.clk @[conv_leaky_32in.scala 161:19]
    data_seg.data_in.param_valid <= io.data_in.param_valid @[conv_leaky_32in.scala 162:22]
    data_seg.data_in.param_in <= io.data_in.param_in @[conv_leaky_32in.scala 162:22]
    data_seg.data_in.conv_in_valid <= io.data_in.conv_in_valid @[conv_leaky_32in.scala 162:22]
    data_seg.data_in.conv_in <= io.data_in.conv_in @[conv_leaky_32in.scala 162:22]
    io.data_out.param_load_complete <= data_seg.data_out.param_load_complete @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[0] <= data_seg.data_out.bias_reg[0] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[1] <= data_seg.data_out.bias_reg[1] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[2] <= data_seg.data_out.bias_reg[2] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[3] <= data_seg.data_out.bias_reg[3] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[4] <= data_seg.data_out.bias_reg[4] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[5] <= data_seg.data_out.bias_reg[5] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[6] <= data_seg.data_out.bias_reg[6] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[7] <= data_seg.data_out.bias_reg[7] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[8] <= data_seg.data_out.bias_reg[8] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[9] <= data_seg.data_out.bias_reg[9] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[10] <= data_seg.data_out.bias_reg[10] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[11] <= data_seg.data_out.bias_reg[11] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[12] <= data_seg.data_out.bias_reg[12] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[13] <= data_seg.data_out.bias_reg[13] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[14] <= data_seg.data_out.bias_reg[14] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[15] <= data_seg.data_out.bias_reg[15] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[16] <= data_seg.data_out.bias_reg[16] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[17] <= data_seg.data_out.bias_reg[17] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[18] <= data_seg.data_out.bias_reg[18] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[19] <= data_seg.data_out.bias_reg[19] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[20] <= data_seg.data_out.bias_reg[20] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[21] <= data_seg.data_out.bias_reg[21] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[22] <= data_seg.data_out.bias_reg[22] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[23] <= data_seg.data_out.bias_reg[23] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[24] <= data_seg.data_out.bias_reg[24] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[25] <= data_seg.data_out.bias_reg[25] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[26] <= data_seg.data_out.bias_reg[26] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[27] <= data_seg.data_out.bias_reg[27] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[28] <= data_seg.data_out.bias_reg[28] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[29] <= data_seg.data_out.bias_reg[29] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[30] <= data_seg.data_out.bias_reg[30] @[conv_leaky_32in.scala 163:14]
    io.data_out.bias_reg[31] <= data_seg.data_out.bias_reg[31] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_valid_dn[0] <= data_seg.data_out.conv_in_valid_dn[0] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_valid_dn[1] <= data_seg.data_out.conv_in_valid_dn[1] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_valid_dn[2] <= data_seg.data_out.conv_in_valid_dn[2] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_valid_dn[3] <= data_seg.data_out.conv_in_valid_dn[3] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[0] <= data_seg.data_out.mac_wgt_in[0] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[1] <= data_seg.data_out.mac_wgt_in[1] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[2] <= data_seg.data_out.mac_wgt_in[2] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[3] <= data_seg.data_out.mac_wgt_in[3] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[4] <= data_seg.data_out.mac_wgt_in[4] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[5] <= data_seg.data_out.mac_wgt_in[5] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[6] <= data_seg.data_out.mac_wgt_in[6] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[7] <= data_seg.data_out.mac_wgt_in[7] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[8] <= data_seg.data_out.mac_wgt_in[8] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[9] <= data_seg.data_out.mac_wgt_in[9] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[10] <= data_seg.data_out.mac_wgt_in[10] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[11] <= data_seg.data_out.mac_wgt_in[11] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[12] <= data_seg.data_out.mac_wgt_in[12] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[13] <= data_seg.data_out.mac_wgt_in[13] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[14] <= data_seg.data_out.mac_wgt_in[14] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[15] <= data_seg.data_out.mac_wgt_in[15] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[16] <= data_seg.data_out.mac_wgt_in[16] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[17] <= data_seg.data_out.mac_wgt_in[17] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[18] <= data_seg.data_out.mac_wgt_in[18] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[19] <= data_seg.data_out.mac_wgt_in[19] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[20] <= data_seg.data_out.mac_wgt_in[20] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[21] <= data_seg.data_out.mac_wgt_in[21] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[22] <= data_seg.data_out.mac_wgt_in[22] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[23] <= data_seg.data_out.mac_wgt_in[23] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[24] <= data_seg.data_out.mac_wgt_in[24] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[25] <= data_seg.data_out.mac_wgt_in[25] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[26] <= data_seg.data_out.mac_wgt_in[26] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[27] <= data_seg.data_out.mac_wgt_in[27] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[28] <= data_seg.data_out.mac_wgt_in[28] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[29] <= data_seg.data_out.mac_wgt_in[29] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[30] <= data_seg.data_out.mac_wgt_in[30] @[conv_leaky_32in.scala 163:14]
    io.data_out.mac_wgt_in[31] <= data_seg.data_out.mac_wgt_in[31] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[0] <= data_seg.data_out.conv_in_channel[0] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[1] <= data_seg.data_out.conv_in_channel[1] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[2] <= data_seg.data_out.conv_in_channel[2] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[3] <= data_seg.data_out.conv_in_channel[3] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[4] <= data_seg.data_out.conv_in_channel[4] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[5] <= data_seg.data_out.conv_in_channel[5] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[6] <= data_seg.data_out.conv_in_channel[6] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[7] <= data_seg.data_out.conv_in_channel[7] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[8] <= data_seg.data_out.conv_in_channel[8] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[9] <= data_seg.data_out.conv_in_channel[9] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[10] <= data_seg.data_out.conv_in_channel[10] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[11] <= data_seg.data_out.conv_in_channel[11] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[12] <= data_seg.data_out.conv_in_channel[12] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[13] <= data_seg.data_out.conv_in_channel[13] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[14] <= data_seg.data_out.conv_in_channel[14] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[15] <= data_seg.data_out.conv_in_channel[15] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[16] <= data_seg.data_out.conv_in_channel[16] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[17] <= data_seg.data_out.conv_in_channel[17] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[18] <= data_seg.data_out.conv_in_channel[18] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[19] <= data_seg.data_out.conv_in_channel[19] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[20] <= data_seg.data_out.conv_in_channel[20] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[21] <= data_seg.data_out.conv_in_channel[21] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[22] <= data_seg.data_out.conv_in_channel[22] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[23] <= data_seg.data_out.conv_in_channel[23] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[24] <= data_seg.data_out.conv_in_channel[24] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[25] <= data_seg.data_out.conv_in_channel[25] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[26] <= data_seg.data_out.conv_in_channel[26] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[27] <= data_seg.data_out.conv_in_channel[27] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[28] <= data_seg.data_out.conv_in_channel[28] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[29] <= data_seg.data_out.conv_in_channel[29] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[30] <= data_seg.data_out.conv_in_channel[30] @[conv_leaky_32in.scala 163:14]
    io.data_out.conv_in_channel[31] <= data_seg.data_out.conv_in_channel[31] @[conv_leaky_32in.scala 163:14]
    
