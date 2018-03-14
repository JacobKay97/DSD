module cordic_dsd #(parameter DATA_WIDTH = 28)
(
	input	clk, rst, en,
	input signed [DATA_WIDTH-1:0] z,
	output signed [DATA_WIDTH-1:0] sin_out
);
	
	reg [5:0] n,n_next;
	reg done_int, done_dly;
	wire	done_redge;
	
	reg signed [27:0]x_reg,y_reg,x_next,y_next,z_reg,z_next;
	
	
	reg [1:0] state,state_next;
	
	wire signed [DATA_WIDTH-1:0] tan_values [0:DATA_WIDTH-1];
	
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
	

	
	parameter idle = 1'b0, iteration = 1'b1;

	 
	always @ (posedge clk, posedge rst) 
	begin
		if (rst)
		begin
			state <= idle;
			n 	  <= 0;
			x_reg <= 0;
			y_reg <= 0;
			z_reg <= 0;
			done_dly <=1;
		end
		else
		begin
			state <= state_next;
			n 	  <= n_next;
			x_reg <= x_next;
			y_reg <= y_next;
			z_reg <= z_next;
			done_dly <= done_int;
		end	
	end

	 
	always @ (*)
	begin
		n_next = n;
		done_int = 1'b0;
		case (state)
			idle:
			begin
				if (en)
				begin
					state_next = iteration;
				end
				else
				begin
					state_next = idle;
				end
				n_next = 0;
				done_int = 1'b1;
			end
			iteration:
			begin
				if (n == (DATA_WIDTH-2))
				begin
					state_next = idle;
				end
				else
				begin
					n_next = n + 1'b1;
					state_next = iteration;
				end
			end
		endcase
	end

	
	always @ (*)
	begin
		case (state)
			idle:
			begin
				x_next = 28'h26DD3B7;
				y_next = 0;
				z_next = z;
			end
			iteration:
			begin
				if (z_reg[DATA_WIDTH-1]==1'b0)
				begin
					x_next = x_reg - (y_reg >>> n);
					y_next = y_reg + (x_reg >>> n);
					z_next = z_reg - tan_values[n];
				end
				else
				begin
					x_next = x_reg + (y_reg >>> n);
					y_next = y_reg - (x_reg >>> n);
					z_next = z_reg + tan_values[n];
				end
			end
		endcase
	end

	assign done_redge = done_int & (~done_dly);   
	assign sin_out = done_redge? y_reg: 0;
	
endmodule
