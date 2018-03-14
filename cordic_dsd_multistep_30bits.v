module cordic_dsd_multistep_30bits #(parameter DATA_WIDTH = 30)
(
	input	clk, rst,
	input signed [DATA_WIDTH-1:0] z,
	output signed [DATA_WIDTH-1:0] sin_out
);
	
	reg [4:0] n = 5'd10;
	
	reg signed [DATA_WIDTH+3:0] x_0, x_0_next, x_1_next, x_2_next;
	reg signed [DATA_WIDTH+3:0] y_0, y_0_next, y_1_next, y_2_next;
	reg signed [DATA_WIDTH+3:0] z_0, z_0_next, z_1_next, z_2_next;	
	
	reg[DATA_WIDTH-1:0] out_reg;
	
	reg state;
	
	wire signed [DATA_WIDTH-1:0] tan_values[0:DATA_WIDTH-1];
	
	assign tan_values[0] = 30'hC90FDAA;
	assign tan_values[1] = 30'h76B19C1;
	assign tan_values[2] = 30'h3EB6EBF;
	assign tan_values[3] = 30'h1FD5BAA;
	assign tan_values[4] = 30'h0FFAADE;
	assign tan_values[5] = 30'h07FF557;
	assign tan_values[6] = 30'h03FFEAB;
	assign tan_values[7] = 30'h01FFFD5;
	assign tan_values[8] = 30'h00FFFFB;
	assign tan_values[9] = 30'h007FFFF;
	assign tan_values[10] = 30'h0040000;
	assign tan_values[11] = 30'h0020000;
	assign tan_values[12] = 30'h0010000;
	assign tan_values[13] = 30'h0008000;
	assign tan_values[14] = 30'h0004000;
	assign tan_values[15] = 30'h0002000;
	assign tan_values[16] = 30'h0001000;
	assign tan_values[17] = 30'h0000800;
	assign tan_values[18] = 30'h0000400;
	assign tan_values[19] = 30'h0000200;
	assign tan_values[20] = 30'h0000100;
	assign tan_values[21] = 30'h0000080;
	assign tan_values[22] = 30'h0000040;
	assign tan_values[23] = 30'h0000020;
	assign tan_values[24] = 30'h0000010;
	assign tan_values[25] = 30'h0000008;
	assign tan_values[26] = 30'h0000004;
	assign tan_values[27] = 30'h0000002;
	assign tan_values[28] = 30'h0000001;
	assign tan_values[29] = 30'h0000001;
	
	always @ (*)
	begin
	
		x_0 <= x_2_next;
		y_0 <= y_2_next;
		z_0 <= z_2_next;

		if(n == 5'd10)
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
			n <= 5'd10;
		end
		else
		begin
			case (state)
				1'b0:
				begin
					x_2_next <= 33'h9B74EDB;
					y_2_next <= 33'b0;
					z_2_next <= z;
					
					n <= 5'b0;
					out_reg <= y_2_next;				
				end

				1'b1:
				begin
					if (z_0[DATA_WIDTH-1]==1'b0)
					begin
						x_0_next = x_0 - (y_0 >>> (3*n));
						y_0_next = y_0 + (x_0 >>> (3*n));
						z_0_next = z_0 - tan_values[(3*n)];
					end
					else
					begin
						x_0_next = x_0 + (y_0 >>> (3*n));
						y_0_next = y_0 - (x_0 >>> (3*n));
						z_0_next = z_0 + tan_values[(3*n)];
					end
					
					if (z_0_next[DATA_WIDTH-1]==1'b0)
					begin
						x_1_next = x_0_next - (y_0_next >>> ((3*n) + 1));
						y_1_next = y_0_next + (x_0_next >>> ((3*n) + 1));
						z_1_next = z_0_next - tan_values[((3*n) + 1)];
					end
					else
					begin
						x_1_next = x_0_next + (y_0_next >>> ((3*n) + 1));
						y_1_next = y_0_next - (x_0_next >>> ((3*n) + 1));
						z_1_next = z_0_next + tan_values[((3*n) + 1)];
					end
					
					if (z_1_next[DATA_WIDTH-1]==1'b0)
					begin
						x_2_next = x_1_next - (y_1_next >>> ((3*n) + 2));
						y_2_next = y_1_next + (x_1_next >>> ((3*n) + 2));
						z_2_next = z_1_next - tan_values[((3*n) + 2)];
					end
					else
					begin
						x_2_next = x_1_next + (y_1_next >>> ((3*n) + 2));
						y_2_next = y_1_next - (x_1_next >>> ((3*n) + 2));
						z_2_next = z_1_next + tan_values[((3*n) + 2)];
					end
					
					n = n + 1'b1;
					
				end
			endcase
		end
	end
	 
	assign sin_out = out_reg;
	
endmodule