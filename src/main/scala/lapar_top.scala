import chisel3._
import chisel3.core.Analog
import chisel3.util._
import chisel3.core.Module.{clock, reset}
import chisel3.experimental._

import javax.swing.plaf.metal.MetalTreeUI
import java.util.ResourceBundle
import scala.collection.immutable.RedBlackTree

import lapar_package._



class RegIO extends Bundle with nConfig{
    val reg_loop_time = new CfgIO
    val reg_cin_size = new CfgIO
    val reg_cout_size = new CfgIO
    val reg_kernel_part0_start = new CfgIO
    val reg_kernel_part1_start = new CfgIO
    val reg_cin_base_addr = new CfgIO
    val reg_cin_base_addr_msb = new CfgIO
    val reg_cin_rd_len = new CfgIO
    val reg_upsample_base_addr = new CfgIO
    val reg_upsample_base_addr_msb = new CfgIO
    val reg_upsample_rd_len = new CfgIO
    val reg_upsample_loop_time = new CfgIO
    val reg_upsample_cin_size = new CfgIO
    val reg_d2s_base_addr = new CfgIO
    val reg_d2s_base_addr_msb = new CfgIO
    val reg_d2s_rd_len = new CfgIO
    val reg_d2s_total_rd_len = new CfgIO
    val reg_d2s_single_rd_len = new CfgIO
    val reg_cout_base_addr = new CfgIO
    val reg_cout_base_addr_msb = new CfgIO
    val reg_cout_wr_len = new CfgIO
    val reg_einsum_base_addr = new CfgIO
    val reg_einsum_base_addr_msb = new CfgIO
    val reg_einsum_wr_len = new CfgIO
    val reg_einsum_loop_time = new CfgIO
    val reg_param_base_addr = new CfgIO
    val reg_param_base_addr_msb = new CfgIO
    val reg_param_rd_len = new CfgIO
}

class StatusIO extends Bundle with nConfig {
    val reg_rd_fm_cin_cnt               =Input(UInt(32.W))
    val reg_rd_fm_dout_cnt              =Input(UInt(32.W))
    val reg_rd_sum_param_din_cnt        =Input(UInt(32.W))
    val reg_rd_sum_param_param_cnt      =Input(UInt(32.W))
    val reg_rd_sum_param_sum_cnt        =Input(UInt(32.W))
    val reg_conv_relu_in_cnt            =Input(UInt(32.W))
    val reg_conv_relu_out_cnt           =Input(UInt(32.W))
    val reg_relu_valid_cnt              =Input(UInt(32.W))
    val reg_layer_out_valid_cnt         =Input(UInt(32.W))
    val reg_wr_conv_relu_din_cnt        =Input(UInt(32.W))
    val reg_wr_conv_relu_dout_cnt       =Input(UInt(32.W))
    val reg_rd_fm_tstvec                =Input(UInt(32.W))
    val reg_rd_sum_param_tstvec         =Input(UInt(32.W))
    val reg_wr_conv_relu_tstvec         =Input(UInt(32.W))
    val reg_kernel_part0_tstvec         =Input(UInt(32.W))
    val reg_kernel_part1_tstvec         =Input(UInt(32.W))
    val reg_kernel_part0_status         =Input(UInt(32.W))
    val reg_kernel_part1_status         =Input(UInt(32.W))
    val reg_kernel_part0_run_time       =Input(UInt(32.W))
    val reg_kernel_part1_run_time       =Input(UInt(32.W))
    val reg_rd_d2s_part1_cnt            =Input(UInt(32.W))
    val reg_rd_d2s_part2_cnt            =Input(UInt(32.W))
    val reg_rd_d2s_part3_cnt            =Input(UInt(32.W))
    val reg_rd_d2s_part4_cnt            =Input(UInt(32.W))
    val reg_rd_upsample_din_cnt         =Input(UInt(32.W))
    val reg_rd_upsample_dout_cnt        =Input(UInt(32.W))
    val reg_wr_einsum_din_cnt           =Input(UInt(32.W))
    val reg_wr_einsum_dout_cnt          =Input(UInt(32.W))
    val reg_einsum_in_cnt               =Input(UInt(32.W))
    val reg_einsum_out_cnt              =Input(UInt(32.W))
    val reg_conv_5x5_in_cnt             =Input(UInt(32.W))
    val reg_conv_5x5_out_cnt            =Input(UInt(32.W))
    val reg_rd_d2s_tstvec               =Input(UInt(32.W))
    val reg_rd_upsample_tstvec          =Input(UInt(32.W))
    val reg_wr_einsum_tstvec            =Input(UInt(32.W))
}

