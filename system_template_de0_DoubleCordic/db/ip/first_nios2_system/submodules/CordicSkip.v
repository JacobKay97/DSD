module CordicSkip
(
	clk,
	clken,
	cordicDone,
	look,
	floorIn,
	floatIn,
	floatOut,
	found
);

	input clk;
	input	clken;
	input cordicDone;
	input look;
	input [31:0] floorIn;
	input [31:0] floatIn;
	output reg [31:0]  floatOut;
	output reg found;
	reg [31:0] storedVals [0:3] [0:1];		// 4 rows, 2 columns??
	reg [3:0] state = 3'b0;

	
	always @ (posedge clk) 	begin
		case(state)
			3'd0: begin		//Initialise state
				storedVals[0][0] <= 32'd32;
				storedVals[0][1] <= 32'h3f558fa8;
				storedVals[1][0] <= 32'd31;
				storedVals[1][1] <= 32'h3f6a2c8e;
				storedVals[2][0] <= 32'd30;
				storedVals[2][1] <= 32'h3e1df41e;
				storedVals[3][0] <= 32'd29;
				storedVals[3][1] <= 32'hbf3f80b2;
				state <=3'd1;
			end
			3'd1: begin
				if(look) begin
					if(floorIn == storedVals[0][0]) begin
						floatOut <= storedVals[0][1];
						found <= 1'b1;
					end
					else if(floorIn == storedVals[1][0]) begin
						floatOut <= storedVals[1][1];
						found <= 1'b1;
					end
					else if(floorIn == storedVals[2][0]) begin
						floatOut <= storedVals[2][1];
						found <= 1'b1;
					end
					else if(floorIn == storedVals[3][0]) begin
						floatOut <= storedVals[3][1];
						found <= 1'b1;
					end
					else begin
						state <=3'd2;
						found <= 1'b0;
						floatOut <= 32'b0;
					end
				end
			end
			3'd2: begin
				if(cordicDone) begin
					storedVals[0][0] <= floorIn;
					storedVals[0][1] <= floatIn;
					storedVals[1][0] <= storedVals[0][0];
					storedVals[1][1] <= storedVals[0][1];
					storedVals[2][0] <= storedVals[1][0];
					storedVals[2][1] <= storedVals[1][1];
					storedVals[3][0] <= storedVals[2][0];
					storedVals[3][1] <= storedVals[2][1];
					state <=3'd1;
				end	
			end	
		endcase
	end
endmodule
