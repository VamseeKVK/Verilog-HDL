`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2023 07:06:29 PM
// Design Name: 
// Module Name: KA116
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module KA116(O,A,B);

parameter N = 116;
parameter C = 58;
parameter F = 57;

input [115:0] A,B;

wire [57:0] Au,Bu;
wire [57:0] Al,Bl;

wire [114:0] T0,T2;
wire [114:0] T1;

wire [57:0] x1,x2;
wire [114:0] x3,x4;
wire [230:0] x5,x6,x7;

output wire [230:0] O;

begin  

    assign Au = A[N-1 : C];
    assign Al = A[F : 0]; 
    assign Bu = B[N-1 : C];
    assign Bl = B[F : 0];
    
    KA58 ka580(T1,Au,Bu);
    KA58 ka581(T0,Al,Bl);
    
    assign x1 = Au ^ Al;
    assign x2 = Bu ^ Bl;
    
    KA58 ka582(T2,x1,x2);
  
    assign x3 = T0 ^ T1;
    assign x4 = x3 ^ T2;
    
    assign x5 = {58'b0,x4,58'b0};
//    assign x5 = x5 << 58;
    assign x6 = {T1,116'b0};
//    assign x6 = x6 << 116;
    assign x7 = {116'b0,T0};
    assign O = x6 ^ x5 ^ x7;
    
end
endmodule