class IR_For_DLA_regs extends BlackBox(Map(
  "AXI_ADDR_WIDTH" -> 32,
  "BASEADDR"       -> 0 ))
{
    val io=IO(new Bundle{
        val axi_aclk = Input(Clock())
        val axi_aresetn = Input(Bool())
        val s_axi = Flipped(new AxiCtrlIO)
        val cfg = new RegIO
        val status = new StatusIO
    })
}


class lapar_ip extends BlackBox(Map(
  "CH_IN        " -> 32 ,
  "CH_OUT       " -> 32 ,
  "BIAS_W       " -> 16 ,
  "CIN_W        " -> 16 ,
  "CORE_NUM     " -> 1  ,
  "AXI_ADDR_W   " -> 64 ,
  "AXI_DATA_W   " -> 512,
  "S_AXIL_ADDR_W" -> 32 ,
  "S_AXIL_DATA_W" -> 32 ,
  "IM_WIDTH     " -> 640,
  "IM_HEIGHT    " -> 360)
) {
    val io=IO(new Bundle{
        val clk_x2 = Input(Clock())
        val m_axi_aclk = Input(Clock())
        val m_axi_aresetn = Input(Bool())
        val kernel_part0_interrupt = Output(Bool())
        val kernel_part1_interrupt = Output(Bool())
        val cfg = Flipped(new RegIO)
        val status = Flipped(new StatusIO)
        val m00_wr_ddr = Flipped(new DmaWriteIO_2)
        val m01_wr_ddr = Flipped(new DmaWriteIO_2)
        val m00_rd_ddr = Flipped(new DmaReadIO_2)
        val m01_rd_ddr = Flipped(new DmaReadIO_2)
        val m02_rd_ddr = Flipped(new DmaReadIO_2)
        val m03_rd_ddr = Flipped(new DmaReadIO_2)
    })

}

class design_1_wrapper extends BlackBox{
  val io=IO(new Bundle{
    val clk_1x                      =Output(Clock())
    val clk_2x                      =Output(Clock())
    val default_300mhz_clk0_clk_n   =Input (Clock())        
    val default_300mhz_clk0_clk_p   =Input (Clock())        
    val default_300mhz_clk1_clk_n   =Input (Clock())        
    val default_300mhz_clk1_clk_p   =Input (Clock())        
    val pcie_refclk_clk_n           =Input (Clock())        
    val pcie_refclk_clk_p           =Input (Clock())        
    val pci_express_x16_rxn         =Input (UInt(16.W)) 
    val pci_express_x16_rxp         =Input (UInt(16.W)) 
    val pci_express_x16_txn         =Output(UInt(16.W)) 
    val pci_express_x16_txp         =Output(UInt(16.W)) 
    val resetn                      =Input (Bool())        
    val pcie_perstn                 =Input (Bool())
    val peripheral_reset            =Output(Bool())  
    val usr_irq_ack                 =Output(UInt(2.W)) 
    val usr_irq_req                 =Input (UInt(2.W))  
    val c0_ddr4 = new DDRIO
    val c0_ddr4_ctrl = new DDRAxiCtrlIO
    val c1_ddr4 = new DDRIO
    val c1_ddr4_ctrl = new DDRAxiCtrlIO
    val m_axil    = new AxiCtrlIO
    val dma0_write = new DmaWriteIO_2
    val dma1_write = new DmaWriteIO_2
    val dma0_read = new DmaReadIO_2
    val dma1_read = new DmaReadIO_2
    val dma2_read = new DmaReadIO_2
    val dma3_read = new DmaReadIO_2
  })
}



class lapar_top (width : Int = 4) extends RawModule with nConfig {
  val io=IO(new Bundle{
//    val rd_fm= new RdFmCtrlIO
    val c0_ddr4_clk_n        = Input(Clock())
    val c0_ddr4_clk_p        = Input(Clock())
    val c1_ddr4_clk_n        = Input(Clock())
    val c1_ddr4_clk_p        = Input(Clock())
    val pcie_refclk_clk_n    = Input(Clock())
    val pcie_refclk_clk_p    = Input(Clock())
    val pcie_express_x16_rxn = Input(UInt(16.W))
    val pcie_express_x16_rxp = Input(UInt(16.W))
    val pcie_express_x16_txn = Output(UInt(16.W))
    val pcie_express_x16_txp = Output(UInt(16.W))
    val pcie_perstn          = Input(Bool())
    val resetn               = Input(Bool())
    val c0_ddr4= new DDRIO
    val c1_ddr4= new DDRIO
  })

