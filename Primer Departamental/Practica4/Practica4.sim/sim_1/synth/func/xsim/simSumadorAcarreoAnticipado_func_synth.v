// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Nov  7 05:36:08 2020
// Host        : PC-DAVID running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {C:/Arquitectura de Computadoras/Primer
//               Departamental/Practica4/Practica4.sim/sim_1/synth/func/xsim/simSumadorAcarreoAnticipado_func_synth.v}
// Design      : SumadorAcarreoAnticipado
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* N = "4" *) 
(* NotValidForBitStream *)
module SumadorAcarreoAnticipado
   (A,
    B,
    S,
    COut);
  input [3:0]A;
  input [3:0]B;
  output [3:0]S;
  output COut;

  wire [3:0]A;
  wire [3:0]A_IBUF;
  wire [3:0]B;
  wire [3:0]B_IBUF;
  wire COut;
  wire COut_OBUF;
  wire [3:0]S;
  wire [3:0]S_OBUF;
  wire p_0_in;
  wire p_1_in;
  wire p_1_in3_in;

  IBUF \A_IBUF[0]_inst 
       (.I(A[0]),
        .O(A_IBUF[0]));
  IBUF \A_IBUF[1]_inst 
       (.I(A[1]),
        .O(A_IBUF[1]));
  IBUF \A_IBUF[2]_inst 
       (.I(A[2]),
        .O(A_IBUF[2]));
  IBUF \A_IBUF[3]_inst 
       (.I(A[3]),
        .O(A_IBUF[3]));
  IBUF \B_IBUF[0]_inst 
       (.I(B[0]),
        .O(B_IBUF[0]));
  IBUF \B_IBUF[1]_inst 
       (.I(B[1]),
        .O(B_IBUF[1]));
  IBUF \B_IBUF[2]_inst 
       (.I(B[2]),
        .O(B_IBUF[2]));
  IBUF \B_IBUF[3]_inst 
       (.I(B[3]),
        .O(B_IBUF[3]));
  OBUF COut_OBUF_inst
       (.I(COut_OBUF),
        .O(COut));
  LUT3 #(
    .INIT(8'hEA)) 
    COut_OBUF_inst_i_1
       (.I0(COut_OBUF),
        .I1(B_IBUF[3]),
        .I2(A_IBUF[3]),
        .O(COut_OBUF));
  OBUF \S_OBUF[0]_inst 
       (.I(S_OBUF[0]),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \S_OBUF[0]_inst_i_1 
       (.I0(B_IBUF[0]),
        .I1(A_IBUF[0]),
        .O(S_OBUF[0]));
  OBUF \S_OBUF[1]_inst 
       (.I(S_OBUF[1]),
        .O(S[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF80707F8)) 
    \S_OBUF[1]_inst_i_1 
       (.I0(A_IBUF[0]),
        .I1(B_IBUF[0]),
        .I2(p_0_in),
        .I3(A_IBUF[1]),
        .I4(B_IBUF[1]),
        .O(S_OBUF[1]));
  LUT3 #(
    .INIT(8'hEA)) 
    \S_OBUF[1]_inst_i_2 
       (.I0(p_0_in),
        .I1(B_IBUF[0]),
        .I2(A_IBUF[0]),
        .O(p_0_in));
  OBUF \S_OBUF[2]_inst 
       (.I(S_OBUF[2]),
        .O(S[2]));
  LUT5 #(
    .INIT(32'hF80707F8)) 
    \S_OBUF[2]_inst_i_1 
       (.I0(A_IBUF[1]),
        .I1(B_IBUF[1]),
        .I2(p_1_in),
        .I3(A_IBUF[2]),
        .I4(B_IBUF[2]),
        .O(S_OBUF[2]));
  LUT3 #(
    .INIT(8'hEA)) 
    \S_OBUF[2]_inst_i_2 
       (.I0(p_1_in),
        .I1(B_IBUF[1]),
        .I2(A_IBUF[1]),
        .O(p_1_in));
  OBUF \S_OBUF[3]_inst 
       (.I(S_OBUF[3]),
        .O(S[3]));
  LUT5 #(
    .INIT(32'hF80707F8)) 
    \S_OBUF[3]_inst_i_1 
       (.I0(A_IBUF[2]),
        .I1(B_IBUF[2]),
        .I2(p_1_in3_in),
        .I3(A_IBUF[3]),
        .I4(B_IBUF[3]),
        .O(S_OBUF[3]));
  LUT3 #(
    .INIT(8'hEA)) 
    \S_OBUF[3]_inst_i_2 
       (.I0(p_1_in3_in),
        .I1(B_IBUF[2]),
        .I2(A_IBUF[2]),
        .O(p_1_in3_in));
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
