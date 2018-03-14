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
	localparam pi =    64'b01100100100001111110110101010001000;//11.
	localparam twopi =     64'b011001001000011111101101010100010001; //110.
	localparam oneovertwopi = 64'b000101000101111100110000011011011; //0.001 ends in100100111
	localparam pibytwo =       64'b0110010010000111111011010101000100; //1.
	localparam threepibytwo = 64'b010010110110010111110001111111001101; //100.
	// IF -0.001 etc. floor goes to -1... ffs

	always @ (posedge clk)
	begin
		// cos(-x) = cos(x) so only deal with positive numbers :)

		internal = {in,32'b0};
		divisor <= (in*oneovertwopi); //can I move this up??
		internal = internal - ((divisor[63:32])*twopi);
		
		if(internal <= pi)
		internal = pibytwo - internal;
		else
		internal = internal - threepibytwo;
		out <= internal[34:10];
	end
	

endmodule

/*

	input	clk;
	input [31:0] in;
	output reg signed [23:0] out;
	reg signed [55:0] internal;
	reg signed [55:0] divisor;
	localparam pi =    56'b011001001000011111101101010;//11.
	localparam twopi =     56'b0110010010000111111011010101; //110.
	localparam oneovertwopi = 56'b0001010001011111001100000; //0.001 ends in100100111
	localparam pibytwo =       56'b01100100100001111110110101; //1.
	localparam threepibytwo = 56'b0100101101100101111100011111; //100.
	// IF -0.001 etc. floor goes to -1... ffs

	always @ (posedge clk)
	begin
		// cos(-x) = cos(x) so only deal with positive numbers :)

		internal = {in,24'b0};
		divisor <= (in*oneovertwopi);
		internal = internal - ((divisor[55:24])*twopi);
		
		if(internal <= pi )begin
		internal = pibytwo - internal;
		end
		else
		internal = internal - threepibytwo;
		out <= internal[28:2];
	end

	input	clk;
	input [31:0] in;
	output reg signed [23:0] out;
	reg signed [63:0] internal;
	reg signed [63:0] divisor;
	localparam pi =    64'b01100100100001111110110101010001000;//11.
	localparam twopi =     64'b011001001000011111101101010100010001; //110.
	localparam oneovertwopi = 64'b000101000101111100110000011011011; //0.001 ends in100100111
	localparam pibytwo =       64'b0110010010000111111011010101000100; //1.
	localparam threepibytwo = 64'b010010110110010111110001111111001101; //100.
	// IF -0.001 etc. floor goes to -1... ffs

	always @ (posedge clk)
	begin
		// cos(-x) = cos(x) so only deal with positive numbers :)

		internal = {in,32'b0};
		divisor = (internal[63:32]*oneovertwopi);
		internal = internal - ((divisor[63:32])*twopi);
		
		if(internal <= pi )begin
		internal = pibytwo - internal;
		end
		else
		internal = internal - threepibytwo;
		out <= internal[34:10];
	end


	input	clk;
	input [31:0] in;
	output reg signed [23:0] out;
  reg signed [63:0] internal;
  reg signed [63:0] divisor;
	localparam pi =    64'b01100100100001111110110101010001000;//11.
	localparam twopi =     64'b011001001000011111101101010100010001; //110.
	localparam oneovertwopi = 64'b000101000101111100110000011011011; //0.001 ends in100100111
	localparam pibytwo =       64'b0110010010000111111011010101000100; //1.
	localparam threepibytwo = 64'b010010110110010111110001111111001101; //100.
	// IF -0.001 etc. floor goes to -1... ffs

	always @ (posedge clk)
	begin
		// cos(-x) = cos(x) so only deal with positive numbers :)
//		if(in[31])
//		internal = {((~in)+1'b1),32'b0};
//		else
		internal = {in,32'b0};
	//	divisor = (internal[63:32]*oneovertwopi)>>32;
		internal = internal - (((in*oneovertwopi)>>32)*twopi);
		
		if(internal <= pi )begin
		internal = pibytwo - internal;
		end
		else
		internal = internal - threepibytwo;
		out <= internal[34:10];
	end
	
	
	always @ (posedge clk)
	begin
		case(state)
			1'b0: begin
				if(in[31])
				 // cos(-x) = cos(x) so only deal with positive numbers :)
				internal = {((~in)+1'b1),32'b0};
				else
				internal = {in,32'b0};
				if(internal<= twopi)
					divisor = 0;
				else
					divisor = (internal[63:32]*oneovertwopi)>>32;
				state <=1'b1;
			end
			1'b1: begin
				internal = internal - (divisor*twopi);
				if(internal <= pi )begin
				internal = pibytwo - internal;
				end
				else
				internal = internal - threepibytwo;
				out <= internal[34:10];
				state <=1'b0;
			end
		endcase

	end*/ 