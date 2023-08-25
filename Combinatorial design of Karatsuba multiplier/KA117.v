`timescale 1ns / 1ps


module KA117(O,A,B);

parameter N = 117;
parameter C = 59;
parameter F = 58;

input [116:0] A,B;

wire [57:0] Au,Bu;
wire [58:0] Al,Bl;

wire [116:0] T0,T2;
wire [114:0] T1;

wire [58:0] x1,x2;
wire [116:0] x3,x4;
wire [232:0] x5,x6,x7;

output wire [232:0] O;

begin  

    assign Au = A[N-1 : C];
    assign Al = A[F : 0]; 
    assign Bu = B[N-1 : C];
    assign Bl = B[F : 0];
    
    KA58 ka580(T1,Au,Bu);
    KA59 ka590(T0,Al,Bl);
    
    assign x1 = {1'b0,Au} ^ Al;
    assign x2 = {1'b0,Bu} ^ Bl;
    
    KA59 ka591(T2,x1,x2);
    
    assign x3 = T0 ^ {2'b0,T1};
    assign x4 = x3 ^ T2;
    
    assign x5 = {57'b0,x4,59'b0};
//    assign x5 = x5 << 59;
    assign x6 = {3'b0,T1,117'b0};
//    assign x6 = x6 << 117;
    assign x7 = {116'b0,T0};
    assign O = x6 ^ x5 ^ x7;
    
end

endmodule
