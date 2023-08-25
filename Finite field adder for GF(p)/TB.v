`timescale 1ns / 1ps
//`include "FFA_09.v"  uncomment if u want to execute in iverilog 

module tb();

//a, b, sum, clk

    reg [255:0] a, b;
    reg reset;
    wire [255:0] sum;
    reg clk;

    FFA ins1(a,b,sum,clk, reset);
       
    initial begin
        clk =1'b0;
    end
    
    always #5 clk = ~clk;

    initial begin

        $dumpfile("output.vcd");
        $dumpvars(0,tb);
        
        // a = {{64{1'b1}}};
         //b = {{64{1'b1}}};

        // a = {{64{1'b0}}, {{4'hf}, {60{1'b0}}}, {64{1'b0}}, {{4'hf}, {60{1'b0}}}};
         //b = {{64{1'b0}}, {{4'hf}, {60{1'b0}}}, {64{1'b0}}, {{4'hf}, {60{1'b0}}}};

         //a = {{256{1'b1}}};
         //b = {{256{1'b1}}};

         //a = {{255{1'b1}}, {1'b0}};
         //b = {{256'b1}}; 

         //a = 256'd1;
         //b = 256'd2;

         a = {{64'd1}, {64'd2}, {64'd3}, {64'd4}};
         b = {{64'd1}, {64'd2}, {64'd3}, {64'd4}};

        
//         a = {{64{1'd1}}, {64'd2}, {64'd3}, {64'd4}};
//         b = {{64{1'd1}}, {64'd2}, {64'd3}, {64'd4}};
        reset = 1'b1;

        #10 reset = 1'b0;
       #1000 $finish;
    end
endmodule