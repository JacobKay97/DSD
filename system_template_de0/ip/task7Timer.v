module task7Timer
(
	clk,
	clken,
	mult1,
	mult2,
	addsub,
	convert,
	cordicEn,
	cordicRst
);

	input clk;
	input	clken;
	output reg mult1 = 1'b0;
	output reg mult2 = 1'b0;
	output reg addsub = 1'b0;
	output reg convert = 1'b0;
	output reg cordicEn = 1'b0;
	output reg cordicRst = 1'b0;
	
	reg [4:0] state = 4'b0;
	reg [5:0] clkCount = 6'b0;

	always @ (posedge clk) 	begin
	
		case(state)
			4'd0: begin
				mult1 <= 1'b0;
				mult2 <= 1'b0;
				addsub <= 1'b0;
				convert <= 1'b0;
				cordicEn <= 1'b0;
				cordicRst <= 1'b0;
				clkCount <= 6'b0;
				if(clken == 1'b1)
					state <= 4'd1;
			end
			4'd1: begin
				mult1 <= 1'b1;
				cordicRst <= 1'b1;
				clkCount <= 6'd1;
				state <= 4'd2;

			end
			4'd2: begin
				cordicRst <= 1'b0;
				clkCount <= clkCount + 1'b1;
				state <= 4'd3;
			end
			4'd3: begin
				cordicEn <= 1'b1;
				clkCount <= clkCount + 1'b1;
				state <= 4'd4;
			end
			4'd4: begin
				if(clkCount == 6'd5) begin
					mult1 <= 1'b0;
					state <= 4'd5;
				end
				else
					cordicEn <= 1'b0;
				clkCount <= clkCount + 1'b1;
			end
			4'd5: begin
				if(clkCount == 6'd26) begin
					convert <= 1'b1;
					state <= 4'd6;
				end
				clkCount <= clkCount + 1'b1;
			end
			4'd6: begin
				if(clkCount == 6'd32) begin
					convert <= 1'b0;
					mult2 <= 1'b1;
					state <= 4'd7;
				end
				clkCount <= clkCount + 1'b1;
			end
			4'd7: begin
				if(clkCount == 6'd37) begin
					mult2 <= 1'b0;
					addsub <= 1'b1;
					state <= 4'd8;
				end
				clkCount <= clkCount + 1'b1;
			end
			4'd8: begin
				if(clkCount == 6'd44) begin
					addsub <= 1'b0;
					state <= 4'd0; //Do I want to go back to idle state??
					clkCount <= 6'b0;
				end
				else
					clkCount <= clkCount + 1'b1;
			end		   
		   
		endcase	
	end
endmodule
