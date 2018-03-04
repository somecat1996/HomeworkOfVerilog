////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.28xd
//  \   \         Application: netgen
//  /   /         Filename: test_synthesis.v
// /___/   /\     Timestamp: Tue Mar 28 14:38:39 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim test.ngc test_synthesis.v 
// Device	: xc3s100e-5-cp132
// Input file	: test.ngc
// Output file	: E:\study\FPGA\test1\netgen\synthesis\test_synthesis.v
// # of Modules	: 1
// Design Name	: test
// Xilinx        : G:\coding\Xilinx\14.2\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module test (
  a, x, y
);
  input a;
  output [6 : 0] x;
  output [3 : 0] y;
  wire N01;
  wire N011;
  wire x_0_OBUF_10;
  wire x_1_11;
  wire x_6_OBUF_12;
  wire y_1_17;
  wire y_1_1_18;
  GND   XST_GND (
    .G(x_6_OBUF_12)
  );
  VCC   XST_VCC (
    .P(x_0_OBUF_10)
  );
  FD   y_1 (
    .C(N01),
    .D(N011),
    .Q(y_1_17)
  );
  IBUF   a_IBUF (
    .I(a),
    .O(N011)
  );
  OBUF   x_6_OBUF (
    .I(x_6_OBUF_12),
    .O(x[6])
  );
  OBUF   x_5_OBUF (
    .I(x_6_OBUF_12),
    .O(x[5])
  );
  OBUF   x_4_OBUF (
    .I(x_6_OBUF_12),
    .O(x[4])
  );
  OBUF   x_3_OBUF (
    .I(x_6_OBUF_12),
    .O(x[3])
  );
  OBUF   x_2_OBUF (
    .I(x_6_OBUF_12),
    .O(x[2])
  );
  OBUF   x_1_OBUF (
    .I(x_1_11),
    .O(x[1])
  );
  OBUF   x_0_OBUF (
    .I(x_0_OBUF_10),
    .O(x[0])
  );
  OBUF   y_3_OBUF (
    .I(x_6_OBUF_12),
    .O(y[3])
  );
  OBUF   y_2_OBUF (
    .I(y_1_1_18),
    .O(y[2])
  );
  OBUF   y_1_OBUF (
    .I(y_1_17),
    .O(y[1])
  );
  OBUF   y_0_OBUF (
    .I(x_0_OBUF_10),
    .O(y[0])
  );
  FDR   x_1 (
    .C(N01),
    .D(x_0_OBUF_10),
    .R(N011),
    .Q(x_1_11)
  );
  BUFG   N01_BUFG (
    .I(N011),
    .O(N01)
  );
  FD   y_1_1 (
    .C(N01),
    .D(N011),
    .Q(y_1_1_18)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

