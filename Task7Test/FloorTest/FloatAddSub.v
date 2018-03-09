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
// CREATED		"Thu Feb 22 16:01:23 2018"

module FloatAddSub(
	clock,
	add_sub,
	dataa,
	datab,
	results
);


input wire	clock;
input wire	add_sub;
input wire	[31:0] dataa;
input wire	[31:0] datab;
output wire	[31:0] results;






altfp_add_sub0	b2v_inst(
	.add_sub(add_sub),
	.clock(clock),
	.dataa(dataa),
	.datab(datab),
	.result(results));


endmodule
