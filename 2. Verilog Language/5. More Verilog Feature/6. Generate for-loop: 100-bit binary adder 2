module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign {cout,sum} = a + b+ cin; 
        
endmodule

//================================================================

module top_module( 
    input  [99:0] a, b,
    input         cin,
    output [99:0] cout,
    output [99:0] sum
);

    wire [99:0] carry;
    genvar i;

    generate
        for (i = 0; i < 100; i = i + 1) begin : adder_chain
            if (i == 0) begin
                full_adder fa (.a(a[i]),
                               .b(b[i]),
                               .cin(cin),
                               .sum(sum[i]),
                               .cout(carry[i]) );
            end 
            else begin
                full_adder fa (.a(a[i]),
                               .b(b[i]),
                               .cin(carry[i-1]),
                               .sum(sum[i]),
                               .cout(carry[i]) );
            end
            assign cout[i] = carry[i];
        end
    endgenerate

endmodule
