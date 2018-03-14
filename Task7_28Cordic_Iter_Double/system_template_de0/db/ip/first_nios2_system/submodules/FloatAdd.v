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
// CREATED		"Mon Mar 12 15:22:22 2018"

module FloatAdd(
	clk,
	clken,
	dataa,
	datab,
	result
);


input wire	clk;
input wire	clken;
input wire	[31:0] dataa;
input wire	[31:0] datab;
output wire	[31:0] result;






altfp_add_sub1	b2v_inst(
	.clock(clk),
	.clk_en(clken),
	.dataa(dataa),
	.datab(datab),
	.result(result));


endmodule
