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
			if(exp <= 9'd23) begin				
			out = out >> (9'd23 - exp);
			end
			else begin
			out = out << (exp-9'd23);
			end
			if(sign) begin
				out = ~out - 32'd32;
			end
			else
				out = out - 32'd32;
		end
		if(out[31])
			out = (~out)+1'b1;

	end

	
	
	
				
	
/*
 //Attempt ...
 	input	clk;
	input [31:0] in;
	output reg [31:0] out;
	
	reg signed [8:0] exp;
	reg sign;
	
	always @ (posedge clk) 
	begin
		sign <= in[31];
		exp[8:0] <= {1'b0, in[30:23]} - 9'd129;
		if(exp < 9'd0) begin
			if(sign) begin
				out <= -32'd33;
			end
			else
				out <= -32'd32;
		end
		else if(exp < 9'd23) begin				
			if(sign)
				out <= ~(({8'b0 ,1'b1, in[22:0]}) >> (9'd23 - exp)) - 32'd32;
			else
				out <= (({8'b0 ,1'b1, in[22:0]}) >> (9'd23 - exp)) - 32'd32;
		end		
		else begin
			if(sign)
				out <= ~(({8'b0 ,1'b1, in[22:0]}) << exp) - 32'd32;
			else
				out <= (({8'b0 ,1'b1, in[22:0]}) << exp) - 32'd32;
		end
	end

always @ (posedge clk) 
	begin
		sign = in[31];
		exp[8:0] = {1'b0, in[30:23]} - 9'd129;
		out[31:0] =  {8'b0 ,1'b1, in[22:0]};
		if(exp < 9'd0) begin
			if(sign) begin
				out = -32'd33;
			end
			else
				out = -32'd32;
		end
		else if(exp < 9'd23) begin				
			out = out >> (9'd23 - exp);
			if(sign)
				out = ~out - 32'd32;
			else
				out = out - 32'd32;
		end		
		else begin
			out = out << exp;
			if(sign)
				out = ~out - 32'd32;
			else
				out = out - 32'd32;
		end
	end
	//77.9 slack worst case
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
	
	*/
	
/*
	input	clk;
	input [31:0] in;
	output reg signed [31:0] out = 32'b0;
	
	reg signed [8:0] exp;
	reg sign;
	
	always @ (posedge clk) 
	begin
		exp[8:0] <= {1'b0, in[30:23]} - 9'd129;
		out[31:0] =  {8'b0 ,1'b1, in[22:0]};
		if(exp < 9'd0)
			if(in[31]) begin
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
		if(in[31]) begin
			out = ~out - 32'd32;
		end
		else
			out = out - 32'd32;
		end
	end
	*/
endmodule
