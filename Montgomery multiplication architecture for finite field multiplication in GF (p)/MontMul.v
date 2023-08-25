module MontMul(a, b, P, clk, reset, sum, done);

    input [254:0] a, b, P;
    input clk, reset;

    output [254:0] sum;
    output reg done;

    reg [254:0] u;

    reg [8:0] sig;

    reg [254:0] dummyA;

    wire [254:0] aCopied;
    wire [254:0] abMult;
    wire [254:0] level1Wire;

    wire [254:0] u0Copied;
    wire [254:0] uPMult;
    wire [254:0] level2Wire;

    wire [254:0] level3Wire;    

    assign aCopied = {255{dummyA[0]}};
    assign abMult = aCopied & b;
    assign level1Wire = u + abMult;

    assign u0Copied = {255{level1Wire[0]}};
    assign uPMult = u0Copied & P;
    assign level2Wire = level1Wire + uPMult;

    assign level3Wire = level2Wire >> 1;

    assign sum = (u < P) ? u : (u - P);

    always @(posedge clk) begin

        if(reset == 1'b1) begin
            sig = 9'd0;
            dummyA = a;
            done = 1'b0;
            u = 255'd0;
        end

        else begin
            if(sig != 9'hff) begin
                dummyA = dummyA >> 1;
                u = level3Wire;
                sig = sig + 1'b1;
            end

            else begin
                done = 1'b1;
            end
        end

    end

endmodule