module Mux2to1
(
	clk,
	sel,
	in0,
	in1,
	out
);

input clk;
input sel;
input [31:0] in0;
input [31:0] in1;
output reg [31:0] out; 


always @ (posedge clk)
begin
	case(sel)
		1'b0:
			out <= in0;
		1'b1:
			out <= in1;
	endcase
end

endmodule