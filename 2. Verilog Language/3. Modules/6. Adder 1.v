module top_module(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_lo, sum_hi;
    wire carry_lo, carry_hi;

    // Lower 16 bits addition
    add16 u0 (
        .a    (a[15:0]),
        .b    (b[15:0]),
        .cin  (1'b0),
        .sum  (sum_lo),
        .cout (carry_lo)
    );

    // Upper 16 bits addition with carry from lower adder
    add16 u1 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (carry_lo),
        .sum  (sum_hi),
        .cout (carry_hi) // ignored
    );

    assign sum = {sum_hi, sum_lo};

endmodule
