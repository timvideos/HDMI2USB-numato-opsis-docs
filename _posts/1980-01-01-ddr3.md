---
layout: page
title: "DDR3"
category: Features
---

The DDR3 RAM is `MT41J128M16JT-125:K` connected to MCB3 of the FPGA.

The RAM is compatible with both the Xilinx's MCB generator inside ISE and the DDR core inside misoc.

The limiting factor on the speed of operation is the SERDES functionality in the Spartan 6 FPGA.

 * [Manufacturers Site](https://www.micron.com/~/media/documents/products/data-sheet/dram/ddr3/2gb_ddr3_sdram.pdf)
 * [Datasheet](https://www.micron.com/~/media/documents/products/data-sheet/dram/ddr3/2gb_ddr3_sdram.pdf)

 * [Verilog Model](http://www.micron.com/~/media/documents/products/sim-model/dram/ddr3/ddr3-sdram-verilog-model.zip)

The code D9PSL on the IC can be decoded at http://www.micron.com/support/fbga and should give;
 `MT41J128M16JT-125:K - 16 Meg x 16 x 8 Banks - DDR3-1600 11-11-11`

|                     | Specification        |
| -------------------:| -------------------- |
| Schematic Sheet     | [DDR3.sch](https://github.com/timvideos/HDMI2USB-numato-opsis-hardware/blob/master/board/DDR3.sch) |
| Schematic Reference | U1                   |
| IO Standard         | SSTL15_II, DIFF_SSTL15_II and LVCMOS15 |
| Part                | MT41J128M16          |
| FPGA Connection     | MCB3                 |
| 
| Max Clock Rate      | 800 MHz              |
| Max Data Rate       | DDR3-1600            |

![DDR3 Ram Picture](img/ddr3-ram.jpg)


## Using Xilinx MCB Generator

TBD

## Using MiSoC 

TBD
