module top_module(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    wire cout_lo;
    wire [15:0] sel_a, sel_b;

    // Lower 16-bit adder
    add16 inst1 (
        .a    (a[15:0]),
        .b    (b[15:0]),
        .cin  (1'b0),
        .sum  (sum[15:0]),
        .cout (cout_lo)
    );

    // Upper 16-bit adder with cin = 0
    add16 inst2 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (1'b0),
        .sum  (sel_a),
        .cout ()
    );

    // Upper 16-bit adder with cin = 1
    add16 inst3 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (1'b1),
        .sum  (sel_b),
        .cout ()
    );

    // Select correct upper sum based on cout_lo
    assign sum[31:16] = (cout_lo == 1'b0) ? sel_a : sel_b;

endmodule
