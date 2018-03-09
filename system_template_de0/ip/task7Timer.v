module task7Timer
(
	clk,
	start,
	mult1,
	mult2,
	addsub,
	convert,
	cordicEn,
	cordicRst
);

	input clk;
	input	start;
	output reg	mult1 = 1'b0;
	output reg mult2 = 1'b0;
	output reg addsub = 1'b0;
	output reg convert = 1'b0;
	output reg cordicEn = 1'b0;
	output reg cordicRst = 1'b0;
	
	reg [3:0] state = 3'b0;
	reg [5:0] clkCount = 6'b0;
	
	
	always @ (posedge clk) 	begin
	case(state)
		3'd0: begin
			mult1 <= 1'b1;
			cordicRst <= 1'b1;
			clkCount <= 6'd1;
			state <= 3'd1;
			end
		3'd1: begin
			cordicRst <= 1'b0;
			clkCount <= clkCount + 1'b1;
			state <= 3'd2;
			end
		3'd2: begin
			cordicEn <= 1'b1;
			clkCount <= clkCount + 1'b1;
			state <= 3'd3;
			end
		3'd3: begin
			if(clkCount == 6'd5) begin
				mult1 <= 1'b0;
				state <= 3'd4;
			end
			else begin
				cordicEn <= 1'b0;
				
			end
			clkCount <= clkCount + 1'b1;
			end
		3'd4: begin
		  if(clkCount == 6'd26) begin
		    convert <= 1'b1;
		    state <= 3'd5;
		   end
		   clkCount <= clkCount + 1'b1;
		   end
		3'd5: begin
		   if(clkCount == 6'd32) begin
		    convert <= 1'b0;
		    mult2 <= 1'b1;
		    state <= 3'd6;
		   end
		   clkCount <= clkCount + 1'b1;
		   end
		3'd6: begin
		   if(clkCount == 6'd37) begin
		    mult2 <= 1'b0;
		    addsub <= 1'b1;
		    state <= 3'd7;
		   end
		   clkCount <= clkCount + 1'b1;
		   end
		3'd7: begin
		   if(clkCount == 6'd44) begin
		    addsub <= 1'b0;
		    state <= 3'd0;
		    clkCount <= 6'b0;
		   end
		   else
    		   clkCount <= clkCount + 1'b1;
		   end		   
		   
endcase
	end
endmodule