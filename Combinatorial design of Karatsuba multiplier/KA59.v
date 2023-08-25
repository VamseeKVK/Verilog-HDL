`timescale 1ns / 1ps


module KA59(O,A,B);

parameter N = 59;
parameter C = 30;
parameter F = 29;


input [58:0] A,B;

wire [28:0] Au,Bu;
wire [29:0] Al,Bl;

wire [58:0] T0,T2;
wire [56:0] T1;

wire [29:0] x1,x2;
wire [58:0] x3,x4;
wire [116:0] x5,x6,x7;

output wire [116:0] O;

begin

    assign Au = A[N-1 : C];
    assign Al = A[F : 0]; 
    assign Bu = B[N-1 : C];
    assign Bl = B[F : 0];
    
    KA29 ka290(T1,Au,Bu);
    KA30 ka300(T0,Al,Bl);
    
    assign x1 = {1'b0,Au} ^ Al;
    assign x2 = {1'b0,Bu} ^ Bl;
    
    KA30 ka301(T2,x1,x2);

    assign x3 = T0 ^ {2'b0,T1};
    assign x4 = x3 ^ T2;
    
    assign x5 = {28'b0,x4,30'b0};
//    assign x5 = x5 << 30;
    assign x6 = {1'b0,T1,59'b0};
//    assign x6 = x6 << 59;
    assign x7 = {58'b0,T0};
    assign O = x6 ^ x5 ^ x7;
  
end

endmodule
