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
// CREATED		"Fri Mar 09 15:54:21 2018"

module Task7(
	clk,
	forcedVCC,
	dataa,
	dataout
);


input wire	clk;
input wire	forcedVCC;
input wire	[31:0] dataa;
output wire	[31:0] dataout;

wire	[23:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[23:0] SYNTHESIZED_WIRE_6;





cordic_dsd	b2v_inst(
	.clk(clk),
	
	.en(forcedVCC),
	
	.z(SYNTHESIZED_WIRE_0),
	
	.sin_out(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst.DATA_WIDTH = 24;


altfp_mult0	b2v_inst1(
	
	.clock(clk),
	.dataa(dataa),
	.datab(dataa),
	.result(SYNTHESIZED_WIRE_4));


altfp_add_sub0	b2v_inst2(
	.add_sub(forcedVCC),
	.clock(clk),
	.dataa(SYNTHESIZED_WIRE_1),
	.datab(SYNTHESIZED_WIRE_2),
	.result(dataout));


cordicWrap	b2v_inst3(
	.clk(clk),
	.in(SYNTHESIZED_WIRE_3),
	.out(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst3.pi = 64'b0000000000000000000000000000001100100100001111110110101010001000;
	defparam	b2v_inst3.pibytwo = 64'b0000000000000000000000000000000110010010000111111011010101000100;
	defparam	b2v_inst3.threepibytwo = 64'b0000000000000000000000000000010010110110010111110001111111001101;
	defparam	b2v_inst3.twopi = 64'b0000000000000000000000000000011001001000011111101101010100010001;


divByn	b2v_inst4(
	.clk(clk),
	.in(dataa),
	.out(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst4.num_div = 1;


altfp_mult0	b2v_inst5(
	
	.clock(clk),
	.dataa(SYNTHESIZED_WIRE_4),
	.datab(SYNTHESIZED_WIRE_5),
	.result(SYNTHESIZED_WIRE_2));


floor	b2v_inst6(
	.clk(clk),
	.in(dataa),
	.out(SYNTHESIZED_WIRE_3));


altfp_convert0	b2v_inst7(
	.clock(clk),
	.dataa(SYNTHESIZED_WIRE_6),
	.result(SYNTHESIZED_WIRE_5));


endmodule
