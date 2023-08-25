`timescale 1ns / 1ps



module Q5_tb();
    parameter N = 233;
    reg [N-1:0] A,B;
    wire [N-1:0] M;
    wire [(2*N)-2:0] O;
    

    Q5_top dut(.A(A), .B(B), .M(M), .O(O));
   //    Q5 dut(.A(A), .B(B),.O(O)); To check multipilcation result of only karatsuba
    

    initial begin
        A = 233'd5; 
        B = 233'd6; 
        #100
        A = 233'd456;
        B = 233'd10000;
        #100
        A = 233'hffffffff; B=233'h2;
        #100
        A = 233'h1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        B = 233'h2;
        #100 $finish;
    end
    
endmodule
