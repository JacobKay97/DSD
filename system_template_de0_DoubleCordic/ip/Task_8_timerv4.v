module Task_8_timerv4
(
	clk,
	clk_en,
	n,
	multi_1_en,
	multi_2_en,
	cordic_rs,
	adder_1_en,
	adder_2_en,
	mlpx_1,
	mlpx_2,
	mlpx_3,
	resetAcc,
	done
);

input clk;
input clk_en;
input [7:0] n;
output reg multi_1_en = 1'b0;
output reg multi_2_en = 1'b0;
output reg cordic_rs = 1'b1;
output reg adder_1_en = 1'b0;
output reg adder_2_en = 1'b0;
output reg mlpx_1 = 1'b0;
output reg mlpx_2 = 1'b0;
output reg mlpx_3 = 1'b0;
output reg resetAcc = 1'b0;
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
			mlpx_1 <= 1'b0;
			mlpx_2 <= 1'b0;
			mlpx_3 <= 1'b0;
			resetAcc <=1'b0;
			done <= 1'b0;
		end
		
		6'd1:
		begin
			multi_1_en <= 1'b1;
			if(n == 8'b1)
				resetAcc <=1'b1;
		end
		
		6'd2:
		begin
		  cordic_rs <= 1'b0;
		end
		
		6'd3:
		begin
			if(n == 8'b1)
				resetAcc <=1'b0;
		end
    6'd6:
    begin
      multi_1_en <= 1'b0;
		end
		
		6'd20:
		begin
			multi_2_en <= 1'b1;
			mlpx_2 <= 1'b1;
		end
		
		6'd22:
		begin
		  multi_1_en <= 1'b1;
		end
		
		6'd25:
		begin
			multi_2_en <= 1'b0;
			adder_1_en <= 1'b1;
			mlpx_3 <= 1'b1; // Should be 26
		end
		
		
		6'd27:
		begin
		  multi_1_en <= 1'b0;
			multi_2_en <= 1'b1;
		end
		
		6'd29:
		begin
			mlpx_2 <= 1'b1;
		end
		
		6'd30:
		begin
		  mlpx_1 <= 1'b1;
		end
		  
		
		6'd32:
		begin
		  multi_2_en <= 1'b0;
			adder_2_en <= 1'b1;
		end
		
		6'd39:
		begin
		  adder_1_en <=1'b0;
		end	
		6'd46:
		begin
			adder_2_en <= 1'b0;
			done <= 1'b1;
		end
		6'd48:
		begin
		  done <= 1'b0;
		end
    
		
		default:
		begin
		end	
	endcase
	if(clk_en)
		timer <= (timer == 6'd49) ? 6'b0 : timer + 6'd1;
	else
		timer <= 6'd0;
end

endmodule