/*==========================================================================================
 * HDLBits Problem : Karnaugh map (3-variable)
 * Category        : Circuits -> Combinational Logic -> Karnaugh Map to Circuit
 * Link            : https://hdlbits.01xz.net/wiki/Kmap1
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the combinational circuit described by the 3-variable
 *   Karnaugh map shown on the problem page (inputs a, b, c -> out).
 *
 *         a   0     1
 *     bc  +-----+-----+
 *     00  |  0  |  1  |
 *         +-----+-----+
 *     01  |  1  |  1  |
 *         +-----+-----+
 *     11  |  1  |  1  |
 *         +-----+-----+
 *     10  |  1  |  1  |
 *         +-----+-----+
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  a,
 *       input  b,
 *       input  c,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input  a,
    input  b,
    input  c,
    output out
);

    assign out = (a | b |c);

endmodule
//==========================================================================================
