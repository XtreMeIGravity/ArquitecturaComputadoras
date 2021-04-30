// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Tue Nov 10 23:04:35 2020
// Host        : PC-DAVID running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {C:/Arquitectura de Computadoras/Primer
//               Departamental/Practica5/Practica5.sim/sim_1/synth/func/xsim/simAlu_func_synth.v}
// Design      : Alu4Bits
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* N = "4" *) 
(* NotValidForBitStream *)
module Alu4Bits
   (AVec,
    BVec,
    selA,
    selB,
    Cin,
    op,
    ResVec,
    Co,
    C,
    Negative,
    Ov,
    Z);
  input [3:0]AVec;
  input [3:0]BVec;
  input selA;
  input selB;
  input Cin;
  input [1:0]op;
  inout [3:0]ResVec;
  output Co;
  output C;
  output Negative;
  output Ov;
  output Z;

  wire [3:0]AVec;
  wire [3:0]AVec_IBUF;
  wire C;
  wire COutIn_2;
  wire COutIn_3;
  wire C_OBUF;
  wire Cin;
  wire Cin_IBUF;
  wire Co;
  wire Negative;
  wire Ov;
  wire Ov_OBUF;
  wire [3:0]ResVec;
  wire [3:0]ResVec_IBUF;
  wire \ResVec_OBUF[1]_inst_i_2_n_0 ;
  wire Z;
  wire Z_OBUF;
  wire [1:0]op;
  wire [1:0]op_IBUF;
  wire selA;
  wire selA_IBUF;
  wire selB;
  wire selB_IBUF;

  IBUF \AVec_IBUF[0]_inst 
       (.I(AVec[0]),
        .O(AVec_IBUF[0]));
  IBUF \AVec_IBUF[1]_inst 
       (.I(AVec[1]),
        .O(AVec_IBUF[1]));
  IBUF \AVec_IBUF[2]_inst 
       (.I(AVec[2]),
        .O(AVec_IBUF[2]));
  IBUF \AVec_IBUF[3]_inst 
       (.I(AVec[3]),
        .O(AVec_IBUF[3]));
  OBUF C_OBUF_inst
       (.I(C_OBUF),
        .O(C));
  IBUF Cin_IBUF_inst
       (.I(Cin),
        .O(Cin_IBUF));
  OBUF Co_OBUF_inst
       (.I(C_OBUF),
        .O(Co));
  LUT4 #(
    .INIT(16'h74E2)) 
    Co_OBUF_inst_i_1
       (.I0(AVec_IBUF[3]),
        .I1(selB_IBUF),
        .I2(COutIn_3),
        .I3(selA_IBUF),
        .O(C_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h74E2)) 
    Co_OBUF_inst_i_2
       (.I0(AVec_IBUF[2]),
        .I1(selB_IBUF),
        .I2(Cin_IBUF),
        .I3(selA_IBUF),
        .O(COutIn_3));
  OBUF Negative_OBUF_inst
       (.I(ResVec_IBUF[3]),
        .O(Negative));
  LUT6 #(
    .INIT(64'h806E6ED5D56E6E80)) 
    Negative_OBUF_inst_i_1
       (.I0(op_IBUF[1]),
        .I1(op_IBUF[0]),
        .I2(COutIn_3),
        .I3(selA_IBUF),
        .I4(selB_IBUF),
        .I5(AVec_IBUF[3]),
        .O(ResVec_IBUF[3]));
  OBUF Ov_OBUF_inst
       (.I(Ov_OBUF),
        .O(Ov));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    Ov_OBUF_inst_i_1
       (.I0(ResVec_IBUF[2]),
        .I1(ResVec_IBUF[3]),
        .O(Ov_OBUF));
  OBUF \ResVec_OBUF[0]_inst 
       (.I(ResVec_IBUF[0]),
        .O(ResVec[0]));
  LUT6 #(
    .INIT(64'h806E6ED5D56E6E80)) 
    \ResVec_OBUF[0]_inst_i_1 
       (.I0(op_IBUF[1]),
        .I1(op_IBUF[0]),
        .I2(Cin_IBUF),
        .I3(selA_IBUF),
        .I4(selB_IBUF),
        .I5(AVec_IBUF[0]),
        .O(ResVec_IBUF[0]));
  OBUF \ResVec_OBUF[1]_inst 
       (.I(ResVec_IBUF[1]),
        .O(ResVec[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFF02322320)) 
    \ResVec_OBUF[1]_inst_i_1 
       (.I0(op_IBUF[0]),
        .I1(op_IBUF[1]),
        .I2(selA_IBUF),
        .I3(AVec_IBUF[1]),
        .I4(selB_IBUF),
        .I5(\ResVec_OBUF[1]_inst_i_2_n_0 ),
        .O(ResVec_IBUF[1]));
  LUT6 #(
    .INIT(64'h472E000033CC0000)) 
    \ResVec_OBUF[1]_inst_i_2 
       (.I0(AVec_IBUF[0]),
        .I1(selB_IBUF),
        .I2(Cin_IBUF),
        .I3(selA_IBUF),
        .I4(op_IBUF[1]),
        .I5(op_IBUF[0]),
        .O(\ResVec_OBUF[1]_inst_i_2_n_0 ));
  OBUF \ResVec_OBUF[2]_inst 
       (.I(ResVec_IBUF[2]),
        .O(ResVec[2]));
  LUT6 #(
    .INIT(64'h806E6ED5D56E6E80)) 
    \ResVec_OBUF[2]_inst_i_1 
       (.I0(op_IBUF[1]),
        .I1(op_IBUF[0]),
        .I2(COutIn_2),
        .I3(selA_IBUF),
        .I4(selB_IBUF),
        .I5(AVec_IBUF[2]),
        .O(ResVec_IBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h74E2)) 
    \ResVec_OBUF[2]_inst_i_2 
       (.I0(AVec_IBUF[1]),
        .I1(selA_IBUF),
        .I2(Cin_IBUF),
        .I3(selB_IBUF),
        .O(COutIn_2));
  OBUF \ResVec_OBUF[3]_inst 
       (.I(ResVec_IBUF[3]),
        .O(ResVec[3]));
  OBUF Z_OBUF_inst
       (.I(Z_OBUF),
        .O(Z));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h70FF)) 
    Z_OBUF_inst_i_1
       (.I0(ResVec_IBUF[3]),
        .I1(ResVec_IBUF[2]),
        .I2(ResVec_IBUF[1]),
        .I3(ResVec_IBUF[0]),
        .O(Z_OBUF));
  IBUF \op_IBUF[0]_inst 
       (.I(op[0]),
        .O(op_IBUF[0]));
  IBUF \op_IBUF[1]_inst 
       (.I(op[1]),
        .O(op_IBUF[1]));
  IBUF selA_IBUF_inst
       (.I(selA),
        .O(selA_IBUF));
  IBUF selB_IBUF_inst
       (.I(selB),
        .O(selB_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

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

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
