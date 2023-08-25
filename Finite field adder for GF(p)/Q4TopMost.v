`timescale 1ns / 1ps
//`include "fast_adder_ques1.v"

module FFA(a, b, sum, clk, reset);
    
    input [255:0] a, b;
    input clk, reset;
    
    output reg [255:0] sum;

    reg [255:0] P;

    reg [255:0] afeeder, bfeeder;
    reg carryin, borrowin;

    reg [255:0] dummysum, dummydiff;

    wire [63:0] sout, dout;
    wire carryout, borrowout;

    reg [3:0] counter;
    reg done;
    
    // fast_adder_ques1(a,b,c_in,clk,sum,carry,mode);
    //a,b,c_in,sum,c_out
    carry_chain_sum_old adder(afeeder[63:0], bfeeder[63:0], carryin, sout, carryout);
    carry_chain_diff_old suber(dummysum[255:192], P[63:0], borrowin, dout, borrowout);

    always @(posedge clk) begin

        if(counter >= 1'b1) P = {P[63:0], P[255:64]};

        else P = P;
        if(reset == 1'b1) begin
            afeeder = a;
            bfeeder = b;
            
            carryin = 1'b0;
            borrowin = 1'b1;

            counter = 4'b0;
            done = 1'b0;

            P = {{1'b0}, {250{1'b1}}, {5'b01101}};
//             P = {{{64'd1}}, {64'd2}, {64'd3}, {64'd4}};
        end

        else begin
            
            if(counter < 3'b100) begin
                afeeder = {afeeder[63:0], afeeder[255:64]};
                bfeeder = {bfeeder[63:0], bfeeder[255:64]};

                dummysum[63:0] = sout;
                dummysum = {dummysum[63:0], dummysum[255:64]};

                dummydiff[63:0] = dout;
                dummydiff = {dummydiff[63:0], dummydiff[255:64]};

                carryin = carryout;
                
                if(counter > 1'b1) begin
                    borrowin = borrowout;
                end

                else begin
                    borrowin = borrowin;
                end

                counter = counter + 1;
            end

            else if(counter <= 3'b100) begin
                dummydiff[63:0] = dout;
                dummydiff = {dummydiff[63:0], dummydiff[255:64]};
                done = 1'b1;

                borrowin = borrowout;
                if(borrowin == 1'b1) sum = dummydiff;
                else sum = dummysum;

                counter = counter + 1;
            end

            else sum = sum;
            
        end
    end

   
endmodule