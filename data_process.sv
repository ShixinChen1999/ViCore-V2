`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Shixin Chen
//
// Create Date: 2020/11/11 18:01:00
// Design Name:
// Module Name: data_process
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module data_process #(

    parameter CONV_DW = 16,                         //
              IN_DECIMAL_BIT = 14,                   //
              WGT_W = 16,                            //
              WT_DECIMAL_BIT = 14,                   //
              BIAS_W = 16,                          //in default, BIAS_W equals to 2x WGT_W
              BIAS_DECIMAL_BIT = 14,                //

              IM_WIDTH = 256,                       //
              IM_HEIGHT = 256,                      //
              WT_BYTE_NUM =4,
              INPUT_CN = 32,                        //
              KERNEL_LENGTH = 3,                    //

              OUTPUT_CN = 32,                        //
              CONV_OUT_W = 38,                        //
              OUT_DECIMAL_BIT = 14,                    //
              KERNEL_SIZE  = KERNEL_LENGTH * KERNEL_LENGTH

) (
    input base_clk,
    input base_clk_x2,
    input base_rst,
    input base_ap_start,
    input [INPUT_CN * CONV_DW -1:0] data_in_conv_in,
    input data_in_conv_in_valid,
    input [CONV_DW*WT_BYTE_NUM -1:0] data_in_param_in,
    input data_in_param_valid,
    output [CONV_DW-1:0] data_out_conv_in_channel_0,
    output [CONV_DW-1:0] data_out_conv_in_channel_1,
    output [CONV_DW-1:0] data_out_conv_in_channel_2,
    output [CONV_DW-1:0] data_out_conv_in_channel_3,
    output [CONV_DW-1:0] data_out_conv_in_channel_4,
    output [CONV_DW-1:0] data_out_conv_in_channel_5,
    output [CONV_DW-1:0] data_out_conv_in_channel_6,
    output [CONV_DW-1:0] data_out_conv_in_channel_7,
    output [CONV_DW-1:0] data_out_conv_in_channel_8,
    output [CONV_DW-1:0] data_out_conv_in_channel_9,
    output [CONV_DW-1:0] data_out_conv_in_channel_10,
    output [CONV_DW-1:0] data_out_conv_in_channel_11,
    output [CONV_DW-1:0] data_out_conv_in_channel_12,
    output [CONV_DW-1:0] data_out_conv_in_channel_13,
    output [CONV_DW-1:0] data_out_conv_in_channel_14,
    output [CONV_DW-1:0] data_out_conv_in_channel_15,
    output [CONV_DW-1:0] data_out_conv_in_channel_16,
    output [CONV_DW-1:0] data_out_conv_in_channel_17,
    output [CONV_DW-1:0] data_out_conv_in_channel_18,
    output [CONV_DW-1:0] data_out_conv_in_channel_19,
    output [CONV_DW-1:0] data_out_conv_in_channel_20,
    output [CONV_DW-1:0] data_out_conv_in_channel_21,
    output [CONV_DW-1:0] data_out_conv_in_channel_22,
    output [CONV_DW-1:0] data_out_conv_in_channel_23,
    output [CONV_DW-1:0] data_out_conv_in_channel_24,
    output [CONV_DW-1:0] data_out_conv_in_channel_25,
    output [CONV_DW-1:0] data_out_conv_in_channel_26,
    output [CONV_DW-1:0] data_out_conv_in_channel_27,
    output [CONV_DW-1:0] data_out_conv_in_channel_28,
    output [CONV_DW-1:0] data_out_conv_in_channel_29,
    output [CONV_DW-1:0] data_out_conv_in_channel_30,
    output [CONV_DW-1:0] data_out_conv_in_channel_31,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_0,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_1,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_2,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_3,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_4,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_5,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_6,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_7,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_8,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_9,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_10,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_11,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_12,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_13,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_14,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_15,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_16,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_17,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_18,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_19,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_20,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_21,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_22,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_23,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_24,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_25,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_26,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_27,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_28,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_29,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_30,
    output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] data_out_mac_wgt_in_31,
    output data_out_conv_in_valid_dn_0,
    output data_out_conv_in_valid_dn_1,
    output data_out_conv_in_valid_dn_2,
    output data_out_conv_in_valid_dn_3,
    output [CONV_DW-1:0] data_out_bias_reg_0,
    output [CONV_DW-1:0] data_out_bias_reg_1,
    output [CONV_DW-1:0] data_out_bias_reg_2,
    output [CONV_DW-1:0] data_out_bias_reg_3,
    output [CONV_DW-1:0] data_out_bias_reg_4,
    output [CONV_DW-1:0] data_out_bias_reg_5,
    output [CONV_DW-1:0] data_out_bias_reg_6,
    output [CONV_DW-1:0] data_out_bias_reg_7,
    output [CONV_DW-1:0] data_out_bias_reg_8,
    output [CONV_DW-1:0] data_out_bias_reg_9,
    output [CONV_DW-1:0] data_out_bias_reg_10,
    output [CONV_DW-1:0] data_out_bias_reg_11,
    output [CONV_DW-1:0] data_out_bias_reg_12,
    output [CONV_DW-1:0] data_out_bias_reg_13,
    output [CONV_DW-1:0] data_out_bias_reg_14,
    output [CONV_DW-1:0] data_out_bias_reg_15,
    output [CONV_DW-1:0] data_out_bias_reg_16,
    output [CONV_DW-1:0] data_out_bias_reg_17,
    output [CONV_DW-1:0] data_out_bias_reg_18,
    output [CONV_DW-1:0] data_out_bias_reg_19,
    output [CONV_DW-1:0] data_out_bias_reg_20,
    output [CONV_DW-1:0] data_out_bias_reg_21,
    output [CONV_DW-1:0] data_out_bias_reg_22,
    output [CONV_DW-1:0] data_out_bias_reg_23,
    output [CONV_DW-1:0] data_out_bias_reg_24,
    output [CONV_DW-1:0] data_out_bias_reg_25,
    output [CONV_DW-1:0] data_out_bias_reg_26,
    output [CONV_DW-1:0] data_out_bias_reg_27,
    output [CONV_DW-1:0] data_out_bias_reg_28,
    output [CONV_DW-1:0] data_out_bias_reg_29,
    output [CONV_DW-1:0] data_out_bias_reg_30,
    output [CONV_DW-1:0] data_out_bias_reg_31,
    output data_out_param_load_complete
  );

//assign each ports

//   //clk & rst
//     input clk,
//     input clk_x2,
//     input rst,
//     //pix
//     input ap_start,//?
//     input [INPUT_CN * CONV_DW -1:0] conv_in,//
//     input conv_in_valid,
//     //wgt bias
//     input [CONV_DW*WT_BYTE_NUM -1:0] param_in, // AXI_DATA_W
//     input param_valid,

//     output [CONV_DW-1:0] conv_in_channel [INPUT_CN-1:0],
//     output [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] mac_wgt_in [OUTPUT_CN-1:0],
//     output conv_in_valid_dn [3:0],
//     output [CONV_DW-1:0] bias_reg [OUTPUT_CN],
//     output param_load_complete,






//localparam KERNEL_SIZE  = KERNEL_LENGTH * KERNEL_LENGTH ;// kernel data size
localparam BIAS_SIZE    = OUTPUT_CN * BIAS_W / WGT_W;// bias data size
localparam WGT_SIZE     = OUTPUT_CN * INPUT_CN * KERNEL_SIZE;// wgt data size
localparam PARAM_SIZE   = WGT_SIZE + BIAS_SIZE;
localparam IN_CYC = IM_WIDTH * IM_HEIGHT;  // cycle number of inputing all the image data

localparam IN_RAM_ROW   = 3 ;//num of ram of row

localparam LAST_LINE_RAM_0 = (IM_HEIGHT + 1) % IN_RAM_ROW;
localparam LAST_LINE_RAM_1 = (IM_HEIGHT + 2) % IN_RAM_ROW;

localparam AHEAD_AFTER_IN_VAILD = 1 + (KERNEL_LENGTH - 1)/2 + 1;// ram write cyc + fill conv array + ram stable lantency
localparam CONV_RD_LATENCY = 7;
localparam CONV_RD_AFTER_CAL = 5;
localparam ADDR_W = 10 ;//row addr

localparam DECIMAL_ALIGN = IN_DECIMAL_BIT + WT_DECIMAL_BIT - BIAS_DECIMAL_BIT;


// no use param
localparam IN_RAM_SIZE = IN_RAM_ROW * IM_WIDTH ;
localparam SUM_DECIMAL = IN_DECIMAL_BIT + WT_DECIMAL_BIT;

//conv_out
localparam INPUT_CN_WIDTH = $clog2( INPUT_CN ); //5
localparam CONV_OUTPUT_WIDTH = 2 * CONV_DW + INPUT_CN_WIDTH; //2*16+5

    //clk & rst
    reg clk                                                                ;
    reg clk_x2                                                             ;
    reg rst                                                                ;
    reg ap_start                                                           ;
    reg [INPUT_CN * CONV_DW -1:0] conv_in                                  ;
    reg conv_in_valid                                                      ;
    reg [CONV_DW*WT_BYTE_NUM -1:0] param_in                                ;
    reg param_valid                                                        ;
    reg  [CONV_DW-1:0] conv_in_channel [INPUT_CN-1:0]                      ;
    reg  [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] mac_wgt_in [OUTPUT_CN-1:0] ;
    reg  conv_in_valid_dn [3:0]                                            ;
    reg  [CONV_DW-1:0] bias_reg [OUTPUT_CN]                                ;
    reg  param_load_complete                                               ;

    assign clk            =  base_clk              ;
    assign clk_x2         =  base_clk_x2           ;
    assign rst            =  base_rst              ;
    assign ap_start       =  base_ap_start         ;
    assign conv_in        =  data_in_conv_in       ;
    assign conv_in_valid  =  data_in_conv_in_valid ;
    assign param_in       =  data_in_param_in      ;
    assign param_valid    =  data_in_param_valid   ;

    assign data_out_conv_in_channel_0 =conv_in_channel[0 ];
    assign data_out_conv_in_channel_1 =conv_in_channel[1 ];
    assign data_out_conv_in_channel_2 =conv_in_channel[2 ];
    assign data_out_conv_in_channel_3 =conv_in_channel[3 ];
    assign data_out_conv_in_channel_4 =conv_in_channel[4 ];
    assign data_out_conv_in_channel_5 =conv_in_channel[5 ];
    assign data_out_conv_in_channel_6 =conv_in_channel[6 ];
    assign data_out_conv_in_channel_7 =conv_in_channel[7 ];
    assign data_out_conv_in_channel_8 =conv_in_channel[8 ];
    assign data_out_conv_in_channel_9 =conv_in_channel[9 ];
    assign data_out_conv_in_channel_10=conv_in_channel[10];
    assign data_out_conv_in_channel_11=conv_in_channel[11];
    assign data_out_conv_in_channel_12=conv_in_channel[12];
    assign data_out_conv_in_channel_13=conv_in_channel[13];
    assign data_out_conv_in_channel_14=conv_in_channel[14];
    assign data_out_conv_in_channel_15=conv_in_channel[15];
    assign data_out_conv_in_channel_16=conv_in_channel[16];
    assign data_out_conv_in_channel_17=conv_in_channel[17];
    assign data_out_conv_in_channel_18=conv_in_channel[18];
    assign data_out_conv_in_channel_19=conv_in_channel[19];
    assign data_out_conv_in_channel_20=conv_in_channel[20];
    assign data_out_conv_in_channel_21=conv_in_channel[21];
    assign data_out_conv_in_channel_22=conv_in_channel[22];
    assign data_out_conv_in_channel_23=conv_in_channel[23];
    assign data_out_conv_in_channel_24=conv_in_channel[24];
    assign data_out_conv_in_channel_25=conv_in_channel[25];
    assign data_out_conv_in_channel_26=conv_in_channel[26];
    assign data_out_conv_in_channel_27=conv_in_channel[27];
    assign data_out_conv_in_channel_28=conv_in_channel[28];
    assign data_out_conv_in_channel_29=conv_in_channel[29];
    assign data_out_conv_in_channel_30=conv_in_channel[30];
    assign data_out_conv_in_channel_31=conv_in_channel[31];
    assign data_out_mac_wgt_in_0 =mac_wgt_in[ 0  ];
    assign data_out_mac_wgt_in_1 =mac_wgt_in[ 1  ];
    assign data_out_mac_wgt_in_2 =mac_wgt_in[ 2  ];
    assign data_out_mac_wgt_in_3 =mac_wgt_in[ 3  ];
    assign data_out_mac_wgt_in_4 =mac_wgt_in[ 4  ];
    assign data_out_mac_wgt_in_5 =mac_wgt_in[ 5  ];
    assign data_out_mac_wgt_in_6 =mac_wgt_in[ 6  ];
    assign data_out_mac_wgt_in_7 =mac_wgt_in[ 7  ];
    assign data_out_mac_wgt_in_8 =mac_wgt_in[ 8  ];
    assign data_out_mac_wgt_in_9 =mac_wgt_in[ 9  ];
    assign data_out_mac_wgt_in_10 =mac_wgt_in[10  ];
    assign data_out_mac_wgt_in_11 =mac_wgt_in[11  ];
    assign data_out_mac_wgt_in_12 =mac_wgt_in[12  ];
    assign data_out_mac_wgt_in_13 =mac_wgt_in[13  ];
    assign data_out_mac_wgt_in_14 =mac_wgt_in[14  ];
    assign data_out_mac_wgt_in_15 =mac_wgt_in[15  ];
    assign data_out_mac_wgt_in_16 =mac_wgt_in[16  ];
    assign data_out_mac_wgt_in_17 =mac_wgt_in[17  ];
    assign data_out_mac_wgt_in_18 =mac_wgt_in[18  ];
    assign data_out_mac_wgt_in_19 =mac_wgt_in[19  ];
    assign data_out_mac_wgt_in_20 =mac_wgt_in[20  ];
    assign data_out_mac_wgt_in_21 =mac_wgt_in[21  ];
    assign data_out_mac_wgt_in_22 =mac_wgt_in[22  ];
    assign data_out_mac_wgt_in_23 =mac_wgt_in[23  ];
    assign data_out_mac_wgt_in_24 =mac_wgt_in[24  ];
    assign data_out_mac_wgt_in_25 =mac_wgt_in[25  ];
    assign data_out_mac_wgt_in_26 =mac_wgt_in[26  ];
    assign data_out_mac_wgt_in_27 =mac_wgt_in[27  ];
    assign data_out_mac_wgt_in_28 =mac_wgt_in[28  ];
    assign data_out_mac_wgt_in_29 =mac_wgt_in[29  ];
    assign data_out_mac_wgt_in_30 =mac_wgt_in[30  ];
    assign data_out_mac_wgt_in_31 =mac_wgt_in[31  ];
    assign data_out_conv_in_valid_dn_0=conv_in_valid_dn[0];
    assign data_out_conv_in_valid_dn_1=conv_in_valid_dn[1];
    assign data_out_conv_in_valid_dn_2=conv_in_valid_dn[2];
    assign data_out_conv_in_valid_dn_3=conv_in_valid_dn[3];
    assign data_out_bias_reg_0   =  bias_reg[0  ];
    assign data_out_bias_reg_1   =  bias_reg[1  ];
    assign data_out_bias_reg_2   =  bias_reg[2  ];
    assign data_out_bias_reg_3   =  bias_reg[3  ];
    assign data_out_bias_reg_4   =  bias_reg[4  ];
    assign data_out_bias_reg_5   =  bias_reg[5  ];
    assign data_out_bias_reg_6   =  bias_reg[6  ];
    assign data_out_bias_reg_7   =  bias_reg[7  ];
    assign data_out_bias_reg_8   =  bias_reg[8  ];
    assign data_out_bias_reg_9   =  bias_reg[9  ];
    assign data_out_bias_reg_10  =  bias_reg[10 ];
    assign data_out_bias_reg_11  =  bias_reg[11 ];
    assign data_out_bias_reg_12  =  bias_reg[12 ];
    assign data_out_bias_reg_13  =  bias_reg[13 ];
    assign data_out_bias_reg_14  =  bias_reg[14 ];
    assign data_out_bias_reg_15  =  bias_reg[15 ];
    assign data_out_bias_reg_16  =  bias_reg[16 ];
    assign data_out_bias_reg_17  =  bias_reg[17 ];
    assign data_out_bias_reg_18  =  bias_reg[18 ];
    assign data_out_bias_reg_19  =  bias_reg[19 ];
    assign data_out_bias_reg_20  =  bias_reg[20 ];
    assign data_out_bias_reg_21  =  bias_reg[21 ];
    assign data_out_bias_reg_22  =  bias_reg[22 ];
    assign data_out_bias_reg_23  =  bias_reg[23 ];
    assign data_out_bias_reg_24  =  bias_reg[24 ];
    assign data_out_bias_reg_25  =  bias_reg[25 ];
    assign data_out_bias_reg_26  =  bias_reg[26 ];
    assign data_out_bias_reg_27  =  bias_reg[27 ];
    assign data_out_bias_reg_28  =  bias_reg[28 ];
    assign data_out_bias_reg_29  =  bias_reg[29 ];
    assign data_out_bias_reg_30  =  bias_reg[30 ];
    assign data_out_bias_reg_31  =  bias_reg[31 ];
    assign data_out_param_load_complete = param_load_complete;






// reg input
reg [ INPUT_CN * CONV_DW - 1:0] conv_in_reg;
reg                             conv_in_valid_reg;
// pix
always @ (posedge clk) begin
    conv_in_reg <= conv_in;
    conv_in_valid_reg <= conv_in_valid;
end

// conv_in_valid delay
//reg conv_in_valid_dn [3:0];
always @ (posedge clk) begin
    conv_in_valid_dn [0] <= conv_in_valid_reg;
end
generate
    genvar conv_valid_n;
    for (conv_valid_n = 1; conv_valid_n < 4; conv_valid_n = conv_valid_n + 1) begin : gen_conv_valid_n
        always @ (posedge clk) begin
            conv_in_valid_dn [conv_valid_n] <= conv_in_valid_dn [conv_valid_n-1];
        end
    end
endgenerate


// wgt and bias
reg [15:0] param_cyc_cnt;// cnt for param_valid
always @ (posedge clk ) begin
    if (rst) begin
        param_cyc_cnt <= 'd0;
    end else if(ap_start) begin
        param_cyc_cnt <= 'd0;
    end else begin
        param_cyc_cnt <= param_valid ? param_cyc_cnt + WT_BYTE_NUM : param_cyc_cnt;
    end
end
assign param_load_complete = param_cyc_cnt >= PARAM_SIZE;

wire wgt_enable;
wire bias_enable;
assign bias_enable = param_cyc_cnt < BIAS_SIZE ;
assign wgt_enable  = ~bias_enable ;

reg [CONV_DW*WT_BYTE_NUM -1:0]                          param_in_reg;
(* keep="true" *)reg [CONV_DW*WT_BYTE_NUM - 1:0]   wgt_valid_reg;// for reducing fanout
reg                                            bias_valid_reg;
always @ (posedge clk) begin
    param_in_reg <= param_in;
    wgt_valid_reg <= {WT_BYTE_NUM*4{param_valid & wgt_enable}};//reduce fanout
    bias_valid_reg <= param_valid & bias_enable;
end

//// rpt
//reg [ OUTPUT_CN * CONV_DW - 1:0] rpt_sum_in_reg;
//always @ (posedge clk) begin
//    rpt_sum_in_reg <= rpt_sum_in;
//end


reg [CONV_DW*WT_BYTE_NUM-1:0] wgt_mem [WGT_SIZE/WT_BYTE_NUM];


generate
genvar i_wgt_mem,i_wgt_byte;
for(i_wgt_mem=0;i_wgt_mem<WGT_SIZE/WT_BYTE_NUM;i_wgt_mem++)begin
    for(i_wgt_byte=0;i_wgt_byte<WT_BYTE_NUM*4;i_wgt_byte++) begin
        if(i_wgt_mem == (WGT_SIZE/WT_BYTE_NUM-1))
            always @(posedge clk) begin
                if(wgt_valid_reg[i_wgt_byte])
                    wgt_mem[i_wgt_mem][i_wgt_byte*CONV_DW/4 +: CONV_DW/4] <= param_in_reg[i_wgt_byte*CONV_DW/4 +: CONV_DW/4];
            end
        else
            always @(posedge clk) begin
                if(wgt_valid_reg[i_wgt_byte])
                    wgt_mem[i_wgt_mem][i_wgt_byte*CONV_DW/4 +: CONV_DW/4] <= wgt_mem[i_wgt_mem+1][i_wgt_byte*CONV_DW/4 +: CONV_DW/4];
            end
    end
end
endgenerate

//wire [INPUT_CN * KERNEL_SIZE * CONV_DW-1:0] mac_wgt_in [OUTPUT_CN-1:0];
generate
genvar i_wgt_reg,j_wgt_reg;
for(i_wgt_reg=0;i_wgt_reg<WGT_SIZE/WT_BYTE_NUM;i_wgt_reg++)begin
    for(j_wgt_reg=0;j_wgt_reg<WT_BYTE_NUM;j_wgt_reg++)begin
        assign mac_wgt_in[j_wgt_reg][i_wgt_reg*CONV_DW +: CONV_DW] = wgt_mem[i_wgt_reg][j_wgt_reg*CONV_DW +: CONV_DW]  ;
    end
end
endgenerate


// load bias
reg [15:0] bias_cnt;
always @ (posedge clk) begin
    if (rst) begin
        bias_cnt <= 'd0;
    end
    else begin
        bias_cnt <= bias_valid_reg ? bias_cnt + WT_BYTE_NUM : bias_cnt;
    end
end
assign bias_load_complete = bias_cnt >= OUTPUT_CN;

reg [CONV_DW*WT_BYTE_NUM-1:0] bias_mem ;
always @(posedge clk)begin
    if(bias_valid_reg)
        bias_mem = param_in_reg ;
end

//wire [CONV_DW-1:0] bias_reg [OUTPUT_CN];

generate
genvar i_bias_reg;
for(i_bias_reg=0;i_bias_reg<OUTPUT_CN;i_bias_reg++)begin
    assign bias_reg[i_bias_reg] = bias_mem[i_bias_reg*CONV_DW +: CONV_DW]  ;
end
endgenerate

// load pix input data to wire, divide by input channels
//wire [CONV_DW-1:0] conv_in_channel [INPUT_CN-1:0];
generate
    genvar data_dist_n;
    for (data_dist_n = 0; data_dist_n < INPUT_CN; data_dist_n = data_dist_n + 1) begin : distribute_in_data
        assign conv_in_channel [data_dist_n] = conv_in_reg [data_dist_n * CONV_DW +: CONV_DW];
    end
endgenerate

endmodule
