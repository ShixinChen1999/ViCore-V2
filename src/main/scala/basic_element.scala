import chisel3._
import chisel3.util._
import chisel3.experimental._

class WriterIO(size: Int) extends Bundle {
    val write = Input(Bool ())
    val full = Output(Bool ())
    val din = Input(UInt(size.W))
}

class ReaderIO(size: Int) extends Bundle {
    val read = Input(Bool ())
    val empty = Output(Bool ())
    val dout = Output(UInt(size.W))
}

class FifoRegister(size: Int) extends Module {
    val io = IO(new Bundle {
        val enq = new WriterIO(size)
        val deq = new ReaderIO(size)
    })
    val empty :: full :: Nil = Enum (2)
    val stateReg = RegInit(empty)
    val dataReg = RegInit (0.U(size.W))
    when(stateReg === empty) {
        when(io.enq.write) {
            stateReg := full
            dataReg := io.enq.din
        }
        }. elsewhen (stateReg === full) {
            when(io.deq.read) {
            stateReg := empty
            dataReg := 0.U // just to better see empty slots in the waveform
    }
    }. otherwise {
    // There should not be an otherwise state
    }
    io.enq.full := (stateReg === full)
    io.deq.empty := (stateReg === empty)
    io.deq.dout := dataReg
}


// class BubbleFifo(size: Int , depth: Int) extends Module {
// val io = IO(new Bundle {
// val enq = new WriterIO(size)
// val deq = new ReaderIO(size)
// })
// val buffers = Array.fill(depth) { Module(new
// FifoRegister (size)) }
// for (i <- 0 until depth - 1) {
// buffers(i + 1).io.enq.din   := buffers(i).io.deq.dout
// buffers(i + 1).io.enq.write := ~buffers(i).io.deq.empty
// buffers(i).io.deq.read      := ~buffers(i + 1).io.enq.full
// }
// io.enq <> buffers (0).io.enq
// io.deq <> buffers(depth - 1).io.deq
// }


/**
  * FIFO IO with enqueue and dequeue ports using the ready/valid interface.
  */
class FifoIO[T <: Data](private val gen: T) extends Bundle {
  val enq = Flipped(new DecoupledIO(gen))
  val deq = new DecoupledIO(gen)
}

abstract class Fifo[T <: Data ]( gen: T, depth: Int) extends Module {
    val io = IO(new FifoIO(gen))
    assert(depth > 0, "Number of buffer elements needs to be larger than 0")
}


class BubbleFifo[T <: Data ]( gen: T, depth: Int) extends Fifo(gen: T, depth: Int) {
    private class Buffer() extends Module {
        val io = IO(new FifoIO(gen))
        val fullReg = RegInit(false.B)
        val dataReg = Reg(gen)
        when (fullReg) {
            when (io.deq.ready) {
                fullReg := false.B
            }
        } .otherwise {
            when (io.enq.valid) {
                fullReg := true.B
                dataReg := io.enq.bits
            } 
        }
        io.enq.ready := !fullReg
        io.deq.valid := fullReg
        io.deq.bits := dataReg
    }
    private val buffers = Array.fill(depth) { Module(new
    Buffer ()) }
    for (i <- 0 until depth - 1) {
        buffers(i + 1).io.enq <> buffers(i).io.deq
    }
    io.enq <> buffers (0).io.enq
    io.deq <> buffers(depth - 1).io.deq
}










// object FifoRegister extends App{
//   chisel3.Driver.emitVerilog(new FifoRegister(256))
// }

//object BubbleFifo extends App{
//  chisel3.Driver.emitVerilog(new BubbleFifo(UInt(8.W),256))
//}

