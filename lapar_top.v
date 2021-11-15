module lapar_top(
  input         io_c0_ddr4_clk_n,
  input         io_c0_ddr4_clk_p,
  input         io_c1_ddr4_clk_n,
  input         io_c1_ddr4_clk_p,
  input         io_pcie_refclk_clk_n,
  input         io_pcie_refclk_clk_p,
  input  [15:0] io_pcie_express_x16_rxn,
  input  [15:0] io_pcie_express_x16_rxp,
  output [15:0] io_pcie_express_x16_txn,
  output [15:0] io_pcie_express_x16_txp,
  input         io_pcie_perstn,
  input         io_resetn,
  output        io_c0_ddr4_act_n,
  output [16:0] io_c0_ddr4_adr,
  output [1:0]  io_c0_ddr4_ba,
  output [1:0]  io_c0_ddr4_bg,
  output        io_c0_ddr4_ck_c,
  output        io_c0_ddr4_ck_t,
  output        io_c0_ddr4_cke,
  output        io_c0_ddr4_cs_n,
  inout  [71:0] io_c0_ddr4_dq,
  inout  [17:0] io_c0_ddr4_dqs_c,
  inout  [17:0] io_c0_ddr4_dqs_t,
  output        io_c0_ddr4_odt,
  output        io_c0_ddr4_par,
  output        io_c0_ddr4_reset_n,
  output        io_c1_ddr4_act_n,
  output [16:0] io_c1_ddr4_adr,
  output [1:0]  io_c1_ddr4_ba,
  output [1:0]  io_c1_ddr4_bg,
  output        io_c1_ddr4_ck_c,
  output        io_c1_ddr4_ck_t,
  output        io_c1_ddr4_cke,
  output        io_c1_ddr4_cs_n,
  inout  [71:0] io_c1_ddr4_dq,
  inout  [17:0] io_c1_ddr4_dqs_c,
  inout  [17:0] io_c1_ddr4_dqs_t,
  output        io_c1_ddr4_odt,
  output        io_c1_ddr4_par,
  output        io_c1_ddr4_reset_n
);
  wire  Upcie_platform_clk_1x; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_clk_2x; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_default_300mhz_clk0_clk_n; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_default_300mhz_clk0_clk_p; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_default_300mhz_clk1_clk_n; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_default_300mhz_clk1_clk_p; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_pcie_refclk_clk_n; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_pcie_refclk_clk_p; // @[lapar_top.scala 183:28]
  wire [15:0] Upcie_platform_pci_express_x16_rxn; // @[lapar_top.scala 183:28]
  wire [15:0] Upcie_platform_pci_express_x16_rxp; // @[lapar_top.scala 183:28]
  wire [15:0] Upcie_platform_pci_express_x16_txn; // @[lapar_top.scala 183:28]
  wire [15:0] Upcie_platform_pci_express_x16_txp; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_resetn; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_pcie_perstn; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_peripheral_reset; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_usr_irq_ack; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_usr_irq_req; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_act_n; // @[lapar_top.scala 183:28]
  wire [16:0] Upcie_platform_c0_ddr4_adr; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_c0_ddr4_ba; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_c0_ddr4_bg; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ck_c; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ck_t; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_cke; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_cs_n; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_odt; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_par; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_reset_n; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_c0_ddr4_ctrl_araddr; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_arready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_arvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_c0_ddr4_ctrl_awaddr; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_awready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_awvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_bready; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_c0_ddr4_ctrl_bresp; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_bvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_c0_ddr4_ctrl_rdata; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_rready; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_c0_ddr4_ctrl_rresp; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_rvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_c0_ddr4_ctrl_wdata; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_wready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c0_ddr4_ctrl_wvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_act_n; // @[lapar_top.scala 183:28]
  wire [16:0] Upcie_platform_c1_ddr4_adr; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_c1_ddr4_ba; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_c1_ddr4_bg; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ck_c; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ck_t; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_cke; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_cs_n; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_odt; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_par; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_reset_n; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_c1_ddr4_ctrl_araddr; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_arready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_arvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_c1_ddr4_ctrl_awaddr; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_awready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_awvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_bready; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_c1_ddr4_ctrl_bresp; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_bvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_c1_ddr4_ctrl_rdata; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_rready; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_c1_ddr4_ctrl_rresp; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_rvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_c1_ddr4_ctrl_wdata; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_wready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_c1_ddr4_ctrl_wvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_m_axil_araddr; // @[lapar_top.scala 183:28]
  wire [2:0] Upcie_platform_m_axil_arprot; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_arready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_arvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_m_axil_awaddr; // @[lapar_top.scala 183:28]
  wire [2:0] Upcie_platform_m_axil_awprot; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_awready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_awvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_bready; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_m_axil_bresp; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_bvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_m_axil_rdata; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_rready; // @[lapar_top.scala 183:28]
  wire [1:0] Upcie_platform_m_axil_rresp; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_rvalid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_m_axil_wdata; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_wready; // @[lapar_top.scala 183:28]
  wire [3:0] Upcie_platform_m_axil_wstrb; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_m_axil_wvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_write_idle; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_write_irq; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_write_valid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma0_write_da; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma0_write_da_msb; // @[lapar_top.scala 183:28]
  wire [25:0] Upcie_platform_dma0_write_len; // @[lapar_top.scala 183:28]
  wire [511:0] Upcie_platform_dma0_write_tdata; // @[lapar_top.scala 183:28]
  wire [63:0] Upcie_platform_dma0_write_tkeep; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_write_tlast; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_write_tready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_write_tvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_write_idle; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_write_irq; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_write_valid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma1_write_da; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma1_write_da_msb; // @[lapar_top.scala 183:28]
  wire [25:0] Upcie_platform_dma1_write_len; // @[lapar_top.scala 183:28]
  wire [511:0] Upcie_platform_dma1_write_tdata; // @[lapar_top.scala 183:28]
  wire [63:0] Upcie_platform_dma1_write_tkeep; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_write_tlast; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_write_tready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_write_tvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_read_idle; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_read_irq; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_read_valid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma0_read_sa; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma0_read_sa_msb; // @[lapar_top.scala 183:28]
  wire [25:0] Upcie_platform_dma0_read_len; // @[lapar_top.scala 183:28]
  wire [511:0] Upcie_platform_dma0_read_tdata; // @[lapar_top.scala 183:28]
  wire [63:0] Upcie_platform_dma0_read_tkeep; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_read_tlast; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_read_tready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma0_read_tvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_read_idle; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_read_irq; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_read_valid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma1_read_sa; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma1_read_sa_msb; // @[lapar_top.scala 183:28]
  wire [25:0] Upcie_platform_dma1_read_len; // @[lapar_top.scala 183:28]
  wire [511:0] Upcie_platform_dma1_read_tdata; // @[lapar_top.scala 183:28]
  wire [63:0] Upcie_platform_dma1_read_tkeep; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_read_tlast; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_read_tready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma1_read_tvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma2_read_idle; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma2_read_irq; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma2_read_valid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma2_read_sa; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma2_read_sa_msb; // @[lapar_top.scala 183:28]
  wire [25:0] Upcie_platform_dma2_read_len; // @[lapar_top.scala 183:28]
  wire [511:0] Upcie_platform_dma2_read_tdata; // @[lapar_top.scala 183:28]
  wire [63:0] Upcie_platform_dma2_read_tkeep; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma2_read_tlast; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma2_read_tready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma2_read_tvalid; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma3_read_idle; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma3_read_irq; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma3_read_valid; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma3_read_sa; // @[lapar_top.scala 183:28]
  wire [31:0] Upcie_platform_dma3_read_sa_msb; // @[lapar_top.scala 183:28]
  wire [25:0] Upcie_platform_dma3_read_len; // @[lapar_top.scala 183:28]
  wire [511:0] Upcie_platform_dma3_read_tdata; // @[lapar_top.scala 183:28]
  wire [63:0] Upcie_platform_dma3_read_tkeep; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma3_read_tlast; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma3_read_tready; // @[lapar_top.scala 183:28]
  wire  Upcie_platform_dma3_read_tvalid; // @[lapar_top.scala 183:28]
  wire  UIR_For_DLA_regs_axi_aclk; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_axi_aresetn; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_s_axi_araddr; // @[lapar_top.scala 184:30]
  wire [2:0] UIR_For_DLA_regs_s_axi_arprot; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_arready; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_arvalid; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_s_axi_awaddr; // @[lapar_top.scala 184:30]
  wire [2:0] UIR_For_DLA_regs_s_axi_awprot; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_awready; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_awvalid; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_bready; // @[lapar_top.scala 184:30]
  wire [1:0] UIR_For_DLA_regs_s_axi_bresp; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_bvalid; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_s_axi_rdata; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_rready; // @[lapar_top.scala 184:30]
  wire [1:0] UIR_For_DLA_regs_s_axi_rresp; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_rvalid; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_s_axi_wdata; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_wready; // @[lapar_top.scala 184:30]
  wire [3:0] UIR_For_DLA_regs_s_axi_wstrb; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_s_axi_wvalid; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_loop_time_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_loop_time_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_cin_size_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_cin_size_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_cout_size_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_cout_size_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_kernel_part0_start_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_kernel_part0_start_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_kernel_part1_start_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_kernel_part1_start_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_cin_base_addr_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_cin_base_addr_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_cin_base_addr_msb_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_cin_base_addr_msb_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_cin_rd_len_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_cin_rd_len_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_upsample_base_addr_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_upsample_base_addr_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_upsample_base_addr_msb_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_upsample_base_addr_msb_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_upsample_rd_len_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_upsample_rd_len_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_upsample_loop_time_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_upsample_loop_time_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_upsample_cin_size_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_upsample_cin_size_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_d2s_base_addr_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_d2s_base_addr_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_d2s_base_addr_msb_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_d2s_base_addr_msb_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_d2s_rd_len_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_d2s_rd_len_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_d2s_total_rd_len_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_d2s_total_rd_len_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_d2s_single_rd_len_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_d2s_single_rd_len_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_cout_base_addr_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_cout_base_addr_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_cout_base_addr_msb_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_cout_base_addr_msb_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_cout_wr_len_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_cout_wr_len_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_einsum_base_addr_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_einsum_base_addr_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_einsum_base_addr_msb_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_einsum_base_addr_msb_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_einsum_wr_len_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_einsum_wr_len_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_einsum_loop_time_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_einsum_loop_time_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_param_base_addr_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_param_base_addr_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_param_base_addr_msb_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_param_base_addr_msb_value; // @[lapar_top.scala 184:30]
  wire  UIR_For_DLA_regs_cfg_reg_param_rd_len_strobe; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_cfg_reg_param_rd_len_value; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_fm_cin_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_fm_dout_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_sum_param_din_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_sum_param_param_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_sum_param_sum_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_conv_relu_in_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_conv_relu_out_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_relu_valid_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_layer_out_valid_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_wr_conv_relu_din_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_wr_conv_relu_dout_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_fm_tstvec; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_sum_param_tstvec; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_wr_conv_relu_tstvec; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_kernel_part0_tstvec; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_kernel_part1_tstvec; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_kernel_part0_status; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_kernel_part1_status; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_kernel_part0_run_time; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_kernel_part1_run_time; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_d2s_part1_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_d2s_part2_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_d2s_part3_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_d2s_part4_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_upsample_din_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_upsample_dout_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_wr_einsum_din_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_wr_einsum_dout_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_einsum_in_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_einsum_out_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_conv_5x5_in_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_conv_5x5_out_cnt; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_d2s_tstvec; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_rd_upsample_tstvec; // @[lapar_top.scala 184:30]
  wire [31:0] UIR_For_DLA_regs_status_reg_wr_einsum_tstvec; // @[lapar_top.scala 184:30]
  wire  Ulapar_ip_clk_x2; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m_axi_aclk; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m_axi_aresetn; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_kernel_part0_interrupt; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_kernel_part1_interrupt; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_loop_time_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_loop_time_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_cin_size_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_cin_size_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_cout_size_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_cout_size_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_kernel_part0_start_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_kernel_part0_start_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_kernel_part1_start_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_kernel_part1_start_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_cin_base_addr_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_cin_base_addr_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_cin_base_addr_msb_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_cin_base_addr_msb_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_cin_rd_len_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_cin_rd_len_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_upsample_base_addr_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_upsample_base_addr_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_upsample_base_addr_msb_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_upsample_base_addr_msb_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_upsample_rd_len_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_upsample_rd_len_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_upsample_loop_time_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_upsample_loop_time_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_upsample_cin_size_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_upsample_cin_size_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_d2s_base_addr_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_d2s_base_addr_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_d2s_base_addr_msb_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_d2s_base_addr_msb_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_d2s_rd_len_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_d2s_rd_len_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_d2s_total_rd_len_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_d2s_total_rd_len_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_d2s_single_rd_len_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_d2s_single_rd_len_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_cout_base_addr_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_cout_base_addr_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_cout_base_addr_msb_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_cout_base_addr_msb_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_cout_wr_len_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_cout_wr_len_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_einsum_base_addr_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_einsum_base_addr_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_einsum_base_addr_msb_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_einsum_base_addr_msb_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_einsum_wr_len_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_einsum_wr_len_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_einsum_loop_time_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_einsum_loop_time_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_param_base_addr_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_param_base_addr_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_param_base_addr_msb_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_param_base_addr_msb_value; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_cfg_reg_param_rd_len_strobe; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_cfg_reg_param_rd_len_value; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_fm_cin_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_fm_dout_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_sum_param_din_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_sum_param_param_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_sum_param_sum_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_conv_relu_in_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_conv_relu_out_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_relu_valid_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_layer_out_valid_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_wr_conv_relu_din_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_wr_conv_relu_dout_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_fm_tstvec; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_sum_param_tstvec; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_wr_conv_relu_tstvec; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_kernel_part0_tstvec; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_kernel_part1_tstvec; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_kernel_part0_status; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_kernel_part1_status; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_kernel_part0_run_time; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_kernel_part1_run_time; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_d2s_part1_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_d2s_part2_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_d2s_part3_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_d2s_part4_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_upsample_din_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_upsample_dout_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_wr_einsum_din_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_wr_einsum_dout_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_einsum_in_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_einsum_out_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_conv_5x5_in_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_conv_5x5_out_cnt; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_d2s_tstvec; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_rd_upsample_tstvec; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_status_reg_wr_einsum_tstvec; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_wr_ddr_idle; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_wr_ddr_irq; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_wr_ddr_valid; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m00_wr_ddr_da; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m00_wr_ddr_da_msb; // @[lapar_top.scala 185:23]
  wire [25:0] Ulapar_ip_m00_wr_ddr_len; // @[lapar_top.scala 185:23]
  wire [511:0] Ulapar_ip_m00_wr_ddr_tdata; // @[lapar_top.scala 185:23]
  wire [63:0] Ulapar_ip_m00_wr_ddr_tkeep; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_wr_ddr_tlast; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_wr_ddr_tready; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_wr_ddr_tvalid; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_wr_ddr_idle; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_wr_ddr_irq; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_wr_ddr_valid; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m01_wr_ddr_da; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m01_wr_ddr_da_msb; // @[lapar_top.scala 185:23]
  wire [25:0] Ulapar_ip_m01_wr_ddr_len; // @[lapar_top.scala 185:23]
  wire [511:0] Ulapar_ip_m01_wr_ddr_tdata; // @[lapar_top.scala 185:23]
  wire [63:0] Ulapar_ip_m01_wr_ddr_tkeep; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_wr_ddr_tlast; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_wr_ddr_tready; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_wr_ddr_tvalid; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_rd_ddr_idle; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_rd_ddr_irq; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_rd_ddr_valid; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m00_rd_ddr_sa; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m00_rd_ddr_sa_msb; // @[lapar_top.scala 185:23]
  wire [25:0] Ulapar_ip_m00_rd_ddr_len; // @[lapar_top.scala 185:23]
  wire [511:0] Ulapar_ip_m00_rd_ddr_tdata; // @[lapar_top.scala 185:23]
  wire [63:0] Ulapar_ip_m00_rd_ddr_tkeep; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_rd_ddr_tlast; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_rd_ddr_tready; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m00_rd_ddr_tvalid; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_rd_ddr_idle; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_rd_ddr_irq; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_rd_ddr_valid; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m01_rd_ddr_sa; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m01_rd_ddr_sa_msb; // @[lapar_top.scala 185:23]
  wire [25:0] Ulapar_ip_m01_rd_ddr_len; // @[lapar_top.scala 185:23]
  wire [511:0] Ulapar_ip_m01_rd_ddr_tdata; // @[lapar_top.scala 185:23]
  wire [63:0] Ulapar_ip_m01_rd_ddr_tkeep; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_rd_ddr_tlast; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_rd_ddr_tready; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m01_rd_ddr_tvalid; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m02_rd_ddr_idle; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m02_rd_ddr_irq; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m02_rd_ddr_valid; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m02_rd_ddr_sa; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m02_rd_ddr_sa_msb; // @[lapar_top.scala 185:23]
  wire [25:0] Ulapar_ip_m02_rd_ddr_len; // @[lapar_top.scala 185:23]
  wire [511:0] Ulapar_ip_m02_rd_ddr_tdata; // @[lapar_top.scala 185:23]
  wire [63:0] Ulapar_ip_m02_rd_ddr_tkeep; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m02_rd_ddr_tlast; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m02_rd_ddr_tready; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m02_rd_ddr_tvalid; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m03_rd_ddr_idle; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m03_rd_ddr_irq; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m03_rd_ddr_valid; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m03_rd_ddr_sa; // @[lapar_top.scala 185:23]
  wire [31:0] Ulapar_ip_m03_rd_ddr_sa_msb; // @[lapar_top.scala 185:23]
  wire [25:0] Ulapar_ip_m03_rd_ddr_len; // @[lapar_top.scala 185:23]
  wire [511:0] Ulapar_ip_m03_rd_ddr_tdata; // @[lapar_top.scala 185:23]
  wire [63:0] Ulapar_ip_m03_rd_ddr_tkeep; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m03_rd_ddr_tlast; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m03_rd_ddr_tready; // @[lapar_top.scala 185:23]
  wire  Ulapar_ip_m03_rd_ddr_tvalid; // @[lapar_top.scala 185:23]
  design_1_wrapper Upcie_platform ( // @[lapar_top.scala 183:28]
    .clk_1x(Upcie_platform_clk_1x),
    .clk_2x(Upcie_platform_clk_2x),
    .default_300mhz_clk0_clk_n(Upcie_platform_default_300mhz_clk0_clk_n),
    .default_300mhz_clk0_clk_p(Upcie_platform_default_300mhz_clk0_clk_p),
    .default_300mhz_clk1_clk_n(Upcie_platform_default_300mhz_clk1_clk_n),
    .default_300mhz_clk1_clk_p(Upcie_platform_default_300mhz_clk1_clk_p),
    .pcie_refclk_clk_n(Upcie_platform_pcie_refclk_clk_n),
    .pcie_refclk_clk_p(Upcie_platform_pcie_refclk_clk_p),
    .pci_express_x16_rxn(Upcie_platform_pci_express_x16_rxn),
    .pci_express_x16_rxp(Upcie_platform_pci_express_x16_rxp),
    .pci_express_x16_txn(Upcie_platform_pci_express_x16_txn),
    .pci_express_x16_txp(Upcie_platform_pci_express_x16_txp),
    .resetn(Upcie_platform_resetn),
    .pcie_perstn(Upcie_platform_pcie_perstn),
    .peripheral_reset(Upcie_platform_peripheral_reset),
    .usr_irq_ack(Upcie_platform_usr_irq_ack),
    .usr_irq_req(Upcie_platform_usr_irq_req),
    .c0_ddr4_act_n(Upcie_platform_c0_ddr4_act_n),
    .c0_ddr4_adr(Upcie_platform_c0_ddr4_adr),
    .c0_ddr4_ba(Upcie_platform_c0_ddr4_ba),
    .c0_ddr4_bg(Upcie_platform_c0_ddr4_bg),
    .c0_ddr4_ck_c(Upcie_platform_c0_ddr4_ck_c),
    .c0_ddr4_ck_t(Upcie_platform_c0_ddr4_ck_t),
    .c0_ddr4_cke(Upcie_platform_c0_ddr4_cke),
    .c0_ddr4_cs_n(Upcie_platform_c0_ddr4_cs_n),
    .c0_ddr4_dq(io_c0_ddr4_dq),
    .c0_ddr4_dqs_c(io_c0_ddr4_dqs_c),
    .c0_ddr4_dqs_t(io_c0_ddr4_dqs_t),
    .c0_ddr4_odt(Upcie_platform_c0_ddr4_odt),
    .c0_ddr4_par(Upcie_platform_c0_ddr4_par),
    .c0_ddr4_reset_n(Upcie_platform_c0_ddr4_reset_n),
    .c0_ddr4_ctrl_araddr(Upcie_platform_c0_ddr4_ctrl_araddr),
    .c0_ddr4_ctrl_arready(Upcie_platform_c0_ddr4_ctrl_arready),
    .c0_ddr4_ctrl_arvalid(Upcie_platform_c0_ddr4_ctrl_arvalid),
    .c0_ddr4_ctrl_awaddr(Upcie_platform_c0_ddr4_ctrl_awaddr),
    .c0_ddr4_ctrl_awready(Upcie_platform_c0_ddr4_ctrl_awready),
    .c0_ddr4_ctrl_awvalid(Upcie_platform_c0_ddr4_ctrl_awvalid),
    .c0_ddr4_ctrl_bready(Upcie_platform_c0_ddr4_ctrl_bready),
    .c0_ddr4_ctrl_bresp(Upcie_platform_c0_ddr4_ctrl_bresp),
    .c0_ddr4_ctrl_bvalid(Upcie_platform_c0_ddr4_ctrl_bvalid),
    .c0_ddr4_ctrl_rdata(Upcie_platform_c0_ddr4_ctrl_rdata),
    .c0_ddr4_ctrl_rready(Upcie_platform_c0_ddr4_ctrl_rready),
    .c0_ddr4_ctrl_rresp(Upcie_platform_c0_ddr4_ctrl_rresp),
    .c0_ddr4_ctrl_rvalid(Upcie_platform_c0_ddr4_ctrl_rvalid),
    .c0_ddr4_ctrl_wdata(Upcie_platform_c0_ddr4_ctrl_wdata),
    .c0_ddr4_ctrl_wready(Upcie_platform_c0_ddr4_ctrl_wready),
    .c0_ddr4_ctrl_wvalid(Upcie_platform_c0_ddr4_ctrl_wvalid),
    .c1_ddr4_act_n(Upcie_platform_c1_ddr4_act_n),
    .c1_ddr4_adr(Upcie_platform_c1_ddr4_adr),
    .c1_ddr4_ba(Upcie_platform_c1_ddr4_ba),
    .c1_ddr4_bg(Upcie_platform_c1_ddr4_bg),
    .c1_ddr4_ck_c(Upcie_platform_c1_ddr4_ck_c),
    .c1_ddr4_ck_t(Upcie_platform_c1_ddr4_ck_t),
    .c1_ddr4_cke(Upcie_platform_c1_ddr4_cke),
    .c1_ddr4_cs_n(Upcie_platform_c1_ddr4_cs_n),
    .c1_ddr4_dq(io_c1_ddr4_dq),
    .c1_ddr4_dqs_c(io_c1_ddr4_dqs_c),
    .c1_ddr4_dqs_t(io_c1_ddr4_dqs_t),
    .c1_ddr4_odt(Upcie_platform_c1_ddr4_odt),
    .c1_ddr4_par(Upcie_platform_c1_ddr4_par),
    .c1_ddr4_reset_n(Upcie_platform_c1_ddr4_reset_n),
    .c1_ddr4_ctrl_araddr(Upcie_platform_c1_ddr4_ctrl_araddr),
    .c1_ddr4_ctrl_arready(Upcie_platform_c1_ddr4_ctrl_arready),
    .c1_ddr4_ctrl_arvalid(Upcie_platform_c1_ddr4_ctrl_arvalid),
    .c1_ddr4_ctrl_awaddr(Upcie_platform_c1_ddr4_ctrl_awaddr),
    .c1_ddr4_ctrl_awready(Upcie_platform_c1_ddr4_ctrl_awready),
    .c1_ddr4_ctrl_awvalid(Upcie_platform_c1_ddr4_ctrl_awvalid),
    .c1_ddr4_ctrl_bready(Upcie_platform_c1_ddr4_ctrl_bready),
    .c1_ddr4_ctrl_bresp(Upcie_platform_c1_ddr4_ctrl_bresp),
    .c1_ddr4_ctrl_bvalid(Upcie_platform_c1_ddr4_ctrl_bvalid),
    .c1_ddr4_ctrl_rdata(Upcie_platform_c1_ddr4_ctrl_rdata),
    .c1_ddr4_ctrl_rready(Upcie_platform_c1_ddr4_ctrl_rready),
    .c1_ddr4_ctrl_rresp(Upcie_platform_c1_ddr4_ctrl_rresp),
    .c1_ddr4_ctrl_rvalid(Upcie_platform_c1_ddr4_ctrl_rvalid),
    .c1_ddr4_ctrl_wdata(Upcie_platform_c1_ddr4_ctrl_wdata),
    .c1_ddr4_ctrl_wready(Upcie_platform_c1_ddr4_ctrl_wready),
    .c1_ddr4_ctrl_wvalid(Upcie_platform_c1_ddr4_ctrl_wvalid),
    .m_axil_araddr(Upcie_platform_m_axil_araddr),
    .m_axil_arprot(Upcie_platform_m_axil_arprot),
    .m_axil_arready(Upcie_platform_m_axil_arready),
    .m_axil_arvalid(Upcie_platform_m_axil_arvalid),
    .m_axil_awaddr(Upcie_platform_m_axil_awaddr),
    .m_axil_awprot(Upcie_platform_m_axil_awprot),
    .m_axil_awready(Upcie_platform_m_axil_awready),
    .m_axil_awvalid(Upcie_platform_m_axil_awvalid),
    .m_axil_bready(Upcie_platform_m_axil_bready),
    .m_axil_bresp(Upcie_platform_m_axil_bresp),
    .m_axil_bvalid(Upcie_platform_m_axil_bvalid),
    .m_axil_rdata(Upcie_platform_m_axil_rdata),
    .m_axil_rready(Upcie_platform_m_axil_rready),
    .m_axil_rresp(Upcie_platform_m_axil_rresp),
    .m_axil_rvalid(Upcie_platform_m_axil_rvalid),
    .m_axil_wdata(Upcie_platform_m_axil_wdata),
    .m_axil_wready(Upcie_platform_m_axil_wready),
    .m_axil_wstrb(Upcie_platform_m_axil_wstrb),
    .m_axil_wvalid(Upcie_platform_m_axil_wvalid),
    .dma0_write_idle(Upcie_platform_dma0_write_idle),
    .dma0_write_irq(Upcie_platform_dma0_write_irq),
    .dma0_write_valid(Upcie_platform_dma0_write_valid),
    .dma0_write_da(Upcie_platform_dma0_write_da),
    .dma0_write_da_msb(Upcie_platform_dma0_write_da_msb),
    .dma0_write_len(Upcie_platform_dma0_write_len),
    .dma0_write_tdata(Upcie_platform_dma0_write_tdata),
    .dma0_write_tkeep(Upcie_platform_dma0_write_tkeep),
    .dma0_write_tlast(Upcie_platform_dma0_write_tlast),
    .dma0_write_tready(Upcie_platform_dma0_write_tready),
    .dma0_write_tvalid(Upcie_platform_dma0_write_tvalid),
    .dma1_write_idle(Upcie_platform_dma1_write_idle),
    .dma1_write_irq(Upcie_platform_dma1_write_irq),
    .dma1_write_valid(Upcie_platform_dma1_write_valid),
    .dma1_write_da(Upcie_platform_dma1_write_da),
    .dma1_write_da_msb(Upcie_platform_dma1_write_da_msb),
    .dma1_write_len(Upcie_platform_dma1_write_len),
    .dma1_write_tdata(Upcie_platform_dma1_write_tdata),
    .dma1_write_tkeep(Upcie_platform_dma1_write_tkeep),
    .dma1_write_tlast(Upcie_platform_dma1_write_tlast),
    .dma1_write_tready(Upcie_platform_dma1_write_tready),
    .dma1_write_tvalid(Upcie_platform_dma1_write_tvalid),
    .dma0_read_idle(Upcie_platform_dma0_read_idle),
    .dma0_read_irq(Upcie_platform_dma0_read_irq),
    .dma0_read_valid(Upcie_platform_dma0_read_valid),
    .dma0_read_sa(Upcie_platform_dma0_read_sa),
    .dma0_read_sa_msb(Upcie_platform_dma0_read_sa_msb),
    .dma0_read_len(Upcie_platform_dma0_read_len),
    .dma0_read_tdata(Upcie_platform_dma0_read_tdata),
    .dma0_read_tkeep(Upcie_platform_dma0_read_tkeep),
    .dma0_read_tlast(Upcie_platform_dma0_read_tlast),
    .dma0_read_tready(Upcie_platform_dma0_read_tready),
    .dma0_read_tvalid(Upcie_platform_dma0_read_tvalid),
    .dma1_read_idle(Upcie_platform_dma1_read_idle),
    .dma1_read_irq(Upcie_platform_dma1_read_irq),
    .dma1_read_valid(Upcie_platform_dma1_read_valid),
    .dma1_read_sa(Upcie_platform_dma1_read_sa),
    .dma1_read_sa_msb(Upcie_platform_dma1_read_sa_msb),
    .dma1_read_len(Upcie_platform_dma1_read_len),
    .dma1_read_tdata(Upcie_platform_dma1_read_tdata),
    .dma1_read_tkeep(Upcie_platform_dma1_read_tkeep),
    .dma1_read_tlast(Upcie_platform_dma1_read_tlast),
    .dma1_read_tready(Upcie_platform_dma1_read_tready),
    .dma1_read_tvalid(Upcie_platform_dma1_read_tvalid),
    .dma2_read_idle(Upcie_platform_dma2_read_idle),
    .dma2_read_irq(Upcie_platform_dma2_read_irq),
    .dma2_read_valid(Upcie_platform_dma2_read_valid),
    .dma2_read_sa(Upcie_platform_dma2_read_sa),
    .dma2_read_sa_msb(Upcie_platform_dma2_read_sa_msb),
    .dma2_read_len(Upcie_platform_dma2_read_len),
    .dma2_read_tdata(Upcie_platform_dma2_read_tdata),
    .dma2_read_tkeep(Upcie_platform_dma2_read_tkeep),
    .dma2_read_tlast(Upcie_platform_dma2_read_tlast),
    .dma2_read_tready(Upcie_platform_dma2_read_tready),
    .dma2_read_tvalid(Upcie_platform_dma2_read_tvalid),
    .dma3_read_idle(Upcie_platform_dma3_read_idle),
    .dma3_read_irq(Upcie_platform_dma3_read_irq),
    .dma3_read_valid(Upcie_platform_dma3_read_valid),
    .dma3_read_sa(Upcie_platform_dma3_read_sa),
    .dma3_read_sa_msb(Upcie_platform_dma3_read_sa_msb),
    .dma3_read_len(Upcie_platform_dma3_read_len),
    .dma3_read_tdata(Upcie_platform_dma3_read_tdata),
    .dma3_read_tkeep(Upcie_platform_dma3_read_tkeep),
    .dma3_read_tlast(Upcie_platform_dma3_read_tlast),
    .dma3_read_tready(Upcie_platform_dma3_read_tready),
    .dma3_read_tvalid(Upcie_platform_dma3_read_tvalid)
  );
  IR_For_DLA_regs #(.AXI_ADDR_WIDTH(32), .BASEADDR(0)) UIR_For_DLA_regs ( // @[lapar_top.scala 184:30]
    .axi_aclk(UIR_For_DLA_regs_axi_aclk),
    .axi_aresetn(UIR_For_DLA_regs_axi_aresetn),
    .s_axi_araddr(UIR_For_DLA_regs_s_axi_araddr),
    .s_axi_arprot(UIR_For_DLA_regs_s_axi_arprot),
    .s_axi_arready(UIR_For_DLA_regs_s_axi_arready),
    .s_axi_arvalid(UIR_For_DLA_regs_s_axi_arvalid),
    .s_axi_awaddr(UIR_For_DLA_regs_s_axi_awaddr),
    .s_axi_awprot(UIR_For_DLA_regs_s_axi_awprot),
    .s_axi_awready(UIR_For_DLA_regs_s_axi_awready),
    .s_axi_awvalid(UIR_For_DLA_regs_s_axi_awvalid),
    .s_axi_bready(UIR_For_DLA_regs_s_axi_bready),
    .s_axi_bresp(UIR_For_DLA_regs_s_axi_bresp),
    .s_axi_bvalid(UIR_For_DLA_regs_s_axi_bvalid),
    .s_axi_rdata(UIR_For_DLA_regs_s_axi_rdata),
    .s_axi_rready(UIR_For_DLA_regs_s_axi_rready),
    .s_axi_rresp(UIR_For_DLA_regs_s_axi_rresp),
    .s_axi_rvalid(UIR_For_DLA_regs_s_axi_rvalid),
    .s_axi_wdata(UIR_For_DLA_regs_s_axi_wdata),
    .s_axi_wready(UIR_For_DLA_regs_s_axi_wready),
    .s_axi_wstrb(UIR_For_DLA_regs_s_axi_wstrb),
    .s_axi_wvalid(UIR_For_DLA_regs_s_axi_wvalid),
    .cfg_reg_loop_time_strobe(UIR_For_DLA_regs_cfg_reg_loop_time_strobe),
    .cfg_reg_loop_time_value(UIR_For_DLA_regs_cfg_reg_loop_time_value),
    .cfg_reg_cin_size_strobe(UIR_For_DLA_regs_cfg_reg_cin_size_strobe),
    .cfg_reg_cin_size_value(UIR_For_DLA_regs_cfg_reg_cin_size_value),
    .cfg_reg_cout_size_strobe(UIR_For_DLA_regs_cfg_reg_cout_size_strobe),
    .cfg_reg_cout_size_value(UIR_For_DLA_regs_cfg_reg_cout_size_value),
    .cfg_reg_kernel_part0_start_strobe(UIR_For_DLA_regs_cfg_reg_kernel_part0_start_strobe),
    .cfg_reg_kernel_part0_start_value(UIR_For_DLA_regs_cfg_reg_kernel_part0_start_value),
    .cfg_reg_kernel_part1_start_strobe(UIR_For_DLA_regs_cfg_reg_kernel_part1_start_strobe),
    .cfg_reg_kernel_part1_start_value(UIR_For_DLA_regs_cfg_reg_kernel_part1_start_value),
    .cfg_reg_cin_base_addr_strobe(UIR_For_DLA_regs_cfg_reg_cin_base_addr_strobe),
    .cfg_reg_cin_base_addr_value(UIR_For_DLA_regs_cfg_reg_cin_base_addr_value),
    .cfg_reg_cin_base_addr_msb_strobe(UIR_For_DLA_regs_cfg_reg_cin_base_addr_msb_strobe),
    .cfg_reg_cin_base_addr_msb_value(UIR_For_DLA_regs_cfg_reg_cin_base_addr_msb_value),
    .cfg_reg_cin_rd_len_strobe(UIR_For_DLA_regs_cfg_reg_cin_rd_len_strobe),
    .cfg_reg_cin_rd_len_value(UIR_For_DLA_regs_cfg_reg_cin_rd_len_value),
    .cfg_reg_upsample_base_addr_strobe(UIR_For_DLA_regs_cfg_reg_upsample_base_addr_strobe),
    .cfg_reg_upsample_base_addr_value(UIR_For_DLA_regs_cfg_reg_upsample_base_addr_value),
    .cfg_reg_upsample_base_addr_msb_strobe(UIR_For_DLA_regs_cfg_reg_upsample_base_addr_msb_strobe),
    .cfg_reg_upsample_base_addr_msb_value(UIR_For_DLA_regs_cfg_reg_upsample_base_addr_msb_value),
    .cfg_reg_upsample_rd_len_strobe(UIR_For_DLA_regs_cfg_reg_upsample_rd_len_strobe),
    .cfg_reg_upsample_rd_len_value(UIR_For_DLA_regs_cfg_reg_upsample_rd_len_value),
    .cfg_reg_upsample_loop_time_strobe(UIR_For_DLA_regs_cfg_reg_upsample_loop_time_strobe),
    .cfg_reg_upsample_loop_time_value(UIR_For_DLA_regs_cfg_reg_upsample_loop_time_value),
    .cfg_reg_upsample_cin_size_strobe(UIR_For_DLA_regs_cfg_reg_upsample_cin_size_strobe),
    .cfg_reg_upsample_cin_size_value(UIR_For_DLA_regs_cfg_reg_upsample_cin_size_value),
    .cfg_reg_d2s_base_addr_strobe(UIR_For_DLA_regs_cfg_reg_d2s_base_addr_strobe),
    .cfg_reg_d2s_base_addr_value(UIR_For_DLA_regs_cfg_reg_d2s_base_addr_value),
    .cfg_reg_d2s_base_addr_msb_strobe(UIR_For_DLA_regs_cfg_reg_d2s_base_addr_msb_strobe),
    .cfg_reg_d2s_base_addr_msb_value(UIR_For_DLA_regs_cfg_reg_d2s_base_addr_msb_value),
    .cfg_reg_d2s_rd_len_strobe(UIR_For_DLA_regs_cfg_reg_d2s_rd_len_strobe),
    .cfg_reg_d2s_rd_len_value(UIR_For_DLA_regs_cfg_reg_d2s_rd_len_value),
    .cfg_reg_d2s_total_rd_len_strobe(UIR_For_DLA_regs_cfg_reg_d2s_total_rd_len_strobe),
    .cfg_reg_d2s_total_rd_len_value(UIR_For_DLA_regs_cfg_reg_d2s_total_rd_len_value),
    .cfg_reg_d2s_single_rd_len_strobe(UIR_For_DLA_regs_cfg_reg_d2s_single_rd_len_strobe),
    .cfg_reg_d2s_single_rd_len_value(UIR_For_DLA_regs_cfg_reg_d2s_single_rd_len_value),
    .cfg_reg_cout_base_addr_strobe(UIR_For_DLA_regs_cfg_reg_cout_base_addr_strobe),
    .cfg_reg_cout_base_addr_value(UIR_For_DLA_regs_cfg_reg_cout_base_addr_value),
    .cfg_reg_cout_base_addr_msb_strobe(UIR_For_DLA_regs_cfg_reg_cout_base_addr_msb_strobe),
    .cfg_reg_cout_base_addr_msb_value(UIR_For_DLA_regs_cfg_reg_cout_base_addr_msb_value),
    .cfg_reg_cout_wr_len_strobe(UIR_For_DLA_regs_cfg_reg_cout_wr_len_strobe),
    .cfg_reg_cout_wr_len_value(UIR_For_DLA_regs_cfg_reg_cout_wr_len_value),
    .cfg_reg_einsum_base_addr_strobe(UIR_For_DLA_regs_cfg_reg_einsum_base_addr_strobe),
    .cfg_reg_einsum_base_addr_value(UIR_For_DLA_regs_cfg_reg_einsum_base_addr_value),
    .cfg_reg_einsum_base_addr_msb_strobe(UIR_For_DLA_regs_cfg_reg_einsum_base_addr_msb_strobe),
    .cfg_reg_einsum_base_addr_msb_value(UIR_For_DLA_regs_cfg_reg_einsum_base_addr_msb_value),
    .cfg_reg_einsum_wr_len_strobe(UIR_For_DLA_regs_cfg_reg_einsum_wr_len_strobe),
    .cfg_reg_einsum_wr_len_value(UIR_For_DLA_regs_cfg_reg_einsum_wr_len_value),
    .cfg_reg_einsum_loop_time_strobe(UIR_For_DLA_regs_cfg_reg_einsum_loop_time_strobe),
    .cfg_reg_einsum_loop_time_value(UIR_For_DLA_regs_cfg_reg_einsum_loop_time_value),
    .cfg_reg_param_base_addr_strobe(UIR_For_DLA_regs_cfg_reg_param_base_addr_strobe),
    .cfg_reg_param_base_addr_value(UIR_For_DLA_regs_cfg_reg_param_base_addr_value),
    .cfg_reg_param_base_addr_msb_strobe(UIR_For_DLA_regs_cfg_reg_param_base_addr_msb_strobe),
    .cfg_reg_param_base_addr_msb_value(UIR_For_DLA_regs_cfg_reg_param_base_addr_msb_value),
    .cfg_reg_param_rd_len_strobe(UIR_For_DLA_regs_cfg_reg_param_rd_len_strobe),
    .cfg_reg_param_rd_len_value(UIR_For_DLA_regs_cfg_reg_param_rd_len_value),
    .status_reg_rd_fm_cin_cnt(UIR_For_DLA_regs_status_reg_rd_fm_cin_cnt),
    .status_reg_rd_fm_dout_cnt(UIR_For_DLA_regs_status_reg_rd_fm_dout_cnt),
    .status_reg_rd_sum_param_din_cnt(UIR_For_DLA_regs_status_reg_rd_sum_param_din_cnt),
    .status_reg_rd_sum_param_param_cnt(UIR_For_DLA_regs_status_reg_rd_sum_param_param_cnt),
    .status_reg_rd_sum_param_sum_cnt(UIR_For_DLA_regs_status_reg_rd_sum_param_sum_cnt),
    .status_reg_conv_relu_in_cnt(UIR_For_DLA_regs_status_reg_conv_relu_in_cnt),
    .status_reg_conv_relu_out_cnt(UIR_For_DLA_regs_status_reg_conv_relu_out_cnt),
    .status_reg_relu_valid_cnt(UIR_For_DLA_regs_status_reg_relu_valid_cnt),
    .status_reg_layer_out_valid_cnt(UIR_For_DLA_regs_status_reg_layer_out_valid_cnt),
    .status_reg_wr_conv_relu_din_cnt(UIR_For_DLA_regs_status_reg_wr_conv_relu_din_cnt),
    .status_reg_wr_conv_relu_dout_cnt(UIR_For_DLA_regs_status_reg_wr_conv_relu_dout_cnt),
    .status_reg_rd_fm_tstvec(UIR_For_DLA_regs_status_reg_rd_fm_tstvec),
    .status_reg_rd_sum_param_tstvec(UIR_For_DLA_regs_status_reg_rd_sum_param_tstvec),
    .status_reg_wr_conv_relu_tstvec(UIR_For_DLA_regs_status_reg_wr_conv_relu_tstvec),
    .status_reg_kernel_part0_tstvec(UIR_For_DLA_regs_status_reg_kernel_part0_tstvec),
    .status_reg_kernel_part1_tstvec(UIR_For_DLA_regs_status_reg_kernel_part1_tstvec),
    .status_reg_kernel_part0_status(UIR_For_DLA_regs_status_reg_kernel_part0_status),
    .status_reg_kernel_part1_status(UIR_For_DLA_regs_status_reg_kernel_part1_status),
    .status_reg_kernel_part0_run_time(UIR_For_DLA_regs_status_reg_kernel_part0_run_time),
    .status_reg_kernel_part1_run_time(UIR_For_DLA_regs_status_reg_kernel_part1_run_time),
    .status_reg_rd_d2s_part1_cnt(UIR_For_DLA_regs_status_reg_rd_d2s_part1_cnt),
    .status_reg_rd_d2s_part2_cnt(UIR_For_DLA_regs_status_reg_rd_d2s_part2_cnt),
    .status_reg_rd_d2s_part3_cnt(UIR_For_DLA_regs_status_reg_rd_d2s_part3_cnt),
    .status_reg_rd_d2s_part4_cnt(UIR_For_DLA_regs_status_reg_rd_d2s_part4_cnt),
    .status_reg_rd_upsample_din_cnt(UIR_For_DLA_regs_status_reg_rd_upsample_din_cnt),
    .status_reg_rd_upsample_dout_cnt(UIR_For_DLA_regs_status_reg_rd_upsample_dout_cnt),
    .status_reg_wr_einsum_din_cnt(UIR_For_DLA_regs_status_reg_wr_einsum_din_cnt),
    .status_reg_wr_einsum_dout_cnt(UIR_For_DLA_regs_status_reg_wr_einsum_dout_cnt),
    .status_reg_einsum_in_cnt(UIR_For_DLA_regs_status_reg_einsum_in_cnt),
    .status_reg_einsum_out_cnt(UIR_For_DLA_regs_status_reg_einsum_out_cnt),
    .status_reg_conv_5x5_in_cnt(UIR_For_DLA_regs_status_reg_conv_5x5_in_cnt),
    .status_reg_conv_5x5_out_cnt(UIR_For_DLA_regs_status_reg_conv_5x5_out_cnt),
    .status_reg_rd_d2s_tstvec(UIR_For_DLA_regs_status_reg_rd_d2s_tstvec),
    .status_reg_rd_upsample_tstvec(UIR_For_DLA_regs_status_reg_rd_upsample_tstvec),
    .status_reg_wr_einsum_tstvec(UIR_For_DLA_regs_status_reg_wr_einsum_tstvec)
  );
  lapar_ip #(.CIN_W        (16), .CH_OUT       (32), .CORE_NUM     (1), .IM_WIDTH     (640), .BIAS_W       (16), .AXI_DATA_W   (512), .CH_IN        (32), .IM_HEIGHT    (360), .S_AXIL_DATA_W(32), .S_AXIL_ADDR_W(32), .AXI_ADDR_W   (64)) Ulapar_ip ( // @[lapar_top.scala 185:23]
    .clk_x2(Ulapar_ip_clk_x2),
    .m_axi_aclk(Ulapar_ip_m_axi_aclk),
    .m_axi_aresetn(Ulapar_ip_m_axi_aresetn),
    .kernel_part0_interrupt(Ulapar_ip_kernel_part0_interrupt),
    .kernel_part1_interrupt(Ulapar_ip_kernel_part1_interrupt),
    .cfg_reg_loop_time_strobe(Ulapar_ip_cfg_reg_loop_time_strobe),
    .cfg_reg_loop_time_value(Ulapar_ip_cfg_reg_loop_time_value),
    .cfg_reg_cin_size_strobe(Ulapar_ip_cfg_reg_cin_size_strobe),
    .cfg_reg_cin_size_value(Ulapar_ip_cfg_reg_cin_size_value),
    .cfg_reg_cout_size_strobe(Ulapar_ip_cfg_reg_cout_size_strobe),
    .cfg_reg_cout_size_value(Ulapar_ip_cfg_reg_cout_size_value),
    .cfg_reg_kernel_part0_start_strobe(Ulapar_ip_cfg_reg_kernel_part0_start_strobe),
    .cfg_reg_kernel_part0_start_value(Ulapar_ip_cfg_reg_kernel_part0_start_value),
    .cfg_reg_kernel_part1_start_strobe(Ulapar_ip_cfg_reg_kernel_part1_start_strobe),
    .cfg_reg_kernel_part1_start_value(Ulapar_ip_cfg_reg_kernel_part1_start_value),
    .cfg_reg_cin_base_addr_strobe(Ulapar_ip_cfg_reg_cin_base_addr_strobe),
    .cfg_reg_cin_base_addr_value(Ulapar_ip_cfg_reg_cin_base_addr_value),
    .cfg_reg_cin_base_addr_msb_strobe(Ulapar_ip_cfg_reg_cin_base_addr_msb_strobe),
    .cfg_reg_cin_base_addr_msb_value(Ulapar_ip_cfg_reg_cin_base_addr_msb_value),
    .cfg_reg_cin_rd_len_strobe(Ulapar_ip_cfg_reg_cin_rd_len_strobe),
    .cfg_reg_cin_rd_len_value(Ulapar_ip_cfg_reg_cin_rd_len_value),
    .cfg_reg_upsample_base_addr_strobe(Ulapar_ip_cfg_reg_upsample_base_addr_strobe),
    .cfg_reg_upsample_base_addr_value(Ulapar_ip_cfg_reg_upsample_base_addr_value),
    .cfg_reg_upsample_base_addr_msb_strobe(Ulapar_ip_cfg_reg_upsample_base_addr_msb_strobe),
    .cfg_reg_upsample_base_addr_msb_value(Ulapar_ip_cfg_reg_upsample_base_addr_msb_value),
    .cfg_reg_upsample_rd_len_strobe(Ulapar_ip_cfg_reg_upsample_rd_len_strobe),
    .cfg_reg_upsample_rd_len_value(Ulapar_ip_cfg_reg_upsample_rd_len_value),
    .cfg_reg_upsample_loop_time_strobe(Ulapar_ip_cfg_reg_upsample_loop_time_strobe),
    .cfg_reg_upsample_loop_time_value(Ulapar_ip_cfg_reg_upsample_loop_time_value),
    .cfg_reg_upsample_cin_size_strobe(Ulapar_ip_cfg_reg_upsample_cin_size_strobe),
    .cfg_reg_upsample_cin_size_value(Ulapar_ip_cfg_reg_upsample_cin_size_value),
    .cfg_reg_d2s_base_addr_strobe(Ulapar_ip_cfg_reg_d2s_base_addr_strobe),
    .cfg_reg_d2s_base_addr_value(Ulapar_ip_cfg_reg_d2s_base_addr_value),
    .cfg_reg_d2s_base_addr_msb_strobe(Ulapar_ip_cfg_reg_d2s_base_addr_msb_strobe),
    .cfg_reg_d2s_base_addr_msb_value(Ulapar_ip_cfg_reg_d2s_base_addr_msb_value),
    .cfg_reg_d2s_rd_len_strobe(Ulapar_ip_cfg_reg_d2s_rd_len_strobe),
    .cfg_reg_d2s_rd_len_value(Ulapar_ip_cfg_reg_d2s_rd_len_value),
    .cfg_reg_d2s_total_rd_len_strobe(Ulapar_ip_cfg_reg_d2s_total_rd_len_strobe),
    .cfg_reg_d2s_total_rd_len_value(Ulapar_ip_cfg_reg_d2s_total_rd_len_value),
    .cfg_reg_d2s_single_rd_len_strobe(Ulapar_ip_cfg_reg_d2s_single_rd_len_strobe),
    .cfg_reg_d2s_single_rd_len_value(Ulapar_ip_cfg_reg_d2s_single_rd_len_value),
    .cfg_reg_cout_base_addr_strobe(Ulapar_ip_cfg_reg_cout_base_addr_strobe),
    .cfg_reg_cout_base_addr_value(Ulapar_ip_cfg_reg_cout_base_addr_value),
    .cfg_reg_cout_base_addr_msb_strobe(Ulapar_ip_cfg_reg_cout_base_addr_msb_strobe),
    .cfg_reg_cout_base_addr_msb_value(Ulapar_ip_cfg_reg_cout_base_addr_msb_value),
    .cfg_reg_cout_wr_len_strobe(Ulapar_ip_cfg_reg_cout_wr_len_strobe),
    .cfg_reg_cout_wr_len_value(Ulapar_ip_cfg_reg_cout_wr_len_value),
    .cfg_reg_einsum_base_addr_strobe(Ulapar_ip_cfg_reg_einsum_base_addr_strobe),
    .cfg_reg_einsum_base_addr_value(Ulapar_ip_cfg_reg_einsum_base_addr_value),
    .cfg_reg_einsum_base_addr_msb_strobe(Ulapar_ip_cfg_reg_einsum_base_addr_msb_strobe),
    .cfg_reg_einsum_base_addr_msb_value(Ulapar_ip_cfg_reg_einsum_base_addr_msb_value),
    .cfg_reg_einsum_wr_len_strobe(Ulapar_ip_cfg_reg_einsum_wr_len_strobe),
    .cfg_reg_einsum_wr_len_value(Ulapar_ip_cfg_reg_einsum_wr_len_value),
    .cfg_reg_einsum_loop_time_strobe(Ulapar_ip_cfg_reg_einsum_loop_time_strobe),
    .cfg_reg_einsum_loop_time_value(Ulapar_ip_cfg_reg_einsum_loop_time_value),
    .cfg_reg_param_base_addr_strobe(Ulapar_ip_cfg_reg_param_base_addr_strobe),
    .cfg_reg_param_base_addr_value(Ulapar_ip_cfg_reg_param_base_addr_value),
    .cfg_reg_param_base_addr_msb_strobe(Ulapar_ip_cfg_reg_param_base_addr_msb_strobe),
    .cfg_reg_param_base_addr_msb_value(Ulapar_ip_cfg_reg_param_base_addr_msb_value),
    .cfg_reg_param_rd_len_strobe(Ulapar_ip_cfg_reg_param_rd_len_strobe),
    .cfg_reg_param_rd_len_value(Ulapar_ip_cfg_reg_param_rd_len_value),
    .status_reg_rd_fm_cin_cnt(Ulapar_ip_status_reg_rd_fm_cin_cnt),
    .status_reg_rd_fm_dout_cnt(Ulapar_ip_status_reg_rd_fm_dout_cnt),
    .status_reg_rd_sum_param_din_cnt(Ulapar_ip_status_reg_rd_sum_param_din_cnt),
    .status_reg_rd_sum_param_param_cnt(Ulapar_ip_status_reg_rd_sum_param_param_cnt),
    .status_reg_rd_sum_param_sum_cnt(Ulapar_ip_status_reg_rd_sum_param_sum_cnt),
    .status_reg_conv_relu_in_cnt(Ulapar_ip_status_reg_conv_relu_in_cnt),
    .status_reg_conv_relu_out_cnt(Ulapar_ip_status_reg_conv_relu_out_cnt),
    .status_reg_relu_valid_cnt(Ulapar_ip_status_reg_relu_valid_cnt),
    .status_reg_layer_out_valid_cnt(Ulapar_ip_status_reg_layer_out_valid_cnt),
    .status_reg_wr_conv_relu_din_cnt(Ulapar_ip_status_reg_wr_conv_relu_din_cnt),
    .status_reg_wr_conv_relu_dout_cnt(Ulapar_ip_status_reg_wr_conv_relu_dout_cnt),
    .status_reg_rd_fm_tstvec(Ulapar_ip_status_reg_rd_fm_tstvec),
    .status_reg_rd_sum_param_tstvec(Ulapar_ip_status_reg_rd_sum_param_tstvec),
    .status_reg_wr_conv_relu_tstvec(Ulapar_ip_status_reg_wr_conv_relu_tstvec),
    .status_reg_kernel_part0_tstvec(Ulapar_ip_status_reg_kernel_part0_tstvec),
    .status_reg_kernel_part1_tstvec(Ulapar_ip_status_reg_kernel_part1_tstvec),
    .status_reg_kernel_part0_status(Ulapar_ip_status_reg_kernel_part0_status),
    .status_reg_kernel_part1_status(Ulapar_ip_status_reg_kernel_part1_status),
    .status_reg_kernel_part0_run_time(Ulapar_ip_status_reg_kernel_part0_run_time),
    .status_reg_kernel_part1_run_time(Ulapar_ip_status_reg_kernel_part1_run_time),
    .status_reg_rd_d2s_part1_cnt(Ulapar_ip_status_reg_rd_d2s_part1_cnt),
    .status_reg_rd_d2s_part2_cnt(Ulapar_ip_status_reg_rd_d2s_part2_cnt),
    .status_reg_rd_d2s_part3_cnt(Ulapar_ip_status_reg_rd_d2s_part3_cnt),
    .status_reg_rd_d2s_part4_cnt(Ulapar_ip_status_reg_rd_d2s_part4_cnt),
    .status_reg_rd_upsample_din_cnt(Ulapar_ip_status_reg_rd_upsample_din_cnt),
    .status_reg_rd_upsample_dout_cnt(Ulapar_ip_status_reg_rd_upsample_dout_cnt),
    .status_reg_wr_einsum_din_cnt(Ulapar_ip_status_reg_wr_einsum_din_cnt),
    .status_reg_wr_einsum_dout_cnt(Ulapar_ip_status_reg_wr_einsum_dout_cnt),
    .status_reg_einsum_in_cnt(Ulapar_ip_status_reg_einsum_in_cnt),
    .status_reg_einsum_out_cnt(Ulapar_ip_status_reg_einsum_out_cnt),
    .status_reg_conv_5x5_in_cnt(Ulapar_ip_status_reg_conv_5x5_in_cnt),
    .status_reg_conv_5x5_out_cnt(Ulapar_ip_status_reg_conv_5x5_out_cnt),
    .status_reg_rd_d2s_tstvec(Ulapar_ip_status_reg_rd_d2s_tstvec),
    .status_reg_rd_upsample_tstvec(Ulapar_ip_status_reg_rd_upsample_tstvec),
    .status_reg_wr_einsum_tstvec(Ulapar_ip_status_reg_wr_einsum_tstvec),
    .m00_wr_ddr_idle(Ulapar_ip_m00_wr_ddr_idle),
    .m00_wr_ddr_irq(Ulapar_ip_m00_wr_ddr_irq),
    .m00_wr_ddr_valid(Ulapar_ip_m00_wr_ddr_valid),
    .m00_wr_ddr_da(Ulapar_ip_m00_wr_ddr_da),
    .m00_wr_ddr_da_msb(Ulapar_ip_m00_wr_ddr_da_msb),
    .m00_wr_ddr_len(Ulapar_ip_m00_wr_ddr_len),
    .m00_wr_ddr_tdata(Ulapar_ip_m00_wr_ddr_tdata),
    .m00_wr_ddr_tkeep(Ulapar_ip_m00_wr_ddr_tkeep),
    .m00_wr_ddr_tlast(Ulapar_ip_m00_wr_ddr_tlast),
    .m00_wr_ddr_tready(Ulapar_ip_m00_wr_ddr_tready),
    .m00_wr_ddr_tvalid(Ulapar_ip_m00_wr_ddr_tvalid),
    .m01_wr_ddr_idle(Ulapar_ip_m01_wr_ddr_idle),
    .m01_wr_ddr_irq(Ulapar_ip_m01_wr_ddr_irq),
    .m01_wr_ddr_valid(Ulapar_ip_m01_wr_ddr_valid),
    .m01_wr_ddr_da(Ulapar_ip_m01_wr_ddr_da),
    .m01_wr_ddr_da_msb(Ulapar_ip_m01_wr_ddr_da_msb),
    .m01_wr_ddr_len(Ulapar_ip_m01_wr_ddr_len),
    .m01_wr_ddr_tdata(Ulapar_ip_m01_wr_ddr_tdata),
    .m01_wr_ddr_tkeep(Ulapar_ip_m01_wr_ddr_tkeep),
    .m01_wr_ddr_tlast(Ulapar_ip_m01_wr_ddr_tlast),
    .m01_wr_ddr_tready(Ulapar_ip_m01_wr_ddr_tready),
    .m01_wr_ddr_tvalid(Ulapar_ip_m01_wr_ddr_tvalid),
    .m00_rd_ddr_idle(Ulapar_ip_m00_rd_ddr_idle),
    .m00_rd_ddr_irq(Ulapar_ip_m00_rd_ddr_irq),
    .m00_rd_ddr_valid(Ulapar_ip_m00_rd_ddr_valid),
    .m00_rd_ddr_sa(Ulapar_ip_m00_rd_ddr_sa),
    .m00_rd_ddr_sa_msb(Ulapar_ip_m00_rd_ddr_sa_msb),
    .m00_rd_ddr_len(Ulapar_ip_m00_rd_ddr_len),
    .m00_rd_ddr_tdata(Ulapar_ip_m00_rd_ddr_tdata),
    .m00_rd_ddr_tkeep(Ulapar_ip_m00_rd_ddr_tkeep),
    .m00_rd_ddr_tlast(Ulapar_ip_m00_rd_ddr_tlast),
    .m00_rd_ddr_tready(Ulapar_ip_m00_rd_ddr_tready),
    .m00_rd_ddr_tvalid(Ulapar_ip_m00_rd_ddr_tvalid),
    .m01_rd_ddr_idle(Ulapar_ip_m01_rd_ddr_idle),
    .m01_rd_ddr_irq(Ulapar_ip_m01_rd_ddr_irq),
    .m01_rd_ddr_valid(Ulapar_ip_m01_rd_ddr_valid),
    .m01_rd_ddr_sa(Ulapar_ip_m01_rd_ddr_sa),
    .m01_rd_ddr_sa_msb(Ulapar_ip_m01_rd_ddr_sa_msb),
    .m01_rd_ddr_len(Ulapar_ip_m01_rd_ddr_len),
    .m01_rd_ddr_tdata(Ulapar_ip_m01_rd_ddr_tdata),
    .m01_rd_ddr_tkeep(Ulapar_ip_m01_rd_ddr_tkeep),
    .m01_rd_ddr_tlast(Ulapar_ip_m01_rd_ddr_tlast),
    .m01_rd_ddr_tready(Ulapar_ip_m01_rd_ddr_tready),
    .m01_rd_ddr_tvalid(Ulapar_ip_m01_rd_ddr_tvalid),
    .m02_rd_ddr_idle(Ulapar_ip_m02_rd_ddr_idle),
    .m02_rd_ddr_irq(Ulapar_ip_m02_rd_ddr_irq),
    .m02_rd_ddr_valid(Ulapar_ip_m02_rd_ddr_valid),
    .m02_rd_ddr_sa(Ulapar_ip_m02_rd_ddr_sa),
    .m02_rd_ddr_sa_msb(Ulapar_ip_m02_rd_ddr_sa_msb),
    .m02_rd_ddr_len(Ulapar_ip_m02_rd_ddr_len),
    .m02_rd_ddr_tdata(Ulapar_ip_m02_rd_ddr_tdata),
    .m02_rd_ddr_tkeep(Ulapar_ip_m02_rd_ddr_tkeep),
    .m02_rd_ddr_tlast(Ulapar_ip_m02_rd_ddr_tlast),
    .m02_rd_ddr_tready(Ulapar_ip_m02_rd_ddr_tready),
    .m02_rd_ddr_tvalid(Ulapar_ip_m02_rd_ddr_tvalid),
    .m03_rd_ddr_idle(Ulapar_ip_m03_rd_ddr_idle),
    .m03_rd_ddr_irq(Ulapar_ip_m03_rd_ddr_irq),
    .m03_rd_ddr_valid(Ulapar_ip_m03_rd_ddr_valid),
    .m03_rd_ddr_sa(Ulapar_ip_m03_rd_ddr_sa),
    .m03_rd_ddr_sa_msb(Ulapar_ip_m03_rd_ddr_sa_msb),
    .m03_rd_ddr_len(Ulapar_ip_m03_rd_ddr_len),
    .m03_rd_ddr_tdata(Ulapar_ip_m03_rd_ddr_tdata),
    .m03_rd_ddr_tkeep(Ulapar_ip_m03_rd_ddr_tkeep),
    .m03_rd_ddr_tlast(Ulapar_ip_m03_rd_ddr_tlast),
    .m03_rd_ddr_tready(Ulapar_ip_m03_rd_ddr_tready),
    .m03_rd_ddr_tvalid(Ulapar_ip_m03_rd_ddr_tvalid)
  );
  assign io_pcie_express_x16_txn = Upcie_platform_pci_express_x16_txn; // @[lapar_top.scala 239:27]
  assign io_pcie_express_x16_txp = Upcie_platform_pci_express_x16_txp; // @[lapar_top.scala 240:27]
  assign io_c0_ddr4_act_n = Upcie_platform_c0_ddr4_act_n; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_adr = Upcie_platform_c0_ddr4_adr; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_ba = Upcie_platform_c0_ddr4_ba; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_bg = Upcie_platform_c0_ddr4_bg; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_ck_c = Upcie_platform_c0_ddr4_ck_c; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_ck_t = Upcie_platform_c0_ddr4_ck_t; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_cke = Upcie_platform_c0_ddr4_cke; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_cs_n = Upcie_platform_c0_ddr4_cs_n; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_odt = Upcie_platform_c0_ddr4_odt; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_par = Upcie_platform_c0_ddr4_par; // @[lapar_top.scala 205:21]
  assign io_c0_ddr4_reset_n = Upcie_platform_c0_ddr4_reset_n; // @[lapar_top.scala 205:21]
  assign io_c1_ddr4_act_n = Upcie_platform_c1_ddr4_act_n; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_adr = Upcie_platform_c1_ddr4_adr; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_ba = Upcie_platform_c1_ddr4_ba; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_bg = Upcie_platform_c1_ddr4_bg; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_ck_c = Upcie_platform_c1_ddr4_ck_c; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_ck_t = Upcie_platform_c1_ddr4_ck_t; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_cke = Upcie_platform_c1_ddr4_cke; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_cs_n = Upcie_platform_c1_ddr4_cs_n; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_odt = Upcie_platform_c1_ddr4_odt; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_par = Upcie_platform_c1_ddr4_par; // @[lapar_top.scala 206:21]
  assign io_c1_ddr4_reset_n = Upcie_platform_c1_ddr4_reset_n; // @[lapar_top.scala 206:21]
  assign Upcie_platform_default_300mhz_clk0_clk_n = io_c0_ddr4_clk_n; // @[lapar_top.scala 230:47]
  assign Upcie_platform_default_300mhz_clk0_clk_p = io_c0_ddr4_clk_p; // @[lapar_top.scala 231:47]
  assign Upcie_platform_default_300mhz_clk1_clk_n = io_c1_ddr4_clk_n; // @[lapar_top.scala 232:47]
  assign Upcie_platform_default_300mhz_clk1_clk_p = io_c1_ddr4_clk_p; // @[lapar_top.scala 233:47]
  assign Upcie_platform_pcie_refclk_clk_n = io_pcie_refclk_clk_n; // @[lapar_top.scala 234:47]
  assign Upcie_platform_pcie_refclk_clk_p = io_pcie_refclk_clk_p; // @[lapar_top.scala 235:47]
  assign Upcie_platform_pci_express_x16_rxn = io_pcie_express_x16_rxn; // @[lapar_top.scala 237:27]
  assign Upcie_platform_pci_express_x16_rxp = io_pcie_express_x16_rxp; // @[lapar_top.scala 238:27]
  assign Upcie_platform_resetn = io_resetn; // @[lapar_top.scala 242:27]
  assign Upcie_platform_pcie_perstn = io_pcie_perstn; // @[lapar_top.scala 241:26]
  assign Upcie_platform_usr_irq_req = {Ulapar_ip_kernel_part1_interrupt,Ulapar_ip_kernel_part0_interrupt}; // @[lapar_top.scala 214:34]
  assign Upcie_platform_c0_ddr4_ctrl_araddr = 32'h0; // @[lapar_top.scala 194:41]
  assign Upcie_platform_c0_ddr4_ctrl_arvalid = 1'h0; // @[lapar_top.scala 193:42]
  assign Upcie_platform_c0_ddr4_ctrl_awaddr = 32'h0; // @[lapar_top.scala 189:41]
  assign Upcie_platform_c0_ddr4_ctrl_awvalid = 1'h0; // @[lapar_top.scala 188:42]
  assign Upcie_platform_c0_ddr4_ctrl_bready = 1'h0;
  assign Upcie_platform_c0_ddr4_ctrl_rready = 1'h1; // @[lapar_top.scala 195:41]
  assign Upcie_platform_c0_ddr4_ctrl_wdata = 32'h0; // @[lapar_top.scala 191:40]
  assign Upcie_platform_c0_ddr4_ctrl_wvalid = 1'h1; // @[lapar_top.scala 190:41 lapar_top.scala 192:41]
  assign Upcie_platform_c1_ddr4_ctrl_araddr = 32'h0; // @[lapar_top.scala 202:41]
  assign Upcie_platform_c1_ddr4_ctrl_arvalid = 1'h0; // @[lapar_top.scala 201:42]
  assign Upcie_platform_c1_ddr4_ctrl_awaddr = 32'h0; // @[lapar_top.scala 197:41]
  assign Upcie_platform_c1_ddr4_ctrl_awvalid = 1'h0; // @[lapar_top.scala 196:42]
  assign Upcie_platform_c1_ddr4_ctrl_bready = 1'h0;
  assign Upcie_platform_c1_ddr4_ctrl_rready = 1'h1; // @[lapar_top.scala 203:41]
  assign Upcie_platform_c1_ddr4_ctrl_wdata = 32'h0; // @[lapar_top.scala 199:40]
  assign Upcie_platform_c1_ddr4_ctrl_wvalid = 1'h1; // @[lapar_top.scala 198:41 lapar_top.scala 200:41]
  assign Upcie_platform_m_axil_arready = UIR_For_DLA_regs_s_axi_arready; // @[lapar_top.scala 222:31]
  assign Upcie_platform_m_axil_awready = UIR_For_DLA_regs_s_axi_awready; // @[lapar_top.scala 222:31]
  assign Upcie_platform_m_axil_bresp = UIR_For_DLA_regs_s_axi_bresp; // @[lapar_top.scala 222:31]
  assign Upcie_platform_m_axil_bvalid = UIR_For_DLA_regs_s_axi_bvalid; // @[lapar_top.scala 222:31]
  assign Upcie_platform_m_axil_rdata = UIR_For_DLA_regs_s_axi_rdata; // @[lapar_top.scala 222:31]
  assign Upcie_platform_m_axil_rresp = UIR_For_DLA_regs_s_axi_rresp; // @[lapar_top.scala 222:31]
  assign Upcie_platform_m_axil_rvalid = UIR_For_DLA_regs_s_axi_rvalid; // @[lapar_top.scala 222:31]
  assign Upcie_platform_m_axil_wready = UIR_For_DLA_regs_s_axi_wready; // @[lapar_top.scala 222:31]
  assign Upcie_platform_dma0_write_valid = Ulapar_ip_m00_wr_ddr_valid; // @[lapar_top.scala 227:32]
  assign Upcie_platform_dma0_write_da = Ulapar_ip_m00_wr_ddr_da; // @[lapar_top.scala 227:32]
  assign Upcie_platform_dma0_write_da_msb = Ulapar_ip_m00_wr_ddr_da_msb; // @[lapar_top.scala 227:32]
  assign Upcie_platform_dma0_write_len = Ulapar_ip_m00_wr_ddr_len; // @[lapar_top.scala 227:32]
  assign Upcie_platform_dma0_write_tdata = Ulapar_ip_m00_wr_ddr_tdata; // @[lapar_top.scala 227:32]
  assign Upcie_platform_dma0_write_tkeep = Ulapar_ip_m00_wr_ddr_tkeep; // @[lapar_top.scala 227:32]
  assign Upcie_platform_dma0_write_tlast = Ulapar_ip_m00_wr_ddr_tlast; // @[lapar_top.scala 227:32]
  assign Upcie_platform_dma0_write_tvalid = Ulapar_ip_m00_wr_ddr_tvalid; // @[lapar_top.scala 227:32]
  assign Upcie_platform_dma1_write_valid = Ulapar_ip_m01_wr_ddr_valid; // @[lapar_top.scala 228:32]
  assign Upcie_platform_dma1_write_da = Ulapar_ip_m01_wr_ddr_da; // @[lapar_top.scala 228:32]
  assign Upcie_platform_dma1_write_da_msb = Ulapar_ip_m01_wr_ddr_da_msb; // @[lapar_top.scala 228:32]
  assign Upcie_platform_dma1_write_len = Ulapar_ip_m01_wr_ddr_len; // @[lapar_top.scala 228:32]
  assign Upcie_platform_dma1_write_tdata = Ulapar_ip_m01_wr_ddr_tdata; // @[lapar_top.scala 228:32]
  assign Upcie_platform_dma1_write_tkeep = Ulapar_ip_m01_wr_ddr_tkeep; // @[lapar_top.scala 228:32]
  assign Upcie_platform_dma1_write_tlast = Ulapar_ip_m01_wr_ddr_tlast; // @[lapar_top.scala 228:32]
  assign Upcie_platform_dma1_write_tvalid = Ulapar_ip_m01_wr_ddr_tvalid; // @[lapar_top.scala 228:32]
  assign Upcie_platform_dma0_read_valid = Ulapar_ip_m00_rd_ddr_valid; // @[lapar_top.scala 223:31]
  assign Upcie_platform_dma0_read_sa = Ulapar_ip_m00_rd_ddr_sa; // @[lapar_top.scala 223:31]
  assign Upcie_platform_dma0_read_sa_msb = Ulapar_ip_m00_rd_ddr_sa_msb; // @[lapar_top.scala 223:31]
  assign Upcie_platform_dma0_read_len = Ulapar_ip_m00_rd_ddr_len; // @[lapar_top.scala 223:31]
  assign Upcie_platform_dma0_read_tready = Ulapar_ip_m00_rd_ddr_tready; // @[lapar_top.scala 223:31]
  assign Upcie_platform_dma1_read_valid = Ulapar_ip_m01_rd_ddr_valid; // @[lapar_top.scala 224:31]
  assign Upcie_platform_dma1_read_sa = Ulapar_ip_m01_rd_ddr_sa; // @[lapar_top.scala 224:31]
  assign Upcie_platform_dma1_read_sa_msb = Ulapar_ip_m01_rd_ddr_sa_msb; // @[lapar_top.scala 224:31]
  assign Upcie_platform_dma1_read_len = Ulapar_ip_m01_rd_ddr_len; // @[lapar_top.scala 224:31]
  assign Upcie_platform_dma1_read_tready = Ulapar_ip_m01_rd_ddr_tready; // @[lapar_top.scala 224:31]
  assign Upcie_platform_dma2_read_valid = Ulapar_ip_m02_rd_ddr_valid; // @[lapar_top.scala 225:31]
  assign Upcie_platform_dma2_read_sa = Ulapar_ip_m02_rd_ddr_sa; // @[lapar_top.scala 225:31]
  assign Upcie_platform_dma2_read_sa_msb = Ulapar_ip_m02_rd_ddr_sa_msb; // @[lapar_top.scala 225:31]
  assign Upcie_platform_dma2_read_len = Ulapar_ip_m02_rd_ddr_len; // @[lapar_top.scala 225:31]
  assign Upcie_platform_dma2_read_tready = Ulapar_ip_m02_rd_ddr_tready; // @[lapar_top.scala 225:31]
  assign Upcie_platform_dma3_read_valid = Ulapar_ip_m03_rd_ddr_valid; // @[lapar_top.scala 226:31]
  assign Upcie_platform_dma3_read_sa = Ulapar_ip_m03_rd_ddr_sa; // @[lapar_top.scala 226:31]
  assign Upcie_platform_dma3_read_sa_msb = Ulapar_ip_m03_rd_ddr_sa_msb; // @[lapar_top.scala 226:31]
  assign Upcie_platform_dma3_read_len = Ulapar_ip_m03_rd_ddr_len; // @[lapar_top.scala 226:31]
  assign Upcie_platform_dma3_read_tready = Ulapar_ip_m03_rd_ddr_tready; // @[lapar_top.scala 226:31]
  assign UIR_For_DLA_regs_axi_aclk = Upcie_platform_clk_1x; // @[lapar_top.scala 209:33]
  assign UIR_For_DLA_regs_axi_aresetn = ~Upcie_platform_peripheral_reset; // @[lapar_top.scala 208:36]
  assign UIR_For_DLA_regs_s_axi_araddr = Upcie_platform_m_axil_araddr; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_arprot = Upcie_platform_m_axil_arprot; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_arvalid = Upcie_platform_m_axil_arvalid; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_awaddr = Upcie_platform_m_axil_awaddr; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_awprot = Upcie_platform_m_axil_awprot; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_awvalid = Upcie_platform_m_axil_awvalid; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_bready = Upcie_platform_m_axil_bready; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_rready = Upcie_platform_m_axil_rready; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_wdata = Upcie_platform_m_axil_wdata; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_wstrb = Upcie_platform_m_axil_wstrb; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_s_axi_wvalid = Upcie_platform_m_axil_wvalid; // @[lapar_top.scala 222:31]
  assign UIR_For_DLA_regs_status_reg_rd_fm_cin_cnt = Ulapar_ip_status_reg_rd_fm_cin_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_fm_dout_cnt = Ulapar_ip_status_reg_rd_fm_dout_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_sum_param_din_cnt = Ulapar_ip_status_reg_rd_sum_param_din_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_sum_param_param_cnt = Ulapar_ip_status_reg_rd_sum_param_param_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_sum_param_sum_cnt = Ulapar_ip_status_reg_rd_sum_param_sum_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_conv_relu_in_cnt = Ulapar_ip_status_reg_conv_relu_in_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_conv_relu_out_cnt = Ulapar_ip_status_reg_conv_relu_out_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_relu_valid_cnt = Ulapar_ip_status_reg_relu_valid_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_layer_out_valid_cnt = Ulapar_ip_status_reg_layer_out_valid_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_wr_conv_relu_din_cnt = Ulapar_ip_status_reg_wr_conv_relu_din_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_wr_conv_relu_dout_cnt = Ulapar_ip_status_reg_wr_conv_relu_dout_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_fm_tstvec = Ulapar_ip_status_reg_rd_fm_tstvec; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_sum_param_tstvec = Ulapar_ip_status_reg_rd_sum_param_tstvec; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_wr_conv_relu_tstvec = Ulapar_ip_status_reg_wr_conv_relu_tstvec; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_kernel_part0_tstvec = Ulapar_ip_status_reg_kernel_part0_tstvec; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_kernel_part1_tstvec = Ulapar_ip_status_reg_kernel_part1_tstvec; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_kernel_part0_status = Ulapar_ip_status_reg_kernel_part0_status; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_kernel_part1_status = Ulapar_ip_status_reg_kernel_part1_status; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_kernel_part0_run_time = Ulapar_ip_status_reg_kernel_part0_run_time; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_kernel_part1_run_time = Ulapar_ip_status_reg_kernel_part1_run_time; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_d2s_part1_cnt = Ulapar_ip_status_reg_rd_d2s_part1_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_d2s_part2_cnt = Ulapar_ip_status_reg_rd_d2s_part2_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_d2s_part3_cnt = Ulapar_ip_status_reg_rd_d2s_part3_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_d2s_part4_cnt = Ulapar_ip_status_reg_rd_d2s_part4_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_upsample_din_cnt = Ulapar_ip_status_reg_rd_upsample_din_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_upsample_dout_cnt = Ulapar_ip_status_reg_rd_upsample_dout_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_wr_einsum_din_cnt = Ulapar_ip_status_reg_wr_einsum_din_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_wr_einsum_dout_cnt = Ulapar_ip_status_reg_wr_einsum_dout_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_einsum_in_cnt = Ulapar_ip_status_reg_einsum_in_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_einsum_out_cnt = Ulapar_ip_status_reg_einsum_out_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_conv_5x5_in_cnt = Ulapar_ip_status_reg_conv_5x5_in_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_conv_5x5_out_cnt = Ulapar_ip_status_reg_conv_5x5_out_cnt; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_d2s_tstvec = Ulapar_ip_status_reg_rd_d2s_tstvec; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_rd_upsample_tstvec = Ulapar_ip_status_reg_rd_upsample_tstvec; // @[lapar_top.scala 219:31]
  assign UIR_For_DLA_regs_status_reg_wr_einsum_tstvec = Ulapar_ip_status_reg_wr_einsum_tstvec; // @[lapar_top.scala 219:31]
  assign Ulapar_ip_clk_x2 = Upcie_platform_clk_2x; // @[lapar_top.scala 211:29]
  assign Ulapar_ip_m_axi_aclk = Upcie_platform_clk_1x; // @[lapar_top.scala 212:29]
  assign Ulapar_ip_m_axi_aresetn = ~Upcie_platform_peripheral_reset; // @[lapar_top.scala 213:40]
  assign Ulapar_ip_cfg_reg_loop_time_strobe = UIR_For_DLA_regs_cfg_reg_loop_time_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_loop_time_value = UIR_For_DLA_regs_cfg_reg_loop_time_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cin_size_strobe = UIR_For_DLA_regs_cfg_reg_cin_size_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cin_size_value = UIR_For_DLA_regs_cfg_reg_cin_size_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cout_size_strobe = UIR_For_DLA_regs_cfg_reg_cout_size_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cout_size_value = UIR_For_DLA_regs_cfg_reg_cout_size_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_kernel_part0_start_strobe = UIR_For_DLA_regs_cfg_reg_kernel_part0_start_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_kernel_part0_start_value = UIR_For_DLA_regs_cfg_reg_kernel_part0_start_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_kernel_part1_start_strobe = UIR_For_DLA_regs_cfg_reg_kernel_part1_start_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_kernel_part1_start_value = UIR_For_DLA_regs_cfg_reg_kernel_part1_start_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cin_base_addr_strobe = UIR_For_DLA_regs_cfg_reg_cin_base_addr_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cin_base_addr_value = UIR_For_DLA_regs_cfg_reg_cin_base_addr_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cin_base_addr_msb_strobe = UIR_For_DLA_regs_cfg_reg_cin_base_addr_msb_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cin_base_addr_msb_value = UIR_For_DLA_regs_cfg_reg_cin_base_addr_msb_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cin_rd_len_strobe = UIR_For_DLA_regs_cfg_reg_cin_rd_len_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cin_rd_len_value = UIR_For_DLA_regs_cfg_reg_cin_rd_len_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_base_addr_strobe = UIR_For_DLA_regs_cfg_reg_upsample_base_addr_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_base_addr_value = UIR_For_DLA_regs_cfg_reg_upsample_base_addr_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_base_addr_msb_strobe = UIR_For_DLA_regs_cfg_reg_upsample_base_addr_msb_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_base_addr_msb_value = UIR_For_DLA_regs_cfg_reg_upsample_base_addr_msb_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_rd_len_strobe = UIR_For_DLA_regs_cfg_reg_upsample_rd_len_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_rd_len_value = UIR_For_DLA_regs_cfg_reg_upsample_rd_len_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_loop_time_strobe = UIR_For_DLA_regs_cfg_reg_upsample_loop_time_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_loop_time_value = UIR_For_DLA_regs_cfg_reg_upsample_loop_time_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_cin_size_strobe = UIR_For_DLA_regs_cfg_reg_upsample_cin_size_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_upsample_cin_size_value = UIR_For_DLA_regs_cfg_reg_upsample_cin_size_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_base_addr_strobe = UIR_For_DLA_regs_cfg_reg_d2s_base_addr_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_base_addr_value = UIR_For_DLA_regs_cfg_reg_d2s_base_addr_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_base_addr_msb_strobe = UIR_For_DLA_regs_cfg_reg_d2s_base_addr_msb_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_base_addr_msb_value = UIR_For_DLA_regs_cfg_reg_d2s_base_addr_msb_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_rd_len_strobe = UIR_For_DLA_regs_cfg_reg_d2s_rd_len_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_rd_len_value = UIR_For_DLA_regs_cfg_reg_d2s_rd_len_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_total_rd_len_strobe = UIR_For_DLA_regs_cfg_reg_d2s_total_rd_len_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_total_rd_len_value = UIR_For_DLA_regs_cfg_reg_d2s_total_rd_len_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_single_rd_len_strobe = UIR_For_DLA_regs_cfg_reg_d2s_single_rd_len_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_d2s_single_rd_len_value = UIR_For_DLA_regs_cfg_reg_d2s_single_rd_len_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cout_base_addr_strobe = UIR_For_DLA_regs_cfg_reg_cout_base_addr_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cout_base_addr_value = UIR_For_DLA_regs_cfg_reg_cout_base_addr_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cout_base_addr_msb_strobe = UIR_For_DLA_regs_cfg_reg_cout_base_addr_msb_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cout_base_addr_msb_value = UIR_For_DLA_regs_cfg_reg_cout_base_addr_msb_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cout_wr_len_strobe = UIR_For_DLA_regs_cfg_reg_cout_wr_len_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_cout_wr_len_value = UIR_For_DLA_regs_cfg_reg_cout_wr_len_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_einsum_base_addr_strobe = UIR_For_DLA_regs_cfg_reg_einsum_base_addr_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_einsum_base_addr_value = UIR_For_DLA_regs_cfg_reg_einsum_base_addr_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_einsum_base_addr_msb_strobe = UIR_For_DLA_regs_cfg_reg_einsum_base_addr_msb_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_einsum_base_addr_msb_value = UIR_For_DLA_regs_cfg_reg_einsum_base_addr_msb_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_einsum_wr_len_strobe = UIR_For_DLA_regs_cfg_reg_einsum_wr_len_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_einsum_wr_len_value = UIR_For_DLA_regs_cfg_reg_einsum_wr_len_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_einsum_loop_time_strobe = UIR_For_DLA_regs_cfg_reg_einsum_loop_time_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_einsum_loop_time_value = UIR_For_DLA_regs_cfg_reg_einsum_loop_time_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_param_base_addr_strobe = UIR_For_DLA_regs_cfg_reg_param_base_addr_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_param_base_addr_value = UIR_For_DLA_regs_cfg_reg_param_base_addr_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_param_base_addr_msb_strobe = UIR_For_DLA_regs_cfg_reg_param_base_addr_msb_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_param_base_addr_msb_value = UIR_For_DLA_regs_cfg_reg_param_base_addr_msb_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_param_rd_len_strobe = UIR_For_DLA_regs_cfg_reg_param_rd_len_strobe; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_cfg_reg_param_rd_len_value = UIR_For_DLA_regs_cfg_reg_param_rd_len_value; // @[lapar_top.scala 218:28]
  assign Ulapar_ip_m00_wr_ddr_idle = Upcie_platform_dma0_write_idle; // @[lapar_top.scala 227:32]
  assign Ulapar_ip_m00_wr_ddr_irq = Upcie_platform_dma0_write_irq; // @[lapar_top.scala 227:32]
  assign Ulapar_ip_m00_wr_ddr_tready = Upcie_platform_dma0_write_tready; // @[lapar_top.scala 227:32]
  assign Ulapar_ip_m01_wr_ddr_idle = Upcie_platform_dma1_write_idle; // @[lapar_top.scala 228:32]
  assign Ulapar_ip_m01_wr_ddr_irq = Upcie_platform_dma1_write_irq; // @[lapar_top.scala 228:32]
  assign Ulapar_ip_m01_wr_ddr_tready = Upcie_platform_dma1_write_tready; // @[lapar_top.scala 228:32]
  assign Ulapar_ip_m00_rd_ddr_idle = Upcie_platform_dma0_read_idle; // @[lapar_top.scala 223:31]
  assign Ulapar_ip_m00_rd_ddr_irq = Upcie_platform_dma0_read_irq; // @[lapar_top.scala 223:31]
  assign Ulapar_ip_m00_rd_ddr_tdata = Upcie_platform_dma0_read_tdata; // @[lapar_top.scala 223:31]
  assign Ulapar_ip_m00_rd_ddr_tkeep = Upcie_platform_dma0_read_tkeep; // @[lapar_top.scala 223:31]
  assign Ulapar_ip_m00_rd_ddr_tlast = Upcie_platform_dma0_read_tlast; // @[lapar_top.scala 223:31]
  assign Ulapar_ip_m00_rd_ddr_tvalid = Upcie_platform_dma0_read_tvalid; // @[lapar_top.scala 223:31]
  assign Ulapar_ip_m01_rd_ddr_idle = Upcie_platform_dma1_read_idle; // @[lapar_top.scala 224:31]
  assign Ulapar_ip_m01_rd_ddr_irq = Upcie_platform_dma1_read_irq; // @[lapar_top.scala 224:31]
  assign Ulapar_ip_m01_rd_ddr_tdata = Upcie_platform_dma1_read_tdata; // @[lapar_top.scala 224:31]
  assign Ulapar_ip_m01_rd_ddr_tkeep = Upcie_platform_dma1_read_tkeep; // @[lapar_top.scala 224:31]
  assign Ulapar_ip_m01_rd_ddr_tlast = Upcie_platform_dma1_read_tlast; // @[lapar_top.scala 224:31]
  assign Ulapar_ip_m01_rd_ddr_tvalid = Upcie_platform_dma1_read_tvalid; // @[lapar_top.scala 224:31]
  assign Ulapar_ip_m02_rd_ddr_idle = Upcie_platform_dma2_read_idle; // @[lapar_top.scala 225:31]
  assign Ulapar_ip_m02_rd_ddr_irq = Upcie_platform_dma2_read_irq; // @[lapar_top.scala 225:31]
  assign Ulapar_ip_m02_rd_ddr_tdata = Upcie_platform_dma2_read_tdata; // @[lapar_top.scala 225:31]
  assign Ulapar_ip_m02_rd_ddr_tkeep = Upcie_platform_dma2_read_tkeep; // @[lapar_top.scala 225:31]
  assign Ulapar_ip_m02_rd_ddr_tlast = Upcie_platform_dma2_read_tlast; // @[lapar_top.scala 225:31]
  assign Ulapar_ip_m02_rd_ddr_tvalid = Upcie_platform_dma2_read_tvalid; // @[lapar_top.scala 225:31]
  assign Ulapar_ip_m03_rd_ddr_idle = Upcie_platform_dma3_read_idle; // @[lapar_top.scala 226:31]
  assign Ulapar_ip_m03_rd_ddr_irq = Upcie_platform_dma3_read_irq; // @[lapar_top.scala 226:31]
  assign Ulapar_ip_m03_rd_ddr_tdata = Upcie_platform_dma3_read_tdata; // @[lapar_top.scala 226:31]
  assign Ulapar_ip_m03_rd_ddr_tkeep = Upcie_platform_dma3_read_tkeep; // @[lapar_top.scala 226:31]
  assign Ulapar_ip_m03_rd_ddr_tlast = Upcie_platform_dma3_read_tlast; // @[lapar_top.scala 226:31]
  assign Ulapar_ip_m03_rd_ddr_tvalid = Upcie_platform_dma3_read_tvalid; // @[lapar_top.scala 226:31]
endmodule
