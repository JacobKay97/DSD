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
// CREATED		"Thu Mar 15 18:04:22 2018"

module task8v3(
	clk,
	clk_en,
	dataa,
	datab,
	done,
	dataout
);


input wire	clk;
input wire	clk_en;
input wire	[31:0] dataa;
input wire	[31:0] datab;
output wire	done;
output wire	[31:0] dataout;

wire	add1;
wire	add2;
wire	cordic;
wire	cordicDone;
wire	found;
wire	look;
wire	mult1;
wire	mult2;
wire	resetAcc;
wire	[27:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[27:0] SYNTHESIZED_WIRE_11;





cordic_dsd_multirate	b2v_inst(
	.clk(clk),
	.rst(cordic),
	.z(SYNTHESIZED_WIRE_0),
	.sin_out(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst.DATA_WIDTH = 28;


altfp_mult0	b2v_inst1(
	.clk_en(mult1),
	.clock(clk),
	.dataa(dataa),
	.datab(dataa),
	.result(SYNTHESIZED_WIRE_9));


altfp_add_sub0	b2v_inst11(
	.clock(clk),
	.clk_en(add2),
	.aclr(resetAcc),
	.dataa(SYNTHESIZED_WIRE_1),
	.datab(datab),
	.result(dataout));


CordicSkip	b2v_inst13(
	.clk(clk),
	
	.cordicDone(cordicDone),
	.look(look),
	.floatIn(SYNTHESIZED_WIRE_12),
	.floorIn(SYNTHESIZED_WIRE_13),
	.found(found),
	.floatOut(SYNTHESIZED_WIRE_5));


Mux2to1	b2v_inst15(
	.clk(clk),
	.sel(found),
	.in0(SYNTHESIZED_WIRE_12),
	.in1(SYNTHESIZED_WIRE_5),
	.out(SYNTHESIZED_WIRE_10));


Task_8_timerv3	b2v_inst16(
	.clk(clk),
	.clk_en(clk_en),
	.found(found),
	.multi_1_en(mult1),
	.multi_2_en(mult2),
	.cordic_rs(cordic),
	.adder_1_en(add1),
	.adder_2_en(add2),
	.cordicDone(cordicDone),
	.look(look),
	.done(done));


altfp_add_sub0	b2v_inst2(
	.clock(clk),
	.clk_en(add1),
	
	.dataa(SYNTHESIZED_WIRE_6),
	.datab(SYNTHESIZED_WIRE_7),
	.result(SYNTHESIZED_WIRE_1));


cordicWrap	b2v_inst3(
	.clk(clk),
	.in(SYNTHESIZED_WIRE_13),
	.out(SYNTHESIZED_WIRE_0));


divByn	b2v_inst4(
	.clk(clk),
	.in(dataa),
	.out(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst4.num_div = 1;


altfp_mult0	b2v_inst5(
	.clk_en(mult2),
	.clock(clk),
	.dataa(SYNTHESIZED_WIRE_9),
	.datab(SYNTHESIZED_WIRE_10),
	.result(SYNTHESIZED_WIRE_7));


floor	b2v_inst6(
	.clk(clk),
	.in(dataa),
	.out(SYNTHESIZED_WIRE_13));


fixedtofloat	b2v_inst9(
	.clk(clk),
	
	.fixedin(SYNTHESIZED_WIRE_11),
	.floatout(SYNTHESIZED_WIRE_12));


endmodule