  val Upcie_platform=Module(new design_1_wrapper)
  val UIR_For_DLA_regs=Module(new IR_For_DLA_regs)
  val Ulapar_ip=Module(new lapar_ip)


  Upcie_platform.io.c0_ddr4_ctrl.awvalid := false.B
  Upcie_platform.io.c0_ddr4_ctrl.awaddr := 0.U
  Upcie_platform.io.c0_ddr4_ctrl.wvalid := false.B
  Upcie_platform.io.c0_ddr4_ctrl.wdata := 0.U
  Upcie_platform.io.c0_ddr4_ctrl.wvalid := true.B
  Upcie_platform.io.c0_ddr4_ctrl.arvalid := false.B
  Upcie_platform.io.c0_ddr4_ctrl.araddr := 0.U
  Upcie_platform.io.c0_ddr4_ctrl.rready := true.B
  Upcie_platform.io.c1_ddr4_ctrl.awvalid := false.B
  Upcie_platform.io.c1_ddr4_ctrl.awaddr := 0.U
  Upcie_platform.io.c1_ddr4_ctrl.wvalid := false.B
  Upcie_platform.io.c1_ddr4_ctrl.wdata := 0.U
  Upcie_platform.io.c1_ddr4_ctrl.wvalid := true.B
  Upcie_platform.io.c1_ddr4_ctrl.arvalid := false.B
  Upcie_platform.io.c1_ddr4_ctrl.araddr := 0.U
  Upcie_platform.io.c1_ddr4_ctrl.rready := true.B

  io.c0_ddr4        <> Upcie_platform.io.c0_ddr4
  io.c1_ddr4        <> Upcie_platform.io.c1_ddr4

  UIR_For_DLA_regs.io.axi_aresetn  <> ~Upcie_platform.io.peripheral_reset
  UIR_For_DLA_regs.io.axi_aclk  <> Upcie_platform.io.clk_1x

  Upcie_platform.io.clk_2x  <> Ulapar_ip.io.clk_x2
  Upcie_platform.io.clk_1x  <> Ulapar_ip.io.m_axi_aclk
  ~Upcie_platform.io.peripheral_reset  <> Ulapar_ip.io.m_axi_aresetn
  Upcie_platform.io.usr_irq_req  <> Cat(Ulapar_ip.io.kernel_part1_interrupt,Ulapar_ip.io.kernel_part0_interrupt)



  UIR_For_DLA_regs.io.cfg  <> Ulapar_ip.io.cfg
  UIR_For_DLA_regs.io.status  <> Ulapar_ip.io.status


  Upcie_platform.io.m_axil    <> UIR_For_DLA_regs.io.s_axi
  Upcie_platform.io.dma0_read <> Ulapar_ip.io.m00_rd_ddr
  Upcie_platform.io.dma1_read <> Ulapar_ip.io.m01_rd_ddr
  Upcie_platform.io.dma2_read <> Ulapar_ip.io.m02_rd_ddr
  Upcie_platform.io.dma3_read <> Ulapar_ip.io.m03_rd_ddr
  Upcie_platform.io.dma0_write <> Ulapar_ip.io.m00_wr_ddr
  Upcie_platform.io.dma1_write <> Ulapar_ip.io.m01_wr_ddr

  Upcie_platform.io.default_300mhz_clk0_clk_n <> io.c0_ddr4_clk_n     
  Upcie_platform.io.default_300mhz_clk0_clk_p <> io.c0_ddr4_clk_p     
  Upcie_platform.io.default_300mhz_clk1_clk_n <> io.c1_ddr4_clk_n     
  Upcie_platform.io.default_300mhz_clk1_clk_p <> io.c1_ddr4_clk_p     
  Upcie_platform.io.pcie_refclk_clk_n         <> io.pcie_refclk_clk_n 
  Upcie_platform.io.pcie_refclk_clk_p         <> io.pcie_refclk_clk_p 

  io.pcie_express_x16_rxn <> Upcie_platform.io.pci_express_x16_rxn
  io.pcie_express_x16_rxp <> Upcie_platform.io.pci_express_x16_rxp
  io.pcie_express_x16_txn <> Upcie_platform.io.pci_express_x16_txn
  io.pcie_express_x16_txp <> Upcie_platform.io.pci_express_x16_txp
  io.pcie_perstn         <> Upcie_platform.io.pcie_perstn
  io.resetn               <> Upcie_platform.io.resetn             
}

object lapar_top extends App{

  chisel3.Driver.emitVerilog(new lapar_top())

}
