module task8Timer
(
	clk,
	clken,
	mult1,
	mult2,
	addsub,
	convert,
	cordicRst
);

	input clk;
	input	clken;
	output reg mult1 = 1'b0;
	output reg mult2 = 1'b0;
	output reg addsub = 1'b0;
	output reg convert = 1'b0;
	output reg cordicRst = 1'b0;
	
	reg [3:0] state = 3'b0;
	reg [5:0] clkCount = 6'b0;
	
	
	
	always @ (posedge clk) 	begin
	
		case(state)
			3'd0: begin
				mult1 <= 1'b0;
				mult2 <= 1'b0;
				addsub <= 1'b0;
				convert <= 1'b0;
				cordicRst <= 1'b0;
				clkCount <= 6'b0;
				if(clken == 1'b1)
					state <= 3'd1;
			end
			3'd1: begin
				mult1 <= 1'b1;
				cordicRst <= 1'b1;
				clkCount <= 6'd1;
				state <= 3'd2;
			end
			3'd2: begin
				cordicRst <= 1'b0; //was 1 here
				clkCount <= clkCount + 1'b1;
				state <= 3'd3;
			end
			3'd3: begin
				if(clkCount == 6'd5) begin
					mult1 <= 1'b0;
					state <= 3'd4;
				end
				clkCount <= clkCount + 1'b1;
			end
			3'd4: begin
				if(clkCount == 6'd17) begin
					convert <= 1'b1;
					state <= 3'd5;
				end
				clkCount <= clkCount + 1'b1;
			end
			3'd5: begin
				//convert <= 1'b0;
				mult2 <= 1'b1;
				state <= 3'd6;
				clkCount <= clkCount + 1'b1;
			end
			3'd6: begin
				if(clkCount == 6'd23) begin
				  convert <= 1'b0; //very hacky way
					mult2 <= 1'b0;
					addsub <= 1'b1;
					state <= 3'd7;
				end
				clkCount <= clkCount + 1'b1;
			end
			3'd7: begin
				if(clkCount == 6'd30) begin
					addsub <= 1'b0;
					state <= 3'd0; //Do I want to go back to idle state??
					clkCount <= 6'b0;
				end
				else
					clkCount <= clkCount + 1'b1;
			end		   
		   
		endcase	
	end
endmodule
