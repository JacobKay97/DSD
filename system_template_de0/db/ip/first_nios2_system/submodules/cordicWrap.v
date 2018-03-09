module cordicWrap
(
	clk,
	in,
	out
);

	input	clk;
	input [31:0] in;
	output reg signed [23:0] out;
  reg signed [63:0] internal;
  reg signed [63:0] divisor;
	parameter pi =    64'b01100100100001111110110101010001000;//11.
  parameter twopi = 64'b011001001000011111101101010100010001; //110.
  parameter pibytwo =       64'b0110010010000111111011010101000100; //1.
  parameter threepibytwo = 64'b010010110110010111110001111111001101; //100.
	// IF -0.001 etc. floor goes to -1... ffs


	always @ (posedge clk)
	begin
    if(in[31]) begin
    // cos(-x) = cos(x) so only deal with positive numbers :)
      internal = {((~in)+1'b1),32'b0};
    end
    else
      internal = {in,32'b0};

	divisor = internal/twopi;
	//divisor = divisor >> 32;
	internal = internal - (divisor*twopi);
	
	if(internal <= pi )begin
		internal = pibytwo - internal;
	end
	else
		internal = internal - threepibytwo;

	
	out = internal[34:10];



	end

endmodule