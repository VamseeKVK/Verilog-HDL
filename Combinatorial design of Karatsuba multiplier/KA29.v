`timescale 1ns / 1ps



module KA29(O,A,B);

parameter N = 29;
parameter C = 15;
parameter F = 14;


input [28:0] A,B;

wire [13:0] Au,Bu;
wire [14:0] Al,Bl;

wire [28:0] T0,T2;
wire [26:0] T1;

wire [14:0] x1,x2;
wire [28:0] x3,x4;
wire [58:0] x5,x6,x7;

output wire [58:0] O;


begin

    assign Au = A[N-1 : C];
    assign Al = A[F : 0]; 
    assign Bu = B[N-1 : C];
    assign Bl = B[F : 0];
    
    SB14 sb140(T1,Au,Bu);
    SB15 sb150(T0,Al,Bl);
    
    assign x1 = {1'b0,Au} ^ Al;
    assign x2 = {1'b0,Bu} ^ Bl;
    
    SB15 sb151(T2,x1,x2);
    
    assign x3 = T0 ^ {2'b0,T1};
    assign x4 = x3 ^ T2;
    
    assign x5 = {16'b0,x4,15'b0};
//    assign x5 = x5 << 15;
    assign x6 = {3'b0,T1,29'b0};
//    assign x6 = x6 << 29;
    assign x7 = {30'b0,T0};
    assign O = x6 ^ x5 ^ x7;

end

endmodule
