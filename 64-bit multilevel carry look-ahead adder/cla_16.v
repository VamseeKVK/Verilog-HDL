//`include "cla_4.v"

module cla_16(a, b, cin, sum, cout, gout, pout);

    input [15:0] a, b;
    input cin;

    output [15:0] sum;
    output cout;
    output gout, pout;
    
    wire [2:0] c;
    wire [3:0] g, p;

    cla_4 ins1(a[3:0], b[3:0], cin, sum[3:0], c[0], g[0], p[0]);
    cla_4 ins2(a[7:4], b[7:4], c[0], sum[7:4], c[1], g[1], p[1]);
    cla_4 ins3(a[11:8], b[11:8], c[1], sum[11:8], c[2], g[2], p[2]);
    cla_4 ins4(a[15:12], b[15:12], c[2], sum[15:12], cout, g[3], p[3]);

    assign  gout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    assign  pout = p[3] & p[2] & p[1] & p[0]; 

    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin); 

    

endmodule