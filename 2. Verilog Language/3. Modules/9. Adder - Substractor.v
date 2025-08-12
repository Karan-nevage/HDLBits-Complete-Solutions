module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire cout_up, cout_ign;
    wire [31:0] xor_out;

    assign xor_out = b ^ {32{sub}};  // Conditional inversion using replication

    add16 inst1 (
        .a(a[15:0]),
        .b(xor_out[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(cout_up)
    );

    add16 inst2 (
        .a(a[31:16]),
        .b(xor_out[31:16]),
        .cin(cout_up),
        .sum(sum[31:16]),
        .cout(cout_ign)
    );

endmodule
