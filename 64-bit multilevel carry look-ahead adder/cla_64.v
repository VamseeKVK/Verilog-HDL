//`include "cla_16.v"

module cla_64(a, b, cin, sum, cout);

    input [63:0] a, b;
    input cin;

    output [63:0] sum;
    output cout;
    
    wire [2:0] c;
    wire [3:0] g, p;

    cla_16 ins1(a[15:0], b[15:0], cin, sum[15:0], c[0], g[0], p[0]);
    cla_16 ins2(a[31:16], b[31:16], c[0], sum[31:16], c[1], g[1], p[1]);
    cla_16 ins3(a[47:32], b[47:32], c[1], sum[47:32], c[2], g[2], p[2]);
    cla_16 ins4(a[63:48], b[63:48], c[2], sum[63:48], cout, g[3], p[3]);

    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    
endmodule