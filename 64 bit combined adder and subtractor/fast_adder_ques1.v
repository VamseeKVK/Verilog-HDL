`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 14:14:41
// Design Name: 
// Module Name: fast_adder_ques1
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


module fast_adder_ques1(a,b,clk,sum,carry, mode);

parameter W=64;
input [W-1:0] a,b;
input mode;
input clk;
output reg [W-1:0] sum;
output reg carry;

reg [W-1:0] a_reg,b_reg;
wire [W-1:0] sum_wire;
wire cout_wire;


always@(posedge clk)
begin
a_reg<=a;
if(mode == 1'b1) b_reg <= ~b;
else b_reg <= b;
sum<=sum_wire;
carry<=cout_wire;
end

 carry_chain_sum_old dut(a_reg,b_reg,mode,sum_wire,cout_wire);

//assign {cout_wire,sum_wire}=a_reg+b_reg;
endmodule
