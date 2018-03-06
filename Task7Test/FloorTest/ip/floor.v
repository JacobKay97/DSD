module floor
(
	clk,
	in,
	out
);

	input	clk;
	input [31:0] in;
	output reg signed [31:0] out;
	
	reg signed [8:0] exp;
	reg sign;
	
	always @ (posedge clk) 
	begin
		sign = in[31];
		exp[8:0] = {1'b0, in[30:23]} - 9'd129;
		out[31:0] =  {8'b0 ,1'b1, in[22:0]};
		if(exp < 9'd0)
			if(sign) begin
				out = -32'd33;
			end
			else
				out = -32'd32;
		else begin	
			if(exp < 9'd23) begin				
			out = out >> (9'd23 - exp);
			end
			else begin
			out = out << exp;
			end
			if(sign) begin
				out = ~out - 32'd32;
			end
			else
				out = out - 32'd32;
		end
		

	end
	
endmodule