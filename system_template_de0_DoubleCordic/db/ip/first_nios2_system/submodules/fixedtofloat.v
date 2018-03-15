module fixedtofloat
(
	clk,
	clken,
	fixedin,
	floatout
);

	input clk;
	input	clken;
	input signed [27:0] fixedin;
	output reg [31:0] floatout;
	reg [27:0] internal;
	reg sign;
	reg [2:0] GRS;
	
	
	
	always @ (posedge clk) 	begin
	//	if(clken) begin
			if(fixedin[27]) begin
				internal = ~fixedin + 1'b1;
				sign = 1'b1;
			end
			else begin
				internal = fixedin;
				sign = 1'b0;
			end
				
			casez(internal)
				28'b01??????????????????????????: begin
					GRS = internal[2:0]; //Need to deal with overflow conditions????
					if(GRS == 3'b100) begin //Tie
						if (internal[3]) begin //If last bit is 1, it's odd so round up
							internal = internal + 28'b01000; //Add to the last mantissa bit
						end
					end
					else if(GRS == 3'b101 || GRS == 3'b110 || GRS == 3'b111) begin //Round up
						internal = internal + 28'b01000;
					end
					
					floatout <= {sign, 8'd127, internal[25:3] };
				end
				28'b001?????????????????????????: begin
					GRS = {internal[1:0],1'b0}; //Need to deal with overflow conditions????
					if(GRS == 3'b100) begin //Tie
						if (internal[2]) begin //If last bit is 1, it's odd so round up
							internal = internal + 28'b0100; //Add to the last mantissa bit
						end
					end
					else if(GRS == 3'b101 || GRS == 3'b110 || GRS == 3'b111) begin //Round up
						internal = internal + 28'b0100;
					end
				
					floatout <= {sign, 8'd126, internal[24:2]};
				end
				28'b0001????????????????????????: begin
					GRS = {internal[0], 2'b0}; //Need to deal with overflow conditions????
					if(GRS == 3'b100) begin //Tie
						if (internal[1]) begin //If last bit is 1, it's odd so round up
							internal = internal + 28'b010; //Add to the last mantissa bit
						end
					end
					else if(GRS == 3'b101 || GRS == 3'b110 || GRS == 3'b111) begin //Round up
						internal = internal + 28'b010;
					end
				
					floatout <= {sign, 8'd125, internal[23:1]};
				end
				28'b00001???????????????????????: begin
					floatout <= {sign, 8'd124, internal[22:0]};
				end
				28'b000001??????????????????????: begin
					floatout <= {sign, 8'd123, internal[21:0], 1'b0};
				end
				28'b0000001?????????????????????: begin
					floatout <= {sign, 8'd122, internal[20:0], 2'b0};
				end
				28'b00000001????????????????????: begin
					floatout <= {sign, 8'd121, internal[19:0], 3'b0};
				end
				28'b000000001???????????????????: begin
					floatout <= {sign, 8'd120, internal[18:0], 4'b0};
				end
				28'b0000000001??????????????????: begin
					floatout <= {sign, 8'd119, internal[17:0], 5'b0};
				end
				28'b00000000001?????????????????: begin
					floatout <= {sign, 8'd118, internal[16:0], 6'b0};
				end  
				28'b000000000001????????????????: begin
					floatout <= {sign, 8'd117, internal[15:0], 7'b0};
				end
				28'b0000000000001???????????????: begin
					floatout <= {sign, 8'd116, internal[14:0], 8'b0};
				end
				28'b00000000000001??????????????: begin
					floatout <= {sign, 8'd115, internal[13:0], 9'b0};
				end
				28'b000000000000001?????????????: begin
					floatout <= {sign, 8'd114, internal[12:0], 10'b0};
				end
				28'b0000000000000001????????????: begin
					floatout <= {sign, 8'd113, internal[11:0], 11'b0};
				end
				28'b00000000000000001???????????: begin
					floatout <= {sign, 8'd112, internal[10:0], 12'b0};
				end
				28'b000000000000000001??????????: begin
					floatout <= {sign, 8'd111, internal[9:0], 13'b0};
				end
				28'b0000000000000000001?????????: begin
					floatout <= {sign, 8'd110, internal[8:0], 14'b0};
				end
				28'b00000000000000000001????????: begin
					floatout <= {sign, 8'd109, internal[7:0], 15'b0};
				end
				28'b000000000000000000001???????: begin
					floatout <= {sign, 8'd108, internal[6:0], 16'b0};
				end
				28'b0000000000000000000001??????: begin
					floatout <= {sign, 8'd107, internal[5:0], 17'b0};
				end
				28'b00000000000000000000001?????: begin
					floatout <= {sign, 8'd106, internal[4:0], 18'b0};
				end
				28'b000000000000000000000001????: begin
					floatout <= {sign, 8'd105, internal[3:0], 19'b0};
				end
				28'b0000000000000000000000001???: begin
					floatout <= {sign, 8'd104, internal[2:0], 20'b0};
				end
				28'b00000000000000000000000001??: begin
					floatout <= {sign, 8'd103, internal[1:0], 21'b0};
				end
				28'b000000000000000000000000001?: begin
					floatout <= {sign, 8'd102, internal[0], 22'b0};
				end
				28'b0000000000000000000000000001: begin
					floatout <= {sign, 8'd101, 23'd0};
				end
				28'b0000000000000000000000000000: begin
					floatout <= {sign, 8'd0, 23'd0};
				end
			endcase
	//	end
	//	else begin
	//		floatout <= 32'b0;
	//		internal = 28'b0;
	//		sign <= 1'b0;
	//	end
	
	
	end
endmodule

/*


0d58fa94 goes to
3f558fa9

001101010110001111101010010100
00111111010101011000111110101001
SeeeeeeeeMMMMMMMMMMMMMMMMMMMMMMM


001101010110001111101010010100

=> 10101011000111110101001 */ 