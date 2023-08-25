`timescale 1ns / 1ps


module KA58(O,A,B);

parameter N = 58;
parameter C = 29;
parameter F = 28;


input [57:0] A,B;

wire [28:0] Au,Bu;
wire [28:0] Al,Bl;

wire [56:0] T0,T2;
wire [56:0] T1;

wire [28:0] x1,x2;
wire [56:0] x3,x4;
wire [114:0] x5,x6,x7;

output wire [114:0] O;


begin

    assign Au = A[N-1 : C];
    assign Al = A[F : 0]; 
    assign Bu = B[N-1 : C];
    assign Bl = B[F : 0];
    
    KA29 ka290(T1,Au,Bu);
    KA29 ka291(T0,Al,Bl);
    

    assign x1 = Au ^ Al;
    assign x2 = Bu ^ Bl;
    
    KA29 ka292(T2,x1,x2);
    

    assign x3 = T0 ^ T1;
    assign x4 = x3 ^ T2;
    
    assign x5 = {29'b0,x4,29'b0};
//    assign x5 = x5 << 29;
    assign x6 = {T1,58'b0};
//    assign x6 = x6 << 58;
    assign x7 = {58'b0,T0};
    assign O = x6 ^ x5 ^ x7;
    

end

endmodule
