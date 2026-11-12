/*==========================================================================================
 * HDLBits Problem : Truth tables
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Truthtable1
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the combinational function f of three inputs (x1, x2, x3)
 *   described by the truth table given on the problem page.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  x3,
 *       input  x2,
 *       input  x1,
 *       output f
 *   );
 */
//==========================================================================================
module top_module (
    input  x3,
    input  x2,
    input  x1,
    output f
);

    assign f = (~x3 & x2 & ~x1) | (~x3 & x2 & x1) | (x3 & ~x2 & x1) | (x3 & x2 & x1);

endmodule
//==========================================================================================
