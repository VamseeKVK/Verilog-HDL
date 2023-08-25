`timescale 1ns / 1ps


module Q5(O,A,B);
parameter N = 233;
parameter C = 117;
parameter F = 116;

input [232:0] A,B;

wire [115:0] Au,Bu;
wire [116:0] Al,Bl;

wire [232:0] T0,T2;
wire [230:0] T1;

wire [116:0] x1,x2;
wire [232:0] x3,x4;
wire [464:0] x5,x6,x7;

output wire [464:0] O;


begin
   
    assign Au = A[N-1 : C];
    assign Al = A[F : 0]; 
    assign Bu = B[N-1 : C];
    assign Bl = B[F : 0];
    
    KA116 ka1160(T1,Au,Bu);
    KA117 ka1171(T0,Al,Bl);
    
    assign x1 = {1'b0,Au} ^ Al;
    assign x2 = {1'b0,Bu} ^ Bl;
    KA117 ka1172(T2,x1,x2);
    
    assign x3 = T0 ^ {2'b0,T1};
    assign x4 = x3 ^ T2;
    
    assign x5 = {115'b0,x4,117'b0};
//    assign x5 = x5 << 117;
    assign x6 = {1'b0,T1,233'b0};
//    assign x6 = x6 << 233;
    assign x7 = {232'b0,T0};
    assign O = x6 ^ x5 ^ x7;
    
end

endmodule
