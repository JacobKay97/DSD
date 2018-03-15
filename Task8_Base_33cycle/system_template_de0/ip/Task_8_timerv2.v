module Task_8_timer
(
	clk,
	multi_1_en,
	multi_2_en,
	cordic_rs,
	adder_1_en,
	adder_2_en,
	mlpx_1,
	mlpx_2,
	mlpx_3
);

input clk;
output reg multi_1_en = 1'b0;
output reg multi_2_en = 1'b0;
output reg cordic_rs = 1'b1;
output reg adder_1_en = 1'b0;
output reg adder_2_en = 1'b0;
output reg mlpx_1 = 1'b0;
output reg mlpx_2 = 1'b0;
output reg mlpx_3 = 1'b0;

reg[5:0] timer = 6'b0;

always @ (posedge clk)
begin
	case(timer)
		6'd0:
		begin
			multi_1_en <= 1'b0;
			multi_1_en <= 1'b0;
			cordic_rs <= 1'b1;
			adder_1_en <= 1'b0;
			adder_2_en <= 1'b0;
			mlpx_1 <= 1'b0;
			mlpx_2 <= 1'b0;
			mlpx_3 <= 1'b0;
		end
		
		6'd1:
		begin
			multi_1_en <= 1'b1;
		end
		
		6'd2:
		begin
			cordic_rs <= 1'b0;
		end
		
		6'd16:
		begin
			mlpx_3 <= 1'b1;
		end
		
		6'd19:
		begin
			multi_1_en <= 1'b0;
			multi_2_en <= 1'b1;
		end
		
		6'd24:
		begin
			multi_2_en <= 1'b0;
			adder_1_en <= 1'b1;
		end
		
		6'd28:
		begin
			mlpx_2 <= 1'b1;
		end
		
		6'd30:
		begin
			multi_1_en <= 1'b1;
		end
		
		6'd31:
		begin
			adder_1_en <= 1'b0;
			adder_2_en <= 1'b1;
			mlpx_1 <= 1'b1;
		end
		
		6'd35:
		begin
			cordic_rs <= 1'b1;
			multi_1_en <= 1'b0;
			multi_2_en <= 1'b1;
		end
			
		6'd38:
		begin
			adder_2_en <= 1'b0;
		end
		
		6'd40:
		begin
			multi_2_en <= 1'b0;
			adder_1_en <= 1'b1;
		end
		
		6'd47:
		begin
			adder_1_en <= 1'b0;
			adder_2_en <= 1'b1;
		end
		
		6'd54:
		begin
			adder_2_en <= 1'b0;
		end
		
		default:
		begin
		end	
	endcase
	
	timer <= (timer == 6'd54) ? 0 : timer + 6'd1;
	
end

endmodule