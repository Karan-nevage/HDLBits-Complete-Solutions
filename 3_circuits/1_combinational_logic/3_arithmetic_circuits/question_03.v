/*==========================================================================================
 * HDLBits Problem : 3-bit binary adder
 * Category        : Circuits -> Combinational Logic -> Arithmetic Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Adder3
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Instantiate three full adders to create a 3-bit binary ripple-carry
 *   adder. Add a[2:0] + b[2:0] + cin, and also expose the carry-out of
 *   each full adder on cout[2:0].
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [2:0] a, b,
 *       input  cin,
 *       output [2:0] cout,
 *       output [2:0] sum
 *   );
 */
//==========================================================================================
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    // Instantiate 3 full adders for the 3-bit ripple-carry adder
    fadd fa0 (
        .a   (a[0]), 
        .b   (b[0]), 
        .cin (cin), 
        .cout(cout[0]), 
        .sum (sum[0])
    );

    fadd fa1 (
        .a   (a[1]), 
        .b   (b[1]), 
        .cin (cout[0]), 
        .cout(cout[1]), 
        .sum (sum[1])
    );

    fadd fa2 (
        .a   (a[2]), 
        .b   (b[2]), 
        .cin (cout[1]), 
        .cout(cout[2]), 
        .sum (sum[2])
    );

endmodule

//==========================>> Full adder submodule <<======================================
module fadd (
    input a,
    input b,
    input cin,
    output cout,
    output sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
//==========================================================================================
