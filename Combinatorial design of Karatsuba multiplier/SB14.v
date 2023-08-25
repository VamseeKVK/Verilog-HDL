`timescale 1ns / 1ps


module SB14(O,A,B);
//parameter N = 14;

input [13:0] A,B;
output [26:0] O;

begin
assign O = A*B;
end

endmodule
