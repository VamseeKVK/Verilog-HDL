`timescale 1ns / 1ps


module Q5_top(M,O,A,B);

parameter N = 233;
input [N-1:0] A,B;
output wire [(2*N)-2:0] O;
//wire [N-1:0]r1;
output wire [N-1:0] M;
begin
    Q5 Q5_0(O,A,B); 
    assign M = {O[232:0]} ^ {1'b0,O[464:233]} ^ {O[391:233],74'b0} ^ {160'b0,O[464:392]} ^ {86'b0,O[464:392],74'b0} ;
end

endmodule
