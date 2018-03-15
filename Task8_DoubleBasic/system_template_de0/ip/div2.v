module divby
(
	clk,
	in,
	out
);

	input	clk;
	input [31:0] in;
	output reg signed [31:0] out;
	
	reg signed [8:0] exp;
	parameter num_shift = 1;
	
	
	always @ (posedge clk) 
	begin
		exp[8:0] = {1'b0, in[30:23]};
		out[31:0] =  {in[31], 8'b0, in[22:0]};
		if(exp < num_shift)
			out = 32'b0;
		else begin
			exp = exp - num_shift;
			out[30:23] = exp[7:0];
		end

	end
	
endmodule
