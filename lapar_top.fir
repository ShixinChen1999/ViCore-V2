;buildInfoPackage: chisel3, version: 3.2.4, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit lapar_top : 
  extmodule design_1_wrapper : 
    output clk_1x : Clock
    output clk_2x : Clock
    input default_300mhz_clk0_clk_n : Clock
    input default_300mhz_clk0_clk_p : Clock
    input default_300mhz_clk1_clk_n : Clock
    input default_300mhz_clk1_clk_p : Clock
    input pcie_refclk_clk_n : Clock
    input pcie_refclk_clk_p : Clock
    input pci_express_x16_rxn : UInt<16>
    input pci_express_x16_rxp : UInt<16>
    output pci_express_x16_txn : UInt<16>
    output pci_express_x16_txp : UInt<16>
    input resetn : UInt<1>
    input pcie_perstn : UInt<1>
    output peripheral_reset : UInt<1>
    output usr_irq_ack : UInt<2>
    input usr_irq_req : UInt<2>
    output c0_ddr4 : {act_n : UInt<1>, adr : UInt<17>, ba : UInt<2>, bg : UInt<2>, ck_c : UInt<1>, ck_t : UInt<1>, cke : UInt<1>, cs_n : UInt<1>, dq : Analog<72>, dqs_c : Analog<18>, dqs_t : Analog<18>, odt : UInt<1>, par : UInt<1>, reset_n : UInt<1>}
    output c0_ddr4_ctrl : {flip araddr : UInt<32>, arready : UInt<1>, flip arvalid : UInt<1>, flip awaddr : UInt<32>, awready : UInt<1>, flip awvalid : UInt<1>, flip bready : UInt<1>, bresp : UInt<2>, bvalid : UInt<1>, rdata : UInt<32>, flip rready : UInt<1>, rresp : UInt<2>, rvalid : UInt<1>, flip wdata : UInt<32>, wready : UInt<1>, flip wvalid : UInt<1>}
    output c1_ddr4 : {act_n : UInt<1>, adr : UInt<17>, ba : UInt<2>, bg : UInt<2>, ck_c : UInt<1>, ck_t : UInt<1>, cke : UInt<1>, cs_n : UInt<1>, dq : Analog<72>, dqs_c : Analog<18>, dqs_t : Analog<18>, odt : UInt<1>, par : UInt<1>, reset_n : UInt<1>}
    output c1_ddr4_ctrl : {flip araddr : UInt<32>, arready : UInt<1>, flip arvalid : UInt<1>, flip awaddr : UInt<32>, awready : UInt<1>, flip awvalid : UInt<1>, flip bready : UInt<1>, bresp : UInt<2>, bvalid : UInt<1>, rdata : UInt<32>, flip rready : UInt<1>, rresp : UInt<2>, rvalid : UInt<1>, flip wdata : UInt<32>, wready : UInt<1>, flip wvalid : UInt<1>}
    output m_axil : {araddr : UInt<32>, arprot : UInt<3>, flip arready : UInt<1>, arvalid : UInt<1>, awaddr : UInt<32>, awprot : UInt<3>, flip awready : UInt<1>, awvalid : UInt<1>, bready : UInt<1>, flip bresp : UInt<2>, flip bvalid : UInt<1>, flip rdata : UInt<32>, rready : UInt<1>, flip rresp : UInt<2>, flip rvalid : UInt<1>, wdata : UInt<32>, flip wready : UInt<1>, wstrb : UInt<4>, wvalid : UInt<1>}
    output dma0_write : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip da : UInt<32>, flip da_msb : UInt<32>, flip len : UInt<26>, flip tdata : UInt<512>, flip tkeep : UInt<64>, flip tlast : UInt<1>, tready : UInt<1>, flip tvalid : UInt<1>}
    output dma1_write : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip da : UInt<32>, flip da_msb : UInt<32>, flip len : UInt<26>, flip tdata : UInt<512>, flip tkeep : UInt<64>, flip tlast : UInt<1>, tready : UInt<1>, flip tvalid : UInt<1>}
    output dma0_read : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip sa : UInt<32>, flip sa_msb : UInt<32>, flip len : UInt<26>, tdata : UInt<512>, tkeep : UInt<64>, tlast : UInt<1>, flip tready : UInt<1>, tvalid : UInt<1>}
    output dma1_read : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip sa : UInt<32>, flip sa_msb : UInt<32>, flip len : UInt<26>, tdata : UInt<512>, tkeep : UInt<64>, tlast : UInt<1>, flip tready : UInt<1>, tvalid : UInt<1>}
    output dma2_read : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip sa : UInt<32>, flip sa_msb : UInt<32>, flip len : UInt<26>, tdata : UInt<512>, tkeep : UInt<64>, tlast : UInt<1>, flip tready : UInt<1>, tvalid : UInt<1>}
    output dma3_read : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip sa : UInt<32>, flip sa_msb : UInt<32>, flip len : UInt<26>, tdata : UInt<512>, tkeep : UInt<64>, tlast : UInt<1>, flip tready : UInt<1>, tvalid : UInt<1>}
    
    defname = design_1_wrapper
    
    
  extmodule IR_For_DLA_regs : 
    input axi_aclk : Clock
    input axi_aresetn : UInt<1>
    input s_axi : {araddr : UInt<32>, arprot : UInt<3>, flip arready : UInt<1>, arvalid : UInt<1>, awaddr : UInt<32>, awprot : UInt<3>, flip awready : UInt<1>, awvalid : UInt<1>, bready : UInt<1>, flip bresp : UInt<2>, flip bvalid : UInt<1>, flip rdata : UInt<32>, rready : UInt<1>, flip rresp : UInt<2>, flip rvalid : UInt<1>, wdata : UInt<32>, flip wready : UInt<1>, wstrb : UInt<4>, wvalid : UInt<1>}
    output cfg : {reg_loop_time : {strobe : UInt<1>, value : UInt<32>}, reg_cin_size : {strobe : UInt<1>, value : UInt<32>}, reg_cout_size : {strobe : UInt<1>, value : UInt<32>}, reg_kernel_part0_start : {strobe : UInt<1>, value : UInt<32>}, reg_kernel_part1_start : {strobe : UInt<1>, value : UInt<32>}, reg_cin_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_cin_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_cin_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_loop_time : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_cin_size : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_total_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_single_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_cout_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_cout_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_cout_wr_len : {strobe : UInt<1>, value : UInt<32>}, reg_einsum_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_einsum_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_einsum_wr_len : {strobe : UInt<1>, value : UInt<32>}, reg_einsum_loop_time : {strobe : UInt<1>, value : UInt<32>}, reg_param_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_param_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_param_rd_len : {strobe : UInt<1>, value : UInt<32>}}
    output status : {flip reg_rd_fm_cin_cnt : UInt<32>, flip reg_rd_fm_dout_cnt : UInt<32>, flip reg_rd_sum_param_din_cnt : UInt<32>, flip reg_rd_sum_param_param_cnt : UInt<32>, flip reg_rd_sum_param_sum_cnt : UInt<32>, flip reg_conv_relu_in_cnt : UInt<32>, flip reg_conv_relu_out_cnt : UInt<32>, flip reg_relu_valid_cnt : UInt<32>, flip reg_layer_out_valid_cnt : UInt<32>, flip reg_wr_conv_relu_din_cnt : UInt<32>, flip reg_wr_conv_relu_dout_cnt : UInt<32>, flip reg_rd_fm_tstvec : UInt<32>, flip reg_rd_sum_param_tstvec : UInt<32>, flip reg_wr_conv_relu_tstvec : UInt<32>, flip reg_kernel_part0_tstvec : UInt<32>, flip reg_kernel_part1_tstvec : UInt<32>, flip reg_kernel_part0_status : UInt<32>, flip reg_kernel_part1_status : UInt<32>, flip reg_kernel_part0_run_time : UInt<32>, flip reg_kernel_part1_run_time : UInt<32>, flip reg_rd_d2s_part1_cnt : UInt<32>, flip reg_rd_d2s_part2_cnt : UInt<32>, flip reg_rd_d2s_part3_cnt : UInt<32>, flip reg_rd_d2s_part4_cnt : UInt<32>, flip reg_rd_upsample_din_cnt : UInt<32>, flip reg_rd_upsample_dout_cnt : UInt<32>, flip reg_wr_einsum_din_cnt : UInt<32>, flip reg_wr_einsum_dout_cnt : UInt<32>, flip reg_einsum_in_cnt : UInt<32>, flip reg_einsum_out_cnt : UInt<32>, flip reg_conv_5x5_in_cnt : UInt<32>, flip reg_conv_5x5_out_cnt : UInt<32>, flip reg_rd_d2s_tstvec : UInt<32>, flip reg_rd_upsample_tstvec : UInt<32>, flip reg_wr_einsum_tstvec : UInt<32>}
    
    defname = IR_For_DLA_regs
    parameter AXI_ADDR_WIDTH = 32
    parameter BASEADDR = 0
    
  extmodule lapar_ip : 
    input clk_x2 : Clock
    input m_axi_aclk : Clock
    input m_axi_aresetn : UInt<1>
    output kernel_part0_interrupt : UInt<1>
    output kernel_part1_interrupt : UInt<1>
    input cfg : {reg_loop_time : {strobe : UInt<1>, value : UInt<32>}, reg_cin_size : {strobe : UInt<1>, value : UInt<32>}, reg_cout_size : {strobe : UInt<1>, value : UInt<32>}, reg_kernel_part0_start : {strobe : UInt<1>, value : UInt<32>}, reg_kernel_part1_start : {strobe : UInt<1>, value : UInt<32>}, reg_cin_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_cin_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_cin_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_loop_time : {strobe : UInt<1>, value : UInt<32>}, reg_upsample_cin_size : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_total_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_d2s_single_rd_len : {strobe : UInt<1>, value : UInt<32>}, reg_cout_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_cout_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_cout_wr_len : {strobe : UInt<1>, value : UInt<32>}, reg_einsum_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_einsum_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_einsum_wr_len : {strobe : UInt<1>, value : UInt<32>}, reg_einsum_loop_time : {strobe : UInt<1>, value : UInt<32>}, reg_param_base_addr : {strobe : UInt<1>, value : UInt<32>}, reg_param_base_addr_msb : {strobe : UInt<1>, value : UInt<32>}, reg_param_rd_len : {strobe : UInt<1>, value : UInt<32>}}
    input status : {flip reg_rd_fm_cin_cnt : UInt<32>, flip reg_rd_fm_dout_cnt : UInt<32>, flip reg_rd_sum_param_din_cnt : UInt<32>, flip reg_rd_sum_param_param_cnt : UInt<32>, flip reg_rd_sum_param_sum_cnt : UInt<32>, flip reg_conv_relu_in_cnt : UInt<32>, flip reg_conv_relu_out_cnt : UInt<32>, flip reg_relu_valid_cnt : UInt<32>, flip reg_layer_out_valid_cnt : UInt<32>, flip reg_wr_conv_relu_din_cnt : UInt<32>, flip reg_wr_conv_relu_dout_cnt : UInt<32>, flip reg_rd_fm_tstvec : UInt<32>, flip reg_rd_sum_param_tstvec : UInt<32>, flip reg_wr_conv_relu_tstvec : UInt<32>, flip reg_kernel_part0_tstvec : UInt<32>, flip reg_kernel_part1_tstvec : UInt<32>, flip reg_kernel_part0_status : UInt<32>, flip reg_kernel_part1_status : UInt<32>, flip reg_kernel_part0_run_time : UInt<32>, flip reg_kernel_part1_run_time : UInt<32>, flip reg_rd_d2s_part1_cnt : UInt<32>, flip reg_rd_d2s_part2_cnt : UInt<32>, flip reg_rd_d2s_part3_cnt : UInt<32>, flip reg_rd_d2s_part4_cnt : UInt<32>, flip reg_rd_upsample_din_cnt : UInt<32>, flip reg_rd_upsample_dout_cnt : UInt<32>, flip reg_wr_einsum_din_cnt : UInt<32>, flip reg_wr_einsum_dout_cnt : UInt<32>, flip reg_einsum_in_cnt : UInt<32>, flip reg_einsum_out_cnt : UInt<32>, flip reg_conv_5x5_in_cnt : UInt<32>, flip reg_conv_5x5_out_cnt : UInt<32>, flip reg_rd_d2s_tstvec : UInt<32>, flip reg_rd_upsample_tstvec : UInt<32>, flip reg_wr_einsum_tstvec : UInt<32>}
    input m00_wr_ddr : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip da : UInt<32>, flip da_msb : UInt<32>, flip len : UInt<26>, flip tdata : UInt<512>, flip tkeep : UInt<64>, flip tlast : UInt<1>, tready : UInt<1>, flip tvalid : UInt<1>}
    input m01_wr_ddr : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip da : UInt<32>, flip da_msb : UInt<32>, flip len : UInt<26>, flip tdata : UInt<512>, flip tkeep : UInt<64>, flip tlast : UInt<1>, tready : UInt<1>, flip tvalid : UInt<1>}
    input m00_rd_ddr : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip sa : UInt<32>, flip sa_msb : UInt<32>, flip len : UInt<26>, tdata : UInt<512>, tkeep : UInt<64>, tlast : UInt<1>, flip tready : UInt<1>, tvalid : UInt<1>}
    input m01_rd_ddr : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip sa : UInt<32>, flip sa_msb : UInt<32>, flip len : UInt<26>, tdata : UInt<512>, tkeep : UInt<64>, tlast : UInt<1>, flip tready : UInt<1>, tvalid : UInt<1>}
    input m02_rd_ddr : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip sa : UInt<32>, flip sa_msb : UInt<32>, flip len : UInt<26>, tdata : UInt<512>, tkeep : UInt<64>, tlast : UInt<1>, flip tready : UInt<1>, tvalid : UInt<1>}
    input m03_rd_ddr : {idle : UInt<1>, irq : UInt<1>, flip valid : UInt<1>, flip sa : UInt<32>, flip sa_msb : UInt<32>, flip len : UInt<26>, tdata : UInt<512>, tkeep : UInt<64>, tlast : UInt<1>, flip tready : UInt<1>, tvalid : UInt<1>}
    
    defname = lapar_ip
    parameter CIN_W         = 16
    parameter CH_OUT        = 32
    parameter CORE_NUM      = 1
    parameter IM_WIDTH      = 640
    parameter BIAS_W        = 16
    parameter AXI_DATA_W    = 512
    parameter CH_IN         = 32
    parameter IM_HEIGHT     = 360
    parameter S_AXIL_DATA_W = 32
    parameter S_AXIL_ADDR_W = 32
    parameter AXI_ADDR_W    = 64
    
  module lapar_top : 
    output io : {flip c0_ddr4_clk_n : Clock, flip c0_ddr4_clk_p : Clock, flip c1_ddr4_clk_n : Clock, flip c1_ddr4_clk_p : Clock, flip pcie_refclk_clk_n : Clock, flip pcie_refclk_clk_p : Clock, flip pcie_express_x16_rxn : UInt<16>, flip pcie_express_x16_rxp : UInt<16>, pcie_express_x16_txn : UInt<16>, pcie_express_x16_txp : UInt<16>, flip pcie_perstn : UInt<1>, flip resetn : UInt<1>, c0_ddr4 : {act_n : UInt<1>, adr : UInt<17>, ba : UInt<2>, bg : UInt<2>, ck_c : UInt<1>, ck_t : UInt<1>, cke : UInt<1>, cs_n : UInt<1>, dq : Analog<72>, dqs_c : Analog<18>, dqs_t : Analog<18>, odt : UInt<1>, par : UInt<1>, reset_n : UInt<1>}, c1_ddr4 : {act_n : UInt<1>, adr : UInt<17>, ba : UInt<2>, bg : UInt<2>, ck_c : UInt<1>, ck_t : UInt<1>, cke : UInt<1>, cs_n : UInt<1>, dq : Analog<72>, dqs_c : Analog<18>, dqs_t : Analog<18>, odt : UInt<1>, par : UInt<1>, reset_n : UInt<1>}}
    
    inst Upcie_platform of design_1_wrapper @[lapar_top.scala 183:28]
    Upcie_platform.dma3_read is invalid
    Upcie_platform.dma2_read is invalid
    Upcie_platform.dma1_read is invalid
    Upcie_platform.dma0_read is invalid
    Upcie_platform.dma1_write is invalid
    Upcie_platform.dma0_write is invalid
    Upcie_platform.m_axil is invalid
    Upcie_platform.c1_ddr4_ctrl is invalid
    Upcie_platform.c1_ddr4 is invalid
    Upcie_platform.c0_ddr4_ctrl is invalid
    Upcie_platform.c0_ddr4 is invalid
    Upcie_platform.usr_irq_req is invalid
    Upcie_platform.usr_irq_ack is invalid
    Upcie_platform.peripheral_reset is invalid
    Upcie_platform.pcie_perstn is invalid
    Upcie_platform.resetn is invalid
    Upcie_platform.pci_express_x16_txp is invalid
    Upcie_platform.pci_express_x16_txn is invalid
    Upcie_platform.pci_express_x16_rxp is invalid
    Upcie_platform.pci_express_x16_rxn is invalid
    Upcie_platform.pcie_refclk_clk_p is invalid
    Upcie_platform.pcie_refclk_clk_n is invalid
    Upcie_platform.default_300mhz_clk1_clk_p is invalid
    Upcie_platform.default_300mhz_clk1_clk_n is invalid
    Upcie_platform.default_300mhz_clk0_clk_p is invalid
    Upcie_platform.default_300mhz_clk0_clk_n is invalid
    Upcie_platform.clk_2x is invalid
    Upcie_platform.clk_1x is invalid
    inst UIR_For_DLA_regs of IR_For_DLA_regs @[lapar_top.scala 184:30]
    UIR_For_DLA_regs.status is invalid
    UIR_For_DLA_regs.cfg is invalid
    UIR_For_DLA_regs.s_axi is invalid
    UIR_For_DLA_regs.axi_aresetn is invalid
    UIR_For_DLA_regs.axi_aclk is invalid
    inst Ulapar_ip of lapar_ip @[lapar_top.scala 185:23]
    Ulapar_ip.m03_rd_ddr is invalid
    Ulapar_ip.m02_rd_ddr is invalid
    Ulapar_ip.m01_rd_ddr is invalid
    Ulapar_ip.m00_rd_ddr is invalid
    Ulapar_ip.m01_wr_ddr is invalid
    Ulapar_ip.m00_wr_ddr is invalid
    Ulapar_ip.status is invalid
    Ulapar_ip.cfg is invalid
    Ulapar_ip.kernel_part1_interrupt is invalid
    Ulapar_ip.kernel_part0_interrupt is invalid
    Ulapar_ip.m_axi_aresetn is invalid
    Ulapar_ip.m_axi_aclk is invalid
    Ulapar_ip.clk_x2 is invalid
    Upcie_platform.c0_ddr4_ctrl.awvalid <= UInt<1>("h00") @[lapar_top.scala 188:42]
    Upcie_platform.c0_ddr4_ctrl.awaddr <= UInt<1>("h00") @[lapar_top.scala 189:41]
    Upcie_platform.c0_ddr4_ctrl.wvalid <= UInt<1>("h00") @[lapar_top.scala 190:41]
    Upcie_platform.c0_ddr4_ctrl.wdata <= UInt<1>("h00") @[lapar_top.scala 191:40]
    Upcie_platform.c0_ddr4_ctrl.wvalid <= UInt<1>("h01") @[lapar_top.scala 192:41]
    Upcie_platform.c0_ddr4_ctrl.arvalid <= UInt<1>("h00") @[lapar_top.scala 193:42]
    Upcie_platform.c0_ddr4_ctrl.araddr <= UInt<1>("h00") @[lapar_top.scala 194:41]
    Upcie_platform.c0_ddr4_ctrl.rready <= UInt<1>("h01") @[lapar_top.scala 195:41]
    Upcie_platform.c1_ddr4_ctrl.awvalid <= UInt<1>("h00") @[lapar_top.scala 196:42]
    Upcie_platform.c1_ddr4_ctrl.awaddr <= UInt<1>("h00") @[lapar_top.scala 197:41]
    Upcie_platform.c1_ddr4_ctrl.wvalid <= UInt<1>("h00") @[lapar_top.scala 198:41]
    Upcie_platform.c1_ddr4_ctrl.wdata <= UInt<1>("h00") @[lapar_top.scala 199:40]
    Upcie_platform.c1_ddr4_ctrl.wvalid <= UInt<1>("h01") @[lapar_top.scala 200:41]
    Upcie_platform.c1_ddr4_ctrl.arvalid <= UInt<1>("h00") @[lapar_top.scala 201:42]
    Upcie_platform.c1_ddr4_ctrl.araddr <= UInt<1>("h00") @[lapar_top.scala 202:41]
    Upcie_platform.c1_ddr4_ctrl.rready <= UInt<1>("h01") @[lapar_top.scala 203:41]
    io.c0_ddr4.reset_n <= Upcie_platform.c0_ddr4.reset_n @[lapar_top.scala 205:21]
    io.c0_ddr4.par <= Upcie_platform.c0_ddr4.par @[lapar_top.scala 205:21]
    io.c0_ddr4.odt <= Upcie_platform.c0_ddr4.odt @[lapar_top.scala 205:21]
    attach (io.c0_ddr4.dqs_t, Upcie_platform.c0_ddr4.dqs_t) @[lapar_top.scala 205:21]
    attach (io.c0_ddr4.dqs_c, Upcie_platform.c0_ddr4.dqs_c) @[lapar_top.scala 205:21]
    attach (io.c0_ddr4.dq, Upcie_platform.c0_ddr4.dq) @[lapar_top.scala 205:21]
    io.c0_ddr4.cs_n <= Upcie_platform.c0_ddr4.cs_n @[lapar_top.scala 205:21]
    io.c0_ddr4.cke <= Upcie_platform.c0_ddr4.cke @[lapar_top.scala 205:21]
    io.c0_ddr4.ck_t <= Upcie_platform.c0_ddr4.ck_t @[lapar_top.scala 205:21]
    io.c0_ddr4.ck_c <= Upcie_platform.c0_ddr4.ck_c @[lapar_top.scala 205:21]
    io.c0_ddr4.bg <= Upcie_platform.c0_ddr4.bg @[lapar_top.scala 205:21]
    io.c0_ddr4.ba <= Upcie_platform.c0_ddr4.ba @[lapar_top.scala 205:21]
    io.c0_ddr4.adr <= Upcie_platform.c0_ddr4.adr @[lapar_top.scala 205:21]
    io.c0_ddr4.act_n <= Upcie_platform.c0_ddr4.act_n @[lapar_top.scala 205:21]
    io.c1_ddr4.reset_n <= Upcie_platform.c1_ddr4.reset_n @[lapar_top.scala 206:21]
    io.c1_ddr4.par <= Upcie_platform.c1_ddr4.par @[lapar_top.scala 206:21]
    io.c1_ddr4.odt <= Upcie_platform.c1_ddr4.odt @[lapar_top.scala 206:21]
    attach (io.c1_ddr4.dqs_t, Upcie_platform.c1_ddr4.dqs_t) @[lapar_top.scala 206:21]
    attach (io.c1_ddr4.dqs_c, Upcie_platform.c1_ddr4.dqs_c) @[lapar_top.scala 206:21]
    attach (io.c1_ddr4.dq, Upcie_platform.c1_ddr4.dq) @[lapar_top.scala 206:21]
    io.c1_ddr4.cs_n <= Upcie_platform.c1_ddr4.cs_n @[lapar_top.scala 206:21]
    io.c1_ddr4.cke <= Upcie_platform.c1_ddr4.cke @[lapar_top.scala 206:21]
    io.c1_ddr4.ck_t <= Upcie_platform.c1_ddr4.ck_t @[lapar_top.scala 206:21]
    io.c1_ddr4.ck_c <= Upcie_platform.c1_ddr4.ck_c @[lapar_top.scala 206:21]
    io.c1_ddr4.bg <= Upcie_platform.c1_ddr4.bg @[lapar_top.scala 206:21]
    io.c1_ddr4.ba <= Upcie_platform.c1_ddr4.ba @[lapar_top.scala 206:21]
    io.c1_ddr4.adr <= Upcie_platform.c1_ddr4.adr @[lapar_top.scala 206:21]
    io.c1_ddr4.act_n <= Upcie_platform.c1_ddr4.act_n @[lapar_top.scala 206:21]
    node _T = not(Upcie_platform.peripheral_reset) @[lapar_top.scala 208:39]
    UIR_For_DLA_regs.axi_aresetn <= _T @[lapar_top.scala 208:36]
    UIR_For_DLA_regs.axi_aclk <= Upcie_platform.clk_1x @[lapar_top.scala 209:33]
    Ulapar_ip.clk_x2 <= Upcie_platform.clk_2x @[lapar_top.scala 211:29]
    Ulapar_ip.m_axi_aclk <= Upcie_platform.clk_1x @[lapar_top.scala 212:29]
    node _T_1 = not(Upcie_platform.peripheral_reset) @[lapar_top.scala 213:3]
    Ulapar_ip.m_axi_aresetn <= _T_1 @[lapar_top.scala 213:40]
    node _T_2 = cat(Ulapar_ip.kernel_part1_interrupt, Ulapar_ip.kernel_part0_interrupt) @[Cat.scala 29:58]
    Upcie_platform.usr_irq_req <= _T_2 @[lapar_top.scala 214:34]
    Ulapar_ip.cfg.reg_param_rd_len.value <= UIR_For_DLA_regs.cfg.reg_param_rd_len.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_param_rd_len.strobe <= UIR_For_DLA_regs.cfg.reg_param_rd_len.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_param_base_addr_msb.value <= UIR_For_DLA_regs.cfg.reg_param_base_addr_msb.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_param_base_addr_msb.strobe <= UIR_For_DLA_regs.cfg.reg_param_base_addr_msb.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_param_base_addr.value <= UIR_For_DLA_regs.cfg.reg_param_base_addr.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_param_base_addr.strobe <= UIR_For_DLA_regs.cfg.reg_param_base_addr.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_einsum_loop_time.value <= UIR_For_DLA_regs.cfg.reg_einsum_loop_time.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_einsum_loop_time.strobe <= UIR_For_DLA_regs.cfg.reg_einsum_loop_time.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_einsum_wr_len.value <= UIR_For_DLA_regs.cfg.reg_einsum_wr_len.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_einsum_wr_len.strobe <= UIR_For_DLA_regs.cfg.reg_einsum_wr_len.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_einsum_base_addr_msb.value <= UIR_For_DLA_regs.cfg.reg_einsum_base_addr_msb.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_einsum_base_addr_msb.strobe <= UIR_For_DLA_regs.cfg.reg_einsum_base_addr_msb.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_einsum_base_addr.value <= UIR_For_DLA_regs.cfg.reg_einsum_base_addr.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_einsum_base_addr.strobe <= UIR_For_DLA_regs.cfg.reg_einsum_base_addr.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cout_wr_len.value <= UIR_For_DLA_regs.cfg.reg_cout_wr_len.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cout_wr_len.strobe <= UIR_For_DLA_regs.cfg.reg_cout_wr_len.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cout_base_addr_msb.value <= UIR_For_DLA_regs.cfg.reg_cout_base_addr_msb.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cout_base_addr_msb.strobe <= UIR_For_DLA_regs.cfg.reg_cout_base_addr_msb.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cout_base_addr.value <= UIR_For_DLA_regs.cfg.reg_cout_base_addr.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cout_base_addr.strobe <= UIR_For_DLA_regs.cfg.reg_cout_base_addr.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_single_rd_len.value <= UIR_For_DLA_regs.cfg.reg_d2s_single_rd_len.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_single_rd_len.strobe <= UIR_For_DLA_regs.cfg.reg_d2s_single_rd_len.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_total_rd_len.value <= UIR_For_DLA_regs.cfg.reg_d2s_total_rd_len.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_total_rd_len.strobe <= UIR_For_DLA_regs.cfg.reg_d2s_total_rd_len.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_rd_len.value <= UIR_For_DLA_regs.cfg.reg_d2s_rd_len.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_rd_len.strobe <= UIR_For_DLA_regs.cfg.reg_d2s_rd_len.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_base_addr_msb.value <= UIR_For_DLA_regs.cfg.reg_d2s_base_addr_msb.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_base_addr_msb.strobe <= UIR_For_DLA_regs.cfg.reg_d2s_base_addr_msb.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_base_addr.value <= UIR_For_DLA_regs.cfg.reg_d2s_base_addr.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_d2s_base_addr.strobe <= UIR_For_DLA_regs.cfg.reg_d2s_base_addr.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_cin_size.value <= UIR_For_DLA_regs.cfg.reg_upsample_cin_size.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_cin_size.strobe <= UIR_For_DLA_regs.cfg.reg_upsample_cin_size.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_loop_time.value <= UIR_For_DLA_regs.cfg.reg_upsample_loop_time.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_loop_time.strobe <= UIR_For_DLA_regs.cfg.reg_upsample_loop_time.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_rd_len.value <= UIR_For_DLA_regs.cfg.reg_upsample_rd_len.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_rd_len.strobe <= UIR_For_DLA_regs.cfg.reg_upsample_rd_len.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_base_addr_msb.value <= UIR_For_DLA_regs.cfg.reg_upsample_base_addr_msb.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_base_addr_msb.strobe <= UIR_For_DLA_regs.cfg.reg_upsample_base_addr_msb.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_base_addr.value <= UIR_For_DLA_regs.cfg.reg_upsample_base_addr.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_upsample_base_addr.strobe <= UIR_For_DLA_regs.cfg.reg_upsample_base_addr.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cin_rd_len.value <= UIR_For_DLA_regs.cfg.reg_cin_rd_len.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cin_rd_len.strobe <= UIR_For_DLA_regs.cfg.reg_cin_rd_len.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cin_base_addr_msb.value <= UIR_For_DLA_regs.cfg.reg_cin_base_addr_msb.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cin_base_addr_msb.strobe <= UIR_For_DLA_regs.cfg.reg_cin_base_addr_msb.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cin_base_addr.value <= UIR_For_DLA_regs.cfg.reg_cin_base_addr.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cin_base_addr.strobe <= UIR_For_DLA_regs.cfg.reg_cin_base_addr.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_kernel_part1_start.value <= UIR_For_DLA_regs.cfg.reg_kernel_part1_start.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_kernel_part1_start.strobe <= UIR_For_DLA_regs.cfg.reg_kernel_part1_start.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_kernel_part0_start.value <= UIR_For_DLA_regs.cfg.reg_kernel_part0_start.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_kernel_part0_start.strobe <= UIR_For_DLA_regs.cfg.reg_kernel_part0_start.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cout_size.value <= UIR_For_DLA_regs.cfg.reg_cout_size.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cout_size.strobe <= UIR_For_DLA_regs.cfg.reg_cout_size.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cin_size.value <= UIR_For_DLA_regs.cfg.reg_cin_size.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_cin_size.strobe <= UIR_For_DLA_regs.cfg.reg_cin_size.strobe @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_loop_time.value <= UIR_For_DLA_regs.cfg.reg_loop_time.value @[lapar_top.scala 218:28]
    Ulapar_ip.cfg.reg_loop_time.strobe <= UIR_For_DLA_regs.cfg.reg_loop_time.strobe @[lapar_top.scala 218:28]
    UIR_For_DLA_regs.status.reg_wr_einsum_tstvec <= Ulapar_ip.status.reg_wr_einsum_tstvec @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_upsample_tstvec <= Ulapar_ip.status.reg_rd_upsample_tstvec @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_d2s_tstvec <= Ulapar_ip.status.reg_rd_d2s_tstvec @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_conv_5x5_out_cnt <= Ulapar_ip.status.reg_conv_5x5_out_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_conv_5x5_in_cnt <= Ulapar_ip.status.reg_conv_5x5_in_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_einsum_out_cnt <= Ulapar_ip.status.reg_einsum_out_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_einsum_in_cnt <= Ulapar_ip.status.reg_einsum_in_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_wr_einsum_dout_cnt <= Ulapar_ip.status.reg_wr_einsum_dout_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_wr_einsum_din_cnt <= Ulapar_ip.status.reg_wr_einsum_din_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_upsample_dout_cnt <= Ulapar_ip.status.reg_rd_upsample_dout_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_upsample_din_cnt <= Ulapar_ip.status.reg_rd_upsample_din_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_d2s_part4_cnt <= Ulapar_ip.status.reg_rd_d2s_part4_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_d2s_part3_cnt <= Ulapar_ip.status.reg_rd_d2s_part3_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_d2s_part2_cnt <= Ulapar_ip.status.reg_rd_d2s_part2_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_d2s_part1_cnt <= Ulapar_ip.status.reg_rd_d2s_part1_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_kernel_part1_run_time <= Ulapar_ip.status.reg_kernel_part1_run_time @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_kernel_part0_run_time <= Ulapar_ip.status.reg_kernel_part0_run_time @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_kernel_part1_status <= Ulapar_ip.status.reg_kernel_part1_status @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_kernel_part0_status <= Ulapar_ip.status.reg_kernel_part0_status @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_kernel_part1_tstvec <= Ulapar_ip.status.reg_kernel_part1_tstvec @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_kernel_part0_tstvec <= Ulapar_ip.status.reg_kernel_part0_tstvec @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_wr_conv_relu_tstvec <= Ulapar_ip.status.reg_wr_conv_relu_tstvec @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_sum_param_tstvec <= Ulapar_ip.status.reg_rd_sum_param_tstvec @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_fm_tstvec <= Ulapar_ip.status.reg_rd_fm_tstvec @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_wr_conv_relu_dout_cnt <= Ulapar_ip.status.reg_wr_conv_relu_dout_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_wr_conv_relu_din_cnt <= Ulapar_ip.status.reg_wr_conv_relu_din_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_layer_out_valid_cnt <= Ulapar_ip.status.reg_layer_out_valid_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_relu_valid_cnt <= Ulapar_ip.status.reg_relu_valid_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_conv_relu_out_cnt <= Ulapar_ip.status.reg_conv_relu_out_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_conv_relu_in_cnt <= Ulapar_ip.status.reg_conv_relu_in_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_sum_param_sum_cnt <= Ulapar_ip.status.reg_rd_sum_param_sum_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_sum_param_param_cnt <= Ulapar_ip.status.reg_rd_sum_param_param_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_sum_param_din_cnt <= Ulapar_ip.status.reg_rd_sum_param_din_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_fm_dout_cnt <= Ulapar_ip.status.reg_rd_fm_dout_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.status.reg_rd_fm_cin_cnt <= Ulapar_ip.status.reg_rd_fm_cin_cnt @[lapar_top.scala 219:31]
    UIR_For_DLA_regs.s_axi.wvalid <= Upcie_platform.m_axil.wvalid @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.wstrb <= Upcie_platform.m_axil.wstrb @[lapar_top.scala 222:31]
    Upcie_platform.m_axil.wready <= UIR_For_DLA_regs.s_axi.wready @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.wdata <= Upcie_platform.m_axil.wdata @[lapar_top.scala 222:31]
    Upcie_platform.m_axil.rvalid <= UIR_For_DLA_regs.s_axi.rvalid @[lapar_top.scala 222:31]
    Upcie_platform.m_axil.rresp <= UIR_For_DLA_regs.s_axi.rresp @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.rready <= Upcie_platform.m_axil.rready @[lapar_top.scala 222:31]
    Upcie_platform.m_axil.rdata <= UIR_For_DLA_regs.s_axi.rdata @[lapar_top.scala 222:31]
    Upcie_platform.m_axil.bvalid <= UIR_For_DLA_regs.s_axi.bvalid @[lapar_top.scala 222:31]
    Upcie_platform.m_axil.bresp <= UIR_For_DLA_regs.s_axi.bresp @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.bready <= Upcie_platform.m_axil.bready @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.awvalid <= Upcie_platform.m_axil.awvalid @[lapar_top.scala 222:31]
    Upcie_platform.m_axil.awready <= UIR_For_DLA_regs.s_axi.awready @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.awprot <= Upcie_platform.m_axil.awprot @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.awaddr <= Upcie_platform.m_axil.awaddr @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.arvalid <= Upcie_platform.m_axil.arvalid @[lapar_top.scala 222:31]
    Upcie_platform.m_axil.arready <= UIR_For_DLA_regs.s_axi.arready @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.arprot <= Upcie_platform.m_axil.arprot @[lapar_top.scala 222:31]
    UIR_For_DLA_regs.s_axi.araddr <= Upcie_platform.m_axil.araddr @[lapar_top.scala 222:31]
    Ulapar_ip.m00_rd_ddr.tvalid <= Upcie_platform.dma0_read.tvalid @[lapar_top.scala 223:31]
    Upcie_platform.dma0_read.tready <= Ulapar_ip.m00_rd_ddr.tready @[lapar_top.scala 223:31]
    Ulapar_ip.m00_rd_ddr.tlast <= Upcie_platform.dma0_read.tlast @[lapar_top.scala 223:31]
    Ulapar_ip.m00_rd_ddr.tkeep <= Upcie_platform.dma0_read.tkeep @[lapar_top.scala 223:31]
    Ulapar_ip.m00_rd_ddr.tdata <= Upcie_platform.dma0_read.tdata @[lapar_top.scala 223:31]
    Upcie_platform.dma0_read.len <= Ulapar_ip.m00_rd_ddr.len @[lapar_top.scala 223:31]
    Upcie_platform.dma0_read.sa_msb <= Ulapar_ip.m00_rd_ddr.sa_msb @[lapar_top.scala 223:31]
    Upcie_platform.dma0_read.sa <= Ulapar_ip.m00_rd_ddr.sa @[lapar_top.scala 223:31]
    Upcie_platform.dma0_read.valid <= Ulapar_ip.m00_rd_ddr.valid @[lapar_top.scala 223:31]
    Ulapar_ip.m00_rd_ddr.irq <= Upcie_platform.dma0_read.irq @[lapar_top.scala 223:31]
    Ulapar_ip.m00_rd_ddr.idle <= Upcie_platform.dma0_read.idle @[lapar_top.scala 223:31]
    Ulapar_ip.m01_rd_ddr.tvalid <= Upcie_platform.dma1_read.tvalid @[lapar_top.scala 224:31]
    Upcie_platform.dma1_read.tready <= Ulapar_ip.m01_rd_ddr.tready @[lapar_top.scala 224:31]
    Ulapar_ip.m01_rd_ddr.tlast <= Upcie_platform.dma1_read.tlast @[lapar_top.scala 224:31]
    Ulapar_ip.m01_rd_ddr.tkeep <= Upcie_platform.dma1_read.tkeep @[lapar_top.scala 224:31]
    Ulapar_ip.m01_rd_ddr.tdata <= Upcie_platform.dma1_read.tdata @[lapar_top.scala 224:31]
    Upcie_platform.dma1_read.len <= Ulapar_ip.m01_rd_ddr.len @[lapar_top.scala 224:31]
    Upcie_platform.dma1_read.sa_msb <= Ulapar_ip.m01_rd_ddr.sa_msb @[lapar_top.scala 224:31]
    Upcie_platform.dma1_read.sa <= Ulapar_ip.m01_rd_ddr.sa @[lapar_top.scala 224:31]
    Upcie_platform.dma1_read.valid <= Ulapar_ip.m01_rd_ddr.valid @[lapar_top.scala 224:31]
    Ulapar_ip.m01_rd_ddr.irq <= Upcie_platform.dma1_read.irq @[lapar_top.scala 224:31]
    Ulapar_ip.m01_rd_ddr.idle <= Upcie_platform.dma1_read.idle @[lapar_top.scala 224:31]
    Ulapar_ip.m02_rd_ddr.tvalid <= Upcie_platform.dma2_read.tvalid @[lapar_top.scala 225:31]
    Upcie_platform.dma2_read.tready <= Ulapar_ip.m02_rd_ddr.tready @[lapar_top.scala 225:31]
    Ulapar_ip.m02_rd_ddr.tlast <= Upcie_platform.dma2_read.tlast @[lapar_top.scala 225:31]
    Ulapar_ip.m02_rd_ddr.tkeep <= Upcie_platform.dma2_read.tkeep @[lapar_top.scala 225:31]
    Ulapar_ip.m02_rd_ddr.tdata <= Upcie_platform.dma2_read.tdata @[lapar_top.scala 225:31]
    Upcie_platform.dma2_read.len <= Ulapar_ip.m02_rd_ddr.len @[lapar_top.scala 225:31]
    Upcie_platform.dma2_read.sa_msb <= Ulapar_ip.m02_rd_ddr.sa_msb @[lapar_top.scala 225:31]
    Upcie_platform.dma2_read.sa <= Ulapar_ip.m02_rd_ddr.sa @[lapar_top.scala 225:31]
    Upcie_platform.dma2_read.valid <= Ulapar_ip.m02_rd_ddr.valid @[lapar_top.scala 225:31]
    Ulapar_ip.m02_rd_ddr.irq <= Upcie_platform.dma2_read.irq @[lapar_top.scala 225:31]
    Ulapar_ip.m02_rd_ddr.idle <= Upcie_platform.dma2_read.idle @[lapar_top.scala 225:31]
    Ulapar_ip.m03_rd_ddr.tvalid <= Upcie_platform.dma3_read.tvalid @[lapar_top.scala 226:31]
    Upcie_platform.dma3_read.tready <= Ulapar_ip.m03_rd_ddr.tready @[lapar_top.scala 226:31]
    Ulapar_ip.m03_rd_ddr.tlast <= Upcie_platform.dma3_read.tlast @[lapar_top.scala 226:31]
    Ulapar_ip.m03_rd_ddr.tkeep <= Upcie_platform.dma3_read.tkeep @[lapar_top.scala 226:31]
    Ulapar_ip.m03_rd_ddr.tdata <= Upcie_platform.dma3_read.tdata @[lapar_top.scala 226:31]
    Upcie_platform.dma3_read.len <= Ulapar_ip.m03_rd_ddr.len @[lapar_top.scala 226:31]
    Upcie_platform.dma3_read.sa_msb <= Ulapar_ip.m03_rd_ddr.sa_msb @[lapar_top.scala 226:31]
    Upcie_platform.dma3_read.sa <= Ulapar_ip.m03_rd_ddr.sa @[lapar_top.scala 226:31]
    Upcie_platform.dma3_read.valid <= Ulapar_ip.m03_rd_ddr.valid @[lapar_top.scala 226:31]
    Ulapar_ip.m03_rd_ddr.irq <= Upcie_platform.dma3_read.irq @[lapar_top.scala 226:31]
    Ulapar_ip.m03_rd_ddr.idle <= Upcie_platform.dma3_read.idle @[lapar_top.scala 226:31]
    Upcie_platform.dma0_write.tvalid <= Ulapar_ip.m00_wr_ddr.tvalid @[lapar_top.scala 227:32]
    Ulapar_ip.m00_wr_ddr.tready <= Upcie_platform.dma0_write.tready @[lapar_top.scala 227:32]
    Upcie_platform.dma0_write.tlast <= Ulapar_ip.m00_wr_ddr.tlast @[lapar_top.scala 227:32]
    Upcie_platform.dma0_write.tkeep <= Ulapar_ip.m00_wr_ddr.tkeep @[lapar_top.scala 227:32]
    Upcie_platform.dma0_write.tdata <= Ulapar_ip.m00_wr_ddr.tdata @[lapar_top.scala 227:32]
    Upcie_platform.dma0_write.len <= Ulapar_ip.m00_wr_ddr.len @[lapar_top.scala 227:32]
    Upcie_platform.dma0_write.da_msb <= Ulapar_ip.m00_wr_ddr.da_msb @[lapar_top.scala 227:32]
    Upcie_platform.dma0_write.da <= Ulapar_ip.m00_wr_ddr.da @[lapar_top.scala 227:32]
    Upcie_platform.dma0_write.valid <= Ulapar_ip.m00_wr_ddr.valid @[lapar_top.scala 227:32]
    Ulapar_ip.m00_wr_ddr.irq <= Upcie_platform.dma0_write.irq @[lapar_top.scala 227:32]
    Ulapar_ip.m00_wr_ddr.idle <= Upcie_platform.dma0_write.idle @[lapar_top.scala 227:32]
    Upcie_platform.dma1_write.tvalid <= Ulapar_ip.m01_wr_ddr.tvalid @[lapar_top.scala 228:32]
    Ulapar_ip.m01_wr_ddr.tready <= Upcie_platform.dma1_write.tready @[lapar_top.scala 228:32]
    Upcie_platform.dma1_write.tlast <= Ulapar_ip.m01_wr_ddr.tlast @[lapar_top.scala 228:32]
    Upcie_platform.dma1_write.tkeep <= Ulapar_ip.m01_wr_ddr.tkeep @[lapar_top.scala 228:32]
    Upcie_platform.dma1_write.tdata <= Ulapar_ip.m01_wr_ddr.tdata @[lapar_top.scala 228:32]
    Upcie_platform.dma1_write.len <= Ulapar_ip.m01_wr_ddr.len @[lapar_top.scala 228:32]
    Upcie_platform.dma1_write.da_msb <= Ulapar_ip.m01_wr_ddr.da_msb @[lapar_top.scala 228:32]
    Upcie_platform.dma1_write.da <= Ulapar_ip.m01_wr_ddr.da @[lapar_top.scala 228:32]
    Upcie_platform.dma1_write.valid <= Ulapar_ip.m01_wr_ddr.valid @[lapar_top.scala 228:32]
    Ulapar_ip.m01_wr_ddr.irq <= Upcie_platform.dma1_write.irq @[lapar_top.scala 228:32]
    Ulapar_ip.m01_wr_ddr.idle <= Upcie_platform.dma1_write.idle @[lapar_top.scala 228:32]
    Upcie_platform.default_300mhz_clk0_clk_n <= io.c0_ddr4_clk_n @[lapar_top.scala 230:47]
    Upcie_platform.default_300mhz_clk0_clk_p <= io.c0_ddr4_clk_p @[lapar_top.scala 231:47]
    Upcie_platform.default_300mhz_clk1_clk_n <= io.c1_ddr4_clk_n @[lapar_top.scala 232:47]
    Upcie_platform.default_300mhz_clk1_clk_p <= io.c1_ddr4_clk_p @[lapar_top.scala 233:47]
    Upcie_platform.pcie_refclk_clk_n <= io.pcie_refclk_clk_n @[lapar_top.scala 234:47]
    Upcie_platform.pcie_refclk_clk_p <= io.pcie_refclk_clk_p @[lapar_top.scala 235:47]
    Upcie_platform.pci_express_x16_rxn <= io.pcie_express_x16_rxn @[lapar_top.scala 237:27]
    Upcie_platform.pci_express_x16_rxp <= io.pcie_express_x16_rxp @[lapar_top.scala 238:27]
    io.pcie_express_x16_txn <= Upcie_platform.pci_express_x16_txn @[lapar_top.scala 239:27]
    io.pcie_express_x16_txp <= Upcie_platform.pci_express_x16_txp @[lapar_top.scala 240:27]
    Upcie_platform.pcie_perstn <= io.pcie_perstn @[lapar_top.scala 241:26]
    Upcie_platform.resetn <= io.resetn @[lapar_top.scala 242:27]
    
