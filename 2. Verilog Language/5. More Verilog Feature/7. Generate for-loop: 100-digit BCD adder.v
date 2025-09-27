module top_module( 
    input  [399:0] a, b,
    input          cin,
    output         cout,
    output [399:0] sum
);

    wire [99:0] carry;
    genvar i;

    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_chain
            if (i == 0) begin
                bcd_fadd adder (.a   (a[3:0]),
                    			.b   (b[3:0]),
                    			.cin (cin),
                    			.sum (sum[3:0]),
                    			.cout(carry[0])
                );
            end 
            else begin
                bcd_fadd adder (.a   (a[i*4 +: 4]),
                    			.b   (b[i*4 +: 4]),
                    			.cin (carry[i-1]),
                    			.sum (sum[i*4 +: 4]),
                    			.cout(carry[i])
                );
            end
       end
    endgenerate

    assign cout = carry[99];

endmodule
