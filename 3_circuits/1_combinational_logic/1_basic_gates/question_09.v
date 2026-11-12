/*==========================================================================================
 * HDLBits Problem : Two-bit equality
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Mt2015_eq2
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a circuit with two 2-bit inputs A and B.
 *   Output z = 1 when A equals B, otherwise z = 0.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [1:0] A,
 *       input  [1:0] B,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input  [1:0] A,
    input  [1:0] B,
    output z
);

    assign z = (A == B);

endmodule
//==========================================================================================
