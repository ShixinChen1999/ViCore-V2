module conv_leaky_32in(
  input           clock,
  input           reset,
  input           io_base_clk,
  input           io_base_clk_x2,
  input           io_base_rst,
  input           io_base_ap_start,
  input  [511:0]  io_data_in_conv_in,
  input           io_data_in_conv_in_valid,
  input  [63:0]   io_data_in_param_in,
  input           io_data_in_param_valid,
  output [15:0]   io_data_out_conv_in_channel_0,
  output [15:0]   io_data_out_conv_in_channel_1,
  output [15:0]   io_data_out_conv_in_channel_2,
  output [15:0]   io_data_out_conv_in_channel_3,
  output [15:0]   io_data_out_conv_in_channel_4,
  output [15:0]   io_data_out_conv_in_channel_5,
  output [15:0]   io_data_out_conv_in_channel_6,
  output [15:0]   io_data_out_conv_in_channel_7,
  output [15:0]   io_data_out_conv_in_channel_8,
  output [15:0]   io_data_out_conv_in_channel_9,
  output [15:0]   io_data_out_conv_in_channel_10,
  output [15:0]   io_data_out_conv_in_channel_11,
  output [15:0]   io_data_out_conv_in_channel_12,
  output [15:0]   io_data_out_conv_in_channel_13,
  output [15:0]   io_data_out_conv_in_channel_14,
  output [15:0]   io_data_out_conv_in_channel_15,
  output [15:0]   io_data_out_conv_in_channel_16,
  output [15:0]   io_data_out_conv_in_channel_17,
  output [15:0]   io_data_out_conv_in_channel_18,
  output [15:0]   io_data_out_conv_in_channel_19,
  output [15:0]   io_data_out_conv_in_channel_20,
  output [15:0]   io_data_out_conv_in_channel_21,
  output [15:0]   io_data_out_conv_in_channel_22,
  output [15:0]   io_data_out_conv_in_channel_23,
  output [15:0]   io_data_out_conv_in_channel_24,
  output [15:0]   io_data_out_conv_in_channel_25,
  output [15:0]   io_data_out_conv_in_channel_26,
  output [15:0]   io_data_out_conv_in_channel_27,
  output [15:0]   io_data_out_conv_in_channel_28,
  output [15:0]   io_data_out_conv_in_channel_29,
  output [15:0]   io_data_out_conv_in_channel_30,
  output [15:0]   io_data_out_conv_in_channel_31,
  output [4607:0] io_data_out_mac_wgt_in_0,
  output [4607:0] io_data_out_mac_wgt_in_1,
  output [4607:0] io_data_out_mac_wgt_in_2,
  output [4607:0] io_data_out_mac_wgt_in_3,
  output [4607:0] io_data_out_mac_wgt_in_4,
  output [4607:0] io_data_out_mac_wgt_in_5,
  output [4607:0] io_data_out_mac_wgt_in_6,
  output [4607:0] io_data_out_mac_wgt_in_7,
  output [4607:0] io_data_out_mac_wgt_in_8,
  output [4607:0] io_data_out_mac_wgt_in_9,
  output [4607:0] io_data_out_mac_wgt_in_10,
  output [4607:0] io_data_out_mac_wgt_in_11,
  output [4607:0] io_data_out_mac_wgt_in_12,
  output [4607:0] io_data_out_mac_wgt_in_13,
  output [4607:0] io_data_out_mac_wgt_in_14,
  output [4607:0] io_data_out_mac_wgt_in_15,
  output [4607:0] io_data_out_mac_wgt_in_16,
  output [4607:0] io_data_out_mac_wgt_in_17,
  output [4607:0] io_data_out_mac_wgt_in_18,
  output [4607:0] io_data_out_mac_wgt_in_19,
  output [4607:0] io_data_out_mac_wgt_in_20,
  output [4607:0] io_data_out_mac_wgt_in_21,
  output [4607:0] io_data_out_mac_wgt_in_22,
  output [4607:0] io_data_out_mac_wgt_in_23,
  output [4607:0] io_data_out_mac_wgt_in_24,
  output [4607:0] io_data_out_mac_wgt_in_25,
  output [4607:0] io_data_out_mac_wgt_in_26,
  output [4607:0] io_data_out_mac_wgt_in_27,
  output [4607:0] io_data_out_mac_wgt_in_28,
  output [4607:0] io_data_out_mac_wgt_in_29,
  output [4607:0] io_data_out_mac_wgt_in_30,
  output [4607:0] io_data_out_mac_wgt_in_31,
  output          io_data_out_conv_in_valid_dn_0,
  output          io_data_out_conv_in_valid_dn_1,
  output          io_data_out_conv_in_valid_dn_2,
  output          io_data_out_conv_in_valid_dn_3,
  output [15:0]   io_data_out_bias_reg_0,
  output [15:0]   io_data_out_bias_reg_1,
  output [15:0]   io_data_out_bias_reg_2,
  output [15:0]   io_data_out_bias_reg_3,
  output [15:0]   io_data_out_bias_reg_4,
  output [15:0]   io_data_out_bias_reg_5,
  output [15:0]   io_data_out_bias_reg_6,
  output [15:0]   io_data_out_bias_reg_7,
  output [15:0]   io_data_out_bias_reg_8,
  output [15:0]   io_data_out_bias_reg_9,
  output [15:0]   io_data_out_bias_reg_10,
  output [15:0]   io_data_out_bias_reg_11,
  output [15:0]   io_data_out_bias_reg_12,
  output [15:0]   io_data_out_bias_reg_13,
  output [15:0]   io_data_out_bias_reg_14,
  output [15:0]   io_data_out_bias_reg_15,
  output [15:0]   io_data_out_bias_reg_16,
  output [15:0]   io_data_out_bias_reg_17,
  output [15:0]   io_data_out_bias_reg_18,
  output [15:0]   io_data_out_bias_reg_19,
  output [15:0]   io_data_out_bias_reg_20,
  output [15:0]   io_data_out_bias_reg_21,
  output [15:0]   io_data_out_bias_reg_22,
  output [15:0]   io_data_out_bias_reg_23,
  output [15:0]   io_data_out_bias_reg_24,
  output [15:0]   io_data_out_bias_reg_25,
  output [15:0]   io_data_out_bias_reg_26,
  output [15:0]   io_data_out_bias_reg_27,
  output [15:0]   io_data_out_bias_reg_28,
  output [15:0]   io_data_out_bias_reg_29,
  output [15:0]   io_data_out_bias_reg_30,
  output [15:0]   io_data_out_bias_reg_31,
  output          io_data_out_param_load_complete
);
  wire  data_seg_base_clk; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_base_clk_x2; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_base_rst; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_base_ap_start; // @[conv_leaky_32in.scala 160:22]
  wire [511:0] data_seg_data_in_conv_in; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_data_in_conv_in_valid; // @[conv_leaky_32in.scala 160:22]
  wire [63:0] data_seg_data_in_param_in; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_data_in_param_valid; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_0; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_1; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_2; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_3; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_4; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_5; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_6; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_7; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_8; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_9; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_10; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_11; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_12; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_13; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_14; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_15; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_16; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_17; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_18; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_19; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_20; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_21; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_22; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_23; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_24; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_25; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_26; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_27; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_28; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_29; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_30; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_conv_in_channel_31; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_0; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_1; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_2; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_3; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_4; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_5; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_6; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_7; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_8; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_9; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_10; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_11; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_12; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_13; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_14; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_15; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_16; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_17; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_18; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_19; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_20; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_21; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_22; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_23; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_24; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_25; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_26; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_27; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_28; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_29; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_30; // @[conv_leaky_32in.scala 160:22]
  wire [4607:0] data_seg_data_out_mac_wgt_in_31; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_data_out_conv_in_valid_dn_0; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_data_out_conv_in_valid_dn_1; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_data_out_conv_in_valid_dn_2; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_data_out_conv_in_valid_dn_3; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_0; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_1; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_2; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_3; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_4; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_5; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_6; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_7; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_8; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_9; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_10; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_11; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_12; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_13; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_14; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_15; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_16; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_17; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_18; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_19; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_20; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_21; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_22; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_23; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_24; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_25; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_26; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_27; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_28; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_29; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_30; // @[conv_leaky_32in.scala 160:22]
  wire [15:0] data_seg_data_out_bias_reg_31; // @[conv_leaky_32in.scala 160:22]
  wire  data_seg_data_out_param_load_complete; // @[conv_leaky_32in.scala 160:22]
  data_process #(.OUT_DECIMAL_BIT  (14), .BIAS_DECIMAL_BIT (14), .IN_DECIMAL_BIT   (14), .WT_DECIMAL_BIT   (14), .WT_BYTE_NUM      (4), .KERNEL_LENGTH    (3), .INPUT_CN         (32), .BIAS_W           (16), .OUTPUT_CN        (32), .IM_HEIGHT        (256), .WGT_W            (16), .CONV_DW          (16), .CONV_OUT_W       (38), .IM_WIDTH         (256)) data_seg ( // @[conv_leaky_32in.scala 160:22]
    .base_clk(data_seg_base_clk),
    .base_clk_x2(data_seg_base_clk_x2),
    .base_rst(data_seg_base_rst),
    .base_ap_start(data_seg_base_ap_start),
    .data_in_conv_in(data_seg_data_in_conv_in),
    .data_in_conv_in_valid(data_seg_data_in_conv_in_valid),
    .data_in_param_in(data_seg_data_in_param_in),
    .data_in_param_valid(data_seg_data_in_param_valid),
    .data_out_conv_in_channel_0(data_seg_data_out_conv_in_channel_0),
    .data_out_conv_in_channel_1(data_seg_data_out_conv_in_channel_1),
    .data_out_conv_in_channel_2(data_seg_data_out_conv_in_channel_2),
    .data_out_conv_in_channel_3(data_seg_data_out_conv_in_channel_3),
    .data_out_conv_in_channel_4(data_seg_data_out_conv_in_channel_4),
    .data_out_conv_in_channel_5(data_seg_data_out_conv_in_channel_5),
    .data_out_conv_in_channel_6(data_seg_data_out_conv_in_channel_6),
    .data_out_conv_in_channel_7(data_seg_data_out_conv_in_channel_7),
    .data_out_conv_in_channel_8(data_seg_data_out_conv_in_channel_8),
    .data_out_conv_in_channel_9(data_seg_data_out_conv_in_channel_9),
    .data_out_conv_in_channel_10(data_seg_data_out_conv_in_channel_10),
    .data_out_conv_in_channel_11(data_seg_data_out_conv_in_channel_11),
    .data_out_conv_in_channel_12(data_seg_data_out_conv_in_channel_12),
    .data_out_conv_in_channel_13(data_seg_data_out_conv_in_channel_13),
    .data_out_conv_in_channel_14(data_seg_data_out_conv_in_channel_14),
    .data_out_conv_in_channel_15(data_seg_data_out_conv_in_channel_15),
    .data_out_conv_in_channel_16(data_seg_data_out_conv_in_channel_16),
    .data_out_conv_in_channel_17(data_seg_data_out_conv_in_channel_17),
    .data_out_conv_in_channel_18(data_seg_data_out_conv_in_channel_18),
    .data_out_conv_in_channel_19(data_seg_data_out_conv_in_channel_19),
    .data_out_conv_in_channel_20(data_seg_data_out_conv_in_channel_20),
    .data_out_conv_in_channel_21(data_seg_data_out_conv_in_channel_21),
    .data_out_conv_in_channel_22(data_seg_data_out_conv_in_channel_22),
    .data_out_conv_in_channel_23(data_seg_data_out_conv_in_channel_23),
    .data_out_conv_in_channel_24(data_seg_data_out_conv_in_channel_24),
    .data_out_conv_in_channel_25(data_seg_data_out_conv_in_channel_25),
    .data_out_conv_in_channel_26(data_seg_data_out_conv_in_channel_26),
    .data_out_conv_in_channel_27(data_seg_data_out_conv_in_channel_27),
    .data_out_conv_in_channel_28(data_seg_data_out_conv_in_channel_28),
    .data_out_conv_in_channel_29(data_seg_data_out_conv_in_channel_29),
    .data_out_conv_in_channel_30(data_seg_data_out_conv_in_channel_30),
    .data_out_conv_in_channel_31(data_seg_data_out_conv_in_channel_31),
    .data_out_mac_wgt_in_0(data_seg_data_out_mac_wgt_in_0),
    .data_out_mac_wgt_in_1(data_seg_data_out_mac_wgt_in_1),
    .data_out_mac_wgt_in_2(data_seg_data_out_mac_wgt_in_2),
    .data_out_mac_wgt_in_3(data_seg_data_out_mac_wgt_in_3),
    .data_out_mac_wgt_in_4(data_seg_data_out_mac_wgt_in_4),
    .data_out_mac_wgt_in_5(data_seg_data_out_mac_wgt_in_5),
    .data_out_mac_wgt_in_6(data_seg_data_out_mac_wgt_in_6),
    .data_out_mac_wgt_in_7(data_seg_data_out_mac_wgt_in_7),
    .data_out_mac_wgt_in_8(data_seg_data_out_mac_wgt_in_8),
    .data_out_mac_wgt_in_9(data_seg_data_out_mac_wgt_in_9),
    .data_out_mac_wgt_in_10(data_seg_data_out_mac_wgt_in_10),
    .data_out_mac_wgt_in_11(data_seg_data_out_mac_wgt_in_11),
    .data_out_mac_wgt_in_12(data_seg_data_out_mac_wgt_in_12),
    .data_out_mac_wgt_in_13(data_seg_data_out_mac_wgt_in_13),
    .data_out_mac_wgt_in_14(data_seg_data_out_mac_wgt_in_14),
    .data_out_mac_wgt_in_15(data_seg_data_out_mac_wgt_in_15),
    .data_out_mac_wgt_in_16(data_seg_data_out_mac_wgt_in_16),
    .data_out_mac_wgt_in_17(data_seg_data_out_mac_wgt_in_17),
    .data_out_mac_wgt_in_18(data_seg_data_out_mac_wgt_in_18),
    .data_out_mac_wgt_in_19(data_seg_data_out_mac_wgt_in_19),
    .data_out_mac_wgt_in_20(data_seg_data_out_mac_wgt_in_20),
    .data_out_mac_wgt_in_21(data_seg_data_out_mac_wgt_in_21),
    .data_out_mac_wgt_in_22(data_seg_data_out_mac_wgt_in_22),
    .data_out_mac_wgt_in_23(data_seg_data_out_mac_wgt_in_23),
    .data_out_mac_wgt_in_24(data_seg_data_out_mac_wgt_in_24),
    .data_out_mac_wgt_in_25(data_seg_data_out_mac_wgt_in_25),
    .data_out_mac_wgt_in_26(data_seg_data_out_mac_wgt_in_26),
    .data_out_mac_wgt_in_27(data_seg_data_out_mac_wgt_in_27),
    .data_out_mac_wgt_in_28(data_seg_data_out_mac_wgt_in_28),
    .data_out_mac_wgt_in_29(data_seg_data_out_mac_wgt_in_29),
    .data_out_mac_wgt_in_30(data_seg_data_out_mac_wgt_in_30),
    .data_out_mac_wgt_in_31(data_seg_data_out_mac_wgt_in_31),
    .data_out_conv_in_valid_dn_0(data_seg_data_out_conv_in_valid_dn_0),
    .data_out_conv_in_valid_dn_1(data_seg_data_out_conv_in_valid_dn_1),
    .data_out_conv_in_valid_dn_2(data_seg_data_out_conv_in_valid_dn_2),
    .data_out_conv_in_valid_dn_3(data_seg_data_out_conv_in_valid_dn_3),
    .data_out_bias_reg_0(data_seg_data_out_bias_reg_0),
    .data_out_bias_reg_1(data_seg_data_out_bias_reg_1),
    .data_out_bias_reg_2(data_seg_data_out_bias_reg_2),
    .data_out_bias_reg_3(data_seg_data_out_bias_reg_3),
    .data_out_bias_reg_4(data_seg_data_out_bias_reg_4),
    .data_out_bias_reg_5(data_seg_data_out_bias_reg_5),
    .data_out_bias_reg_6(data_seg_data_out_bias_reg_6),
    .data_out_bias_reg_7(data_seg_data_out_bias_reg_7),
    .data_out_bias_reg_8(data_seg_data_out_bias_reg_8),
    .data_out_bias_reg_9(data_seg_data_out_bias_reg_9),
    .data_out_bias_reg_10(data_seg_data_out_bias_reg_10),
    .data_out_bias_reg_11(data_seg_data_out_bias_reg_11),
    .data_out_bias_reg_12(data_seg_data_out_bias_reg_12),
    .data_out_bias_reg_13(data_seg_data_out_bias_reg_13),
    .data_out_bias_reg_14(data_seg_data_out_bias_reg_14),
    .data_out_bias_reg_15(data_seg_data_out_bias_reg_15),
    .data_out_bias_reg_16(data_seg_data_out_bias_reg_16),
    .data_out_bias_reg_17(data_seg_data_out_bias_reg_17),
    .data_out_bias_reg_18(data_seg_data_out_bias_reg_18),
    .data_out_bias_reg_19(data_seg_data_out_bias_reg_19),
    .data_out_bias_reg_20(data_seg_data_out_bias_reg_20),
    .data_out_bias_reg_21(data_seg_data_out_bias_reg_21),
    .data_out_bias_reg_22(data_seg_data_out_bias_reg_22),
    .data_out_bias_reg_23(data_seg_data_out_bias_reg_23),
    .data_out_bias_reg_24(data_seg_data_out_bias_reg_24),
    .data_out_bias_reg_25(data_seg_data_out_bias_reg_25),
    .data_out_bias_reg_26(data_seg_data_out_bias_reg_26),
    .data_out_bias_reg_27(data_seg_data_out_bias_reg_27),
    .data_out_bias_reg_28(data_seg_data_out_bias_reg_28),
    .data_out_bias_reg_29(data_seg_data_out_bias_reg_29),
    .data_out_bias_reg_30(data_seg_data_out_bias_reg_30),
    .data_out_bias_reg_31(data_seg_data_out_bias_reg_31),
    .data_out_param_load_complete(data_seg_data_out_param_load_complete)
  );
  assign io_data_out_conv_in_channel_0 = data_seg_data_out_conv_in_channel_0; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_1 = data_seg_data_out_conv_in_channel_1; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_2 = data_seg_data_out_conv_in_channel_2; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_3 = data_seg_data_out_conv_in_channel_3; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_4 = data_seg_data_out_conv_in_channel_4; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_5 = data_seg_data_out_conv_in_channel_5; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_6 = data_seg_data_out_conv_in_channel_6; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_7 = data_seg_data_out_conv_in_channel_7; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_8 = data_seg_data_out_conv_in_channel_8; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_9 = data_seg_data_out_conv_in_channel_9; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_10 = data_seg_data_out_conv_in_channel_10; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_11 = data_seg_data_out_conv_in_channel_11; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_12 = data_seg_data_out_conv_in_channel_12; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_13 = data_seg_data_out_conv_in_channel_13; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_14 = data_seg_data_out_conv_in_channel_14; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_15 = data_seg_data_out_conv_in_channel_15; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_16 = data_seg_data_out_conv_in_channel_16; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_17 = data_seg_data_out_conv_in_channel_17; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_18 = data_seg_data_out_conv_in_channel_18; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_19 = data_seg_data_out_conv_in_channel_19; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_20 = data_seg_data_out_conv_in_channel_20; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_21 = data_seg_data_out_conv_in_channel_21; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_22 = data_seg_data_out_conv_in_channel_22; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_23 = data_seg_data_out_conv_in_channel_23; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_24 = data_seg_data_out_conv_in_channel_24; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_25 = data_seg_data_out_conv_in_channel_25; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_26 = data_seg_data_out_conv_in_channel_26; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_27 = data_seg_data_out_conv_in_channel_27; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_28 = data_seg_data_out_conv_in_channel_28; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_29 = data_seg_data_out_conv_in_channel_29; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_30 = data_seg_data_out_conv_in_channel_30; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_channel_31 = data_seg_data_out_conv_in_channel_31; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_0 = data_seg_data_out_mac_wgt_in_0; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_1 = data_seg_data_out_mac_wgt_in_1; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_2 = data_seg_data_out_mac_wgt_in_2; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_3 = data_seg_data_out_mac_wgt_in_3; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_4 = data_seg_data_out_mac_wgt_in_4; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_5 = data_seg_data_out_mac_wgt_in_5; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_6 = data_seg_data_out_mac_wgt_in_6; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_7 = data_seg_data_out_mac_wgt_in_7; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_8 = data_seg_data_out_mac_wgt_in_8; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_9 = data_seg_data_out_mac_wgt_in_9; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_10 = data_seg_data_out_mac_wgt_in_10; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_11 = data_seg_data_out_mac_wgt_in_11; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_12 = data_seg_data_out_mac_wgt_in_12; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_13 = data_seg_data_out_mac_wgt_in_13; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_14 = data_seg_data_out_mac_wgt_in_14; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_15 = data_seg_data_out_mac_wgt_in_15; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_16 = data_seg_data_out_mac_wgt_in_16; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_17 = data_seg_data_out_mac_wgt_in_17; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_18 = data_seg_data_out_mac_wgt_in_18; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_19 = data_seg_data_out_mac_wgt_in_19; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_20 = data_seg_data_out_mac_wgt_in_20; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_21 = data_seg_data_out_mac_wgt_in_21; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_22 = data_seg_data_out_mac_wgt_in_22; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_23 = data_seg_data_out_mac_wgt_in_23; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_24 = data_seg_data_out_mac_wgt_in_24; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_25 = data_seg_data_out_mac_wgt_in_25; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_26 = data_seg_data_out_mac_wgt_in_26; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_27 = data_seg_data_out_mac_wgt_in_27; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_28 = data_seg_data_out_mac_wgt_in_28; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_29 = data_seg_data_out_mac_wgt_in_29; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_30 = data_seg_data_out_mac_wgt_in_30; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_mac_wgt_in_31 = data_seg_data_out_mac_wgt_in_31; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_valid_dn_0 = data_seg_data_out_conv_in_valid_dn_0; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_valid_dn_1 = data_seg_data_out_conv_in_valid_dn_1; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_valid_dn_2 = data_seg_data_out_conv_in_valid_dn_2; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_conv_in_valid_dn_3 = data_seg_data_out_conv_in_valid_dn_3; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_0 = data_seg_data_out_bias_reg_0; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_1 = data_seg_data_out_bias_reg_1; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_2 = data_seg_data_out_bias_reg_2; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_3 = data_seg_data_out_bias_reg_3; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_4 = data_seg_data_out_bias_reg_4; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_5 = data_seg_data_out_bias_reg_5; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_6 = data_seg_data_out_bias_reg_6; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_7 = data_seg_data_out_bias_reg_7; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_8 = data_seg_data_out_bias_reg_8; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_9 = data_seg_data_out_bias_reg_9; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_10 = data_seg_data_out_bias_reg_10; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_11 = data_seg_data_out_bias_reg_11; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_12 = data_seg_data_out_bias_reg_12; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_13 = data_seg_data_out_bias_reg_13; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_14 = data_seg_data_out_bias_reg_14; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_15 = data_seg_data_out_bias_reg_15; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_16 = data_seg_data_out_bias_reg_16; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_17 = data_seg_data_out_bias_reg_17; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_18 = data_seg_data_out_bias_reg_18; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_19 = data_seg_data_out_bias_reg_19; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_20 = data_seg_data_out_bias_reg_20; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_21 = data_seg_data_out_bias_reg_21; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_22 = data_seg_data_out_bias_reg_22; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_23 = data_seg_data_out_bias_reg_23; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_24 = data_seg_data_out_bias_reg_24; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_25 = data_seg_data_out_bias_reg_25; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_26 = data_seg_data_out_bias_reg_26; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_27 = data_seg_data_out_bias_reg_27; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_28 = data_seg_data_out_bias_reg_28; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_29 = data_seg_data_out_bias_reg_29; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_30 = data_seg_data_out_bias_reg_30; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_bias_reg_31 = data_seg_data_out_bias_reg_31; // @[conv_leaky_32in.scala 163:14]
  assign io_data_out_param_load_complete = data_seg_data_out_param_load_complete; // @[conv_leaky_32in.scala 163:14]
  assign data_seg_base_clk = io_base_clk; // @[conv_leaky_32in.scala 161:19]
  assign data_seg_base_clk_x2 = io_base_clk_x2; // @[conv_leaky_32in.scala 161:19]
  assign data_seg_base_rst = io_base_rst; // @[conv_leaky_32in.scala 161:19]
  assign data_seg_base_ap_start = io_base_ap_start; // @[conv_leaky_32in.scala 161:19]
  assign data_seg_data_in_conv_in = io_data_in_conv_in; // @[conv_leaky_32in.scala 162:22]
  assign data_seg_data_in_conv_in_valid = io_data_in_conv_in_valid; // @[conv_leaky_32in.scala 162:22]
  assign data_seg_data_in_param_in = io_data_in_param_in; // @[conv_leaky_32in.scala 162:22]
  assign data_seg_data_in_param_valid = io_data_in_param_valid; // @[conv_leaky_32in.scala 162:22]
endmodule
