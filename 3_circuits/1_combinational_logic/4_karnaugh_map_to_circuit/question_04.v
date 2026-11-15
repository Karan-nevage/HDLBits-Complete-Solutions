/*==========================================================================================
 * HDLBits Problem : Karnaugh map (4-variable) #3
 * Category        : Circuits -> Combinational Logic -> Karnaugh Map to Circuit
 * Link            : https://hdlbits.01xz.net/wiki/Kmap4
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the combinational circuit described by the 4-variable
 *   Karnaugh map shown on the problem page. Look for the simple pattern
 *   (this map reduces to a two-input XOR/XNOR style function).
 *        ab  00    01    11    10
 *     cd  +-----+-----+-----+-----+
 *     00  |  0  |  1  |  0  |  1  |
 *         +-----+-----+-----+-----+
 *     01  |  1  |  0  |  1  |  0  |
 *         +-----+-----+-----+-----+
 *     11  |  0  |  1  |  0  |  1  |
 *         +-----+-----+-----+-----+
 *     10  |  1  |  0  |  1  |  0  |
 *         +-----+-----+-----+-----+
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  a,
 *       input  b,
 *       input  c,
 *       input  d,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input  a,
    input  b,
    input  c,
    input  d,
    output out
);

    assign out = a ^ b ^ c ^ d;

endmodule
//==========================================================================================
