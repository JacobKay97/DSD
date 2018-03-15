module Task_8_timerv3
(
	clk,
	clk_en,
	found,
	multi_1_en,
	multi_2_en,
	cordic_rs,
	adder_1_en,
	adder_2_en,
	cordicDone,
	look,
	done
);

input clk;
input clk_en;
input found;
output reg multi_1_en = 1'b0;
output reg multi_2_en = 1'b0;
output reg cordic_rs = 1'b1;
output reg adder_1_en = 1'b0;
output reg adder_2_en = 1'b0;
output reg cordicDone = 1'b0;
output reg look = 1'b0;
output reg done = 1'b0;

reg[5:0] timer = 6'b0;

always @ (posedge clk)
begin
	case(timer)
		6'd0:
		begin
			multi_1_en <= 1'b0;
			multi_2_en <= 1'b0;
			cordic_rs <= 1'b1;
			adder_1_en <= 1'b0;
			adder_2_en <= 1'b0;
			cordicDone <= 1'b0;
			look <= 1'b0;

		end
		
		6'd1:
		begin
			multi_1_en <= 1'b1;
			look <= 1'b1;
		end
		
		6'd3:
		begin
			look <= 1'b0;
			cordic_rs <= 1'b0;
		end
		
		
		6'd21:
		begin
			if(~found)begin
				cordicDone <= 1'b1;
			end
			multi_1_en <= 1'b0;
			multi_2_en <= 1'b1;
			
		end
//		6'd21:
//		begin
//			cordicDone <=1'b0;
//		end
		
		6'd26: // 24 or 25??
		begin
			multi_2_en <= 1'b0;
			adder_1_en <= 1'b1;
			cordicDone <=1'b0;
		end
		
		
		6'd33:
		begin
			adder_1_en <= 1'b0;
			adder_2_en <= 1'b1;
		end
		
			
		6'd40:
		begin
			adder_2_en <= 1'b0;
		end
		
		6'd41:
		begin
			done <= 1'b1;
		end
		
		
		default:
		begin
		end	
	endcase
	if(clk_en)
	begin
    if(timer == 6'd6 && found)
      timer <= 6'd21;
  else
		  timer <= (timer == 6'd42) ? 6'b0 : timer + 6'd1;
	end	
	else
		timer <= 6'd0;
end

endmodule