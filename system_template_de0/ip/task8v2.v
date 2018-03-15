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
// CREATED		"Thu Mar 15 22:24:34 2018"

module task8v2(
	clk,
	clk_en,
	dataa,
	datab,
	n,
	done,
	dataout
);


input wire	clk;
input wire	clk_en;
input wire	[31:0] dataa;
input wire	[31:0] datab;
input wire	[7:0] n;
output wire	done;
output wire	[31:0] dataout;

wire	add1;
wire	add2;
wire	cordic;
wire	mult1;
wire	mult2;
wire	resetAcc;
wire	[27:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[27:0] SYNTHESIZED_WIRE_15;

assign	dataout = SYNTHESIZED_WIRE_5;




cordic_dsd_multirate	b2v_inst(
	.clk(clk),
	.rst(cordic),
	.z(SYNTHESIZED_WIRE_0),
	.sin_out(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst.DATA_WIDTH = 28;


altfp_mult0	b2v_inst1(
	.clk_en(mult1),
	.clock(clk),
	.dataa(SYNTHESIZED_WIRE_16),
	.datab(SYNTHESIZED_WIRE_16),
	.result(SYNTHESIZED_WIRE_10));


Mux2to1	b2v_inst10(
	.clk(clk),
	.sel(SYNTHESIZED_WIRE_3),
	.in0(dataa),
	.in1(datab),
	.out(SYNTHESIZED_WIRE_9));


altfp_add_sub0	b2v_inst11(
	.clock(clk),
	.clk_en(add2),
	.aclr(resetAcc),
	.dataa(SYNTHESIZED_WIRE_4),
	.datab(SYNTHESIZED_WIRE_5),
	.result(SYNTHESIZED_WIRE_5));


Task_8_timerv2	b2v_inst14(
	.clk(clk),
	.clk_en(clk_en),
	.n(n),
	.multi_1_en(mult1),
	.multi_2_en(mult2),
	.cordic_rs(cordic),
	.adder_1_en(add1),
	.adder_2_en(add2),
	.mlpx_1(SYNTHESIZED_WIRE_3),
	.mlpx_2(SYNTHESIZED_WIRE_13),
	.mlpx_3(SYNTHESIZED_WIRE_14),
	.resetAcc(resetAcc),
	.done(done));


altfp_add_sub0	b2v_inst2(
	.clock(clk),
	.clk_en(add1),
	
	.dataa(SYNTHESIZED_WIRE_6),
	.datab(SYNTHESIZED_WIRE_7),
	.result(SYNTHESIZED_WIRE_4));


cordicWrap	b2v_inst3(
	.clk(clk),
	.in(SYNTHESIZED_WIRE_8),
	.out(SYNTHESIZED_WIRE_0));


divByn	b2v_inst4(
	.clk(clk),
	.in(SYNTHESIZED_WIRE_9),
	.out(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst4.num_div = 1;


altfp_mult0	b2v_inst5(
	.clk_en(mult2),
	.clock(clk),
	.dataa(SYNTHESIZED_WIRE_10),
	.datab(SYNTHESIZED_WIRE_11),
	.result(SYNTHESIZED_WIRE_7));


floor	b2v_inst6(
	.clk(clk),
	.in(SYNTHESIZED_WIRE_12),
	.out(SYNTHESIZED_WIRE_8));


Mux2to1	b2v_inst7(
	.clk(clk),
	.sel(SYNTHESIZED_WIRE_13),
	.in0(dataa),
	.in1(datab),
	.out(SYNTHESIZED_WIRE_16));


Mux2to1	b2v_inst8(
	.clk(clk),
	.sel(SYNTHESIZED_WIRE_14),
	.in0(dataa),
	.in1(datab),
	.out(SYNTHESIZED_WIRE_12));


fixedtofloat	b2v_inst9(
	.clk(clk),
	
	.fixedin(SYNTHESIZED_WIRE_15),
	.floatout(SYNTHESIZED_WIRE_11));


endmodule
