`timescale 1ns/100ps
//`include "cla_64.v"

module tb;

    reg [63:0] a;
    reg [63:0] b;
    reg cin;

    wire [63:0] sum;
    wire cout;

    // cla_16(a, b, cin, sum, cout , clk, gout, pout);
    cla_64 inits (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin

        $dumpfile("output.vcd");
        $dumpvars(0,tb);
        
        a = 64'hffffffffffffffff;
        b = 64'hffffffffffffffff;
        cin = 1'b0;

        #100 $finish;
    end

endmodule