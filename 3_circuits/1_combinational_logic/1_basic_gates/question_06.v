/*==========================================================================================
 * HDLBits Problem : More logic gates
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Gates
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Given two inputs a and b, build all of the following gates at once:
 *     out_and   = a AND b
 *     out_or    = a OR b
 *     out_xor   = a XOR b
 *     out_nand  = a NAND b
 *     out_nor   = a NOR b
 *     out_xnor  = a XNOR b
 *     out_anotb = a AND (NOT b)
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  a,
 *       input  b,
 *       output out_and,
 *       output out_or,
 *       output out_xor,
 *       output out_nand,
 *       output out_nor,
 *       output out_xnor,
 *       output out_anotb
 *   );
 */
//==========================================================================================
module top_module (
    input  a,
    input  b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);

    assign out_and   = a & b;
    assign out_or    = a | b;
    assign out_xor   = a ^ b;
    assign out_nand  = ~(a & b);
    assign out_nor   = ~(a | b);
    assign out_xnor  = ~(a ^ b);
    assign out_anotb = a & ~b;

endmodule
//==========================================================================================
