/*==========================================================================================
 * HDLBits Problem : 100-bit binary adder
 * Category        : Circuits -> Combinational Logic -> Arithmetic Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Adder100
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create a 100-bit binary adder. Add a[99:0] + b[99:0] + cin, producing
 *   a 100-bit sum and a single carry-out cout.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [99:0] a, b,
 *       input  cin,
 *       output cout,
 *       output [99:0] sum
 *   );
 */
//==========================================================================================
module top_module (
    input  [99:0] a, b,
    input  cin,
    output cout,
    output [99:0] sum
);

    assign {cout, sum} = a + b + cin;

endmodule
//==========================================================================================
