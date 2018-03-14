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
// CREATED		"Mon Mar 12 17:21:38 2018"

module Task7(
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
wire	SYNTHESIZED_WIRE_1;
wire	[27:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[27:0] SYNTHESIZED_WIRE_12;





cordic_dsd	b2v_inst(
	.clk(clk),
	.rst(SYNTHESIZED_WIRE_0),
	.en(SYNTHESIZED_WIRE_1),
	.z(SYNTHESIZED_WIRE_2),
	.sin_out(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst.DATA_WIDTH = 28;


altfp_mult0	b2v_inst1(
	.clk_en(SYNTHESIZED_WIRE_3),
	.clock(clk),
	.dataa(dataa),
	.datab(dataa),
	.result(SYNTHESIZED_WIRE_9));


altfp_add_sub0	b2v_inst2(
	.clock(clk),
	.clk_en(SYNTHESIZED_WIRE_4),
	.dataa(SYNTHESIZED_WIRE_5),
	.datab(SYNTHESIZED_WIRE_6),
	.result(dataout));


cordicWrap	b2v_inst3(
	.clk(clk),
	.in(SYNTHESIZED_WIRE_7),
	.out(SYNTHESIZED_WIRE_2));


divByn	b2v_inst4(
	.clk(clk),
	.in(dataa),
	.out(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst4.num_div = 1;


altfp_mult0	b2v_inst5(
	.clk_en(SYNTHESIZED_WIRE_8),
	.clock(clk),
	.dataa(SYNTHESIZED_WIRE_9),
	.datab(SYNTHESIZED_WIRE_10),
	.result(SYNTHESIZED_WIRE_6));


floor	b2v_inst6(
	.clk(clk),
	.in(dataa),
	.out(SYNTHESIZED_WIRE_7));


altfp_convert0	b2v_inst7(
	.clock(clk),
	.clk_en(SYNTHESIZED_WIRE_11),
	.dataa(SYNTHESIZED_WIRE_12),
	.result(SYNTHESIZED_WIRE_10));


task7Timer	b2v_inst8(
	.clk(clk),
	.clken(clk_en),
	.mult1(SYNTHESIZED_WIRE_3),
	.mult2(SYNTHESIZED_WIRE_8),
	.addsub(SYNTHESIZED_WIRE_4),
	.convert(SYNTHESIZED_WIRE_11),
	.cordicEn(SYNTHESIZED_WIRE_1),
	.cordicRst(SYNTHESIZED_WIRE_0));


endmodule
