module cordic_dsd_multirate #(parameter DATA_WIDTH = 28)
(
	input	clk, rst,
	input signed [DATA_WIDTH-1:0] z,
	output signed [DATA_WIDTH-1:0] sin_out
);
	
	reg [4:0] n = 5'd14;
	
	reg signed [DATA_WIDTH+3:0] x_0, x_0_next, x_1_next;
	reg signed [DATA_WIDTH+3:0] y_0, y_0_next, y_1_next;
	reg signed [DATA_WIDTH+3:0] z_0, z_0_next, z_1_next;	
	
	reg[DATA_WIDTH-1:0] out_reg;
	
	reg state;
	
	wire signed [DATA_WIDTH-1:0] tan_values[0:DATA_WIDTH-1];
	
	assign tan_values[0] = 28'h3243F6B;
	assign tan_values[1] = 28'h1DAC670;
	assign tan_values[2] = 28'h0FADBB0;
	assign tan_values[3] = 28'h07F56EA;
	assign tan_values[4] = 28'h03FEAB7;
	assign tan_values[5] = 28'h01FFD56;
	assign tan_values[6] = 28'h00FFFAB;
	assign tan_values[7] = 28'h007FFF5;
	assign tan_values[8] = 28'h003FFFF;
	assign tan_values[9] = 28'h0020000;
	assign tan_values[10] = 28'h0010000;
	assign tan_values[11] = 28'h0008000;
	assign tan_values[12] = 28'h0004000;
	assign tan_values[13] = 28'h0002000;
	assign tan_values[14] = 28'h0001000;
	assign tan_values[15] = 28'h0000800;
	assign tan_values[16] = 28'h0000400;
	assign tan_values[17] = 28'h0000200;
	assign tan_values[18] = 28'h0000100;
	assign tan_values[19] = 28'h0000080;
	assign tan_values[20] = 28'h0000040;
	assign tan_values[21] = 28'h0000020;
	assign tan_values[22] = 28'h0000010;
	assign tan_values[23] = 28'h0000008;
	assign tan_values[24] = 28'h0000004;
	assign tan_values[25] = 28'h0000002;
	assign tan_values[26] = 28'h0000001;
	assign tan_values[27] = 28'h0000001;
	
	always @ (*)
	begin
	
		x_0 <= x_1_next;
		y_0 <= y_1_next;
		z_0 <= z_1_next;

		if(n == 5'd14)
		begin
			state = 1'b0;
			
		end
		else
		begin
			state = 1'b1;
		end
	
	end

	
	always @ (posedge clk)
	begin
		if(rst)
		begin
			n <= 5'd14;
		end
		else
		begin
			case (state)
				1'b0:
				begin
					x_1_next <= 31'h26DD3B7;
					y_1_next <= 31'b0;
					z_1_next <= z;
					
					n <= 5'b0;
					out_reg <= y_1_next;				
				end

				1'b1:
				begin
					if (z_0[DATA_WIDTH-1]==1'b0)
					begin
						x_0_next = x_0 - (y_0 >>> (n << 1));
						y_0_next = y_0 + (x_0 >>> (n << 1));
						z_0_next = z_0 - tan_values[(n << 1)];
					end
					else
					begin
						x_0_next = x_0 + (y_0 >>> (n << 1));
						y_0_next = y_0 - (x_0 >>> (n << 1));
						z_0_next = z_0 + tan_values[(n << 1)];
					end
					
					if (z_0_next[DATA_WIDTH-1]==1'b0)
					begin
						x_1_next = x_0_next - (y_0_next >>> ((n << 1) + 1));
						y_1_next = y_0_next + (x_0_next >>> ((n << 1) + 1));
						z_1_next = z_0_next - tan_values[((n << 1) + 1)];
					end
					else
					begin
						x_1_next = x_0_next + (y_0_next >>> ((n << 1) + 1));
						y_1_next = y_0_next - (x_0_next >>> ((n << 1) + 1));
						z_1_next = z_0_next + tan_values[((n << 1) + 1)];
					end
					
					n = n + 1'b1;
					
				end
			endcase
		end
	end
	 
	assign sin_out = out_reg;
	
endmodule
