//==============================< Top Module >=====================================

module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    wire carry_lo, carry_hi;

    // Lower 16-bit addition
    add16 inst1 (
        .a    (a[15:0]),
        .b    (b[15:0]),
        .cin  (1'b0),
        .sum  (sum[15:0]),
        .cout (carry_lo)
    );

    // Upper 16-bit addition with carry from lower adder
    add16 inst2 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (carry_lo),
        .sum  (sum[31:16]),
        .cout (carry_hi) // ignored
    );

endmodule

//==============================< Module add1 >=====================================

module add1 (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

