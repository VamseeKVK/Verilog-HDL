`timescale 1ns / 1ps


module sub_tb();
reg[63:0] a;
reg[63:0] b;
reg mode;
reg clk;
wire[63:0] sum;
wire carry;

fast_adder_ques1 dut(.a(a), .b(b),.clk(clk), .sum(sum), .carry(carry), .mode(mode));

initial begin
 $monitor("Time =%d,  a=%b, b=%b, sum=%b, carry=%b",$time,a,b,sum,carry);
 end
 
initial begin
clk=0;
end

  always #5 clk = ~clk;
  
  initial begin
   mode = 0;
   //c_in = m;
   //c_in = 1;
   a = 64'hfff;
   b = 64'hffff;
  end

    initial begin
    #100
    $finish;
    end


endmodule