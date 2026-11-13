/*==========================================================================================
 * HDLBits Problem : 4-digit BCD adder
 * Category        : Circuits -> Combinational Logic -> Arithmetic Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Bcdadd4
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   A BCD one-digit adder named bcd_fadd is provided:
 *     module bcd_fadd ( input [3:0] a, input [3:0] b, input cin,
 *                       output cout, output [3:0] sum );
 *   Instantiate four copies to build a 4-digit BCD ripple-carry adder.
 *   Add two 16-bit packed-BCD numbers a and b plus cin -> cout and a
 *   16-bit BCD sum.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [15:0] a, b,
 *       input  cin,
 *       output cout,
 *       output [15:0] sum
 *   );
 */
//==========================================================================================
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire c1, c2, c3;

    // Instantiate 4 BCD full adders, chaining the carry bits
    bcd_fadd bcd0 (
        .a   (a[3:0]), 
        .b   (b[3:0]), 
        .cin (cin), 
        .cout(c1), 
        .sum (sum[3:0])
    );
//=======================================
    bcd_fadd bcd1 (
        .a   (a[7:4]), 
        .b   (b[7:4]), 
        .cin (c1), 
        .cout(c2), 
        .sum (sum[7:4])
    );
//=======================================
    bcd_fadd bcd2 (
        .a   (a[11:8]), 
        .b   (b[11:8]), 
        .cin (c2), 
        .cout(c3), 
        .sum (sum[11:8])
    );
//=======================================
    bcd_fadd bcd3 (
        .a   (a[15:12]), 
        .b   (b[15:12]), 
        .cin (c3), 
        .cout(cout), 
        .sum (sum[15:12])
    );

endmodule
//==========================================================================================
