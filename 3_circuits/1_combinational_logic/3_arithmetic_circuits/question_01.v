/*==========================================================================================
 * HDLBits Problem : Half adder
 * Category        : Circuits -> Combinational Logic -> Arithmetic Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Hadd
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create a half adder: add two bits (a, b) and produce a sum bit and a
 *   carry-out bit.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  a, b,
 *       output cout, sum
 *   );
 */
//==========================================================================================
module top_module (
    input  a, b,
    output cout, sum
);

    assign sum  = a ^ b; // Sum is the XOR of inputs a and b
    assign cout = a & b; // Carry-out is the AND of inputs a and b

endmodule
//==========================================================================================
