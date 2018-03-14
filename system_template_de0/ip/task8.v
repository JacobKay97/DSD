// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
// CREATED		"Wed Mar 14 14:02:26 2018"

module task8(
	clk,
	clk_en,
	dataa,
	dataout
);


input wire	clk;
input wire	clk_en;
input wire	[31:0] dataa;
output wire	[31:0] dataout;

wire	SYNTHESIZED_WIRE_0;
wire	[27:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[27:0] SYNTHESIZED_WIRE_11;





cordic_dsd_multirate	b2v_inst(
	.clk(clk),
	.rst(SYNTHESIZED_WIRE_0),
	.z(SYNTHESIZED_WIRE_1),
	.sin_out(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst.DATA_WIDTH = 28;


altfp_mult0	b2v_inst1(
	.clk_en(SYNTHESIZED_WIRE_2),
	.clock(clk),
	.dataa(dataa),
	.datab(dataa),
	.result(SYNTHESIZED_WIRE_8));


task8Timer	b2v_inst10(
	.clk(clk),
	.clken(clk_en),
	.mult1(SYNTHESIZED_WIRE_2),
	.mult2(SYNTHESIZED_WIRE_7),
	.addsub(SYNTHESIZED_WIRE_3),
	.convert(SYNTHESIZED_WIRE_10),
	.cordicRst(SYNTHESIZED_WIRE_0));


altfp_add_sub0	b2v_inst2(
	.clock(clk),
	.clk_en(SYNTHESIZED_WIRE_3),
	.dataa(SYNTHESIZED_WIRE_4),
	.datab(SYNTHESIZED_WIRE_5),
	.result(dataout));


cordicWrap	b2v_inst3(
	.clk(clk),
	.in(SYNTHESIZED_WIRE_6),
	.out(SYNTHESIZED_WIRE_1));


divByn	b2v_inst4(
	.clk(clk),
	.in(dataa),
	.out(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst4.num_div = 1;


altfp_mult0	b2v_inst5(
	.clk_en(SYNTHESIZED_WIRE_7),
	.clock(clk),
	.dataa(SYNTHESIZED_WIRE_8),
	.datab(SYNTHESIZED_WIRE_9),
	.result(SYNTHESIZED_WIRE_5));


floor	b2v_inst6(
	.clk(clk),
	.in(dataa),
	.out(SYNTHESIZED_WIRE_6));


fixedtofloat	b2v_inst9(
	.clk(clk),
	.clken(SYNTHESIZED_WIRE_10),
	.fixedin(SYNTHESIZED_WIRE_11),
	.floatout(SYNTHESIZED_WIRE_9));


endmodule
