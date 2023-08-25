module cla_4(a, b, cin, sum, cout, gout, pout);

input wire [3:0] a;
input wire [3:0] b;
input wire cin;

output wire [3:0] sum;
output wire gout, pout;
output wire cout;

wire [3:0] p, g;
wire [2:0] c;

assign p = a ^ b;
assign g = a & b;

assign gout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
assign pout = p[3] & p[2] & p[1] & p[0];

assign c[0] = g[0] | (p[0] & cin);
assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

assign sum[0] = p[0] ^ cin;
assign sum[1] = p[1] ^ c[0];
assign sum[2] = p[2] ^ c[1];
assign sum[3] = p[3] ^ c[2];

endmodule