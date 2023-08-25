`timescale 1ns / 1ps


module SB15(O,A,B);
//parameter N = 15;

input [14:0] A,B;
output [28:0] O;

begin
assign O = A*B;
end

endmodule
