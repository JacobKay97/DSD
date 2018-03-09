module cordic_dsd #(parameter DATA_WIDTH = 24)
(
	input	clk, rst, en,
	input signed [DATA_WIDTH-1:0] z,
	input negate,
	output done,
	output signed [DATA_WIDTH-1:0] sin_out
);
	
	reg [5:0] n,n_next;
	reg done_int, done_dly;
	wire	done_redge;
	
	reg signed [27:0]x_reg,y_reg,x_next,y_next,z_reg,z_next;
	
	
	reg [1:0] state,state_next;
	
	
	reg [DATA_WIDTH-1:0] tan_values[0:23];
	
	initial
	begin
	
	tan_values[0] = 24'h3243F7;
	tan_values[1] = 24'h1DAC67;
	tan_values[2] = 24'h0FADBB;
	tan_values[3] = 24'h07F56F;
	tan_values[4] = 24'h03FEAB;
	tan_values[5] = 24'h01FFD5;
	tan_values[6] = 24'h00FFFB;
	tan_values[7] = 24'h007FFF;
	tan_values[8] = 24'h004000;
	tan_values[9] = 24'h002000;
	tan_values[10] = 24'h001000;
	tan_values[11] = 24'h000800;
	tan_values[12] = 24'h000400;
	tan_values[13] = 24'h000200;
	tan_values[14] = 24'h000100;
	tan_values[15] = 24'h000080;
	tan_values[16] = 24'h000040;
	tan_values[17] = 24'h000020;
	tan_values[18] = 24'h000010;
	tan_values[19] = 24'h000008;
	tan_values[20] = 24'h000004;
	tan_values[21] = 24'h000002;
	tan_values[22] = 24'h000001;
	tan_values[23] = 24'h000001;
	
	end
	
	
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
				x_next = 24'h26DD3B;
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

	 
	assign done = done_redge;

	assign done_redge = done_int & (~done_dly);   
	assign sin_out = done_redge? y_reg: 0;
	
endmodule
