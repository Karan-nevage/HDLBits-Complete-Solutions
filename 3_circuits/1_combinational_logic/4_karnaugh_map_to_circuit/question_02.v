/*==========================================================================================
 * HDLBits Problem : Karnaugh map (4-variable) #1
 * Category        : Circuits -> Combinational Logic -> Karnaugh Map to Circuit
 * Link            : https://hdlbits.01xz.net/wiki/Kmap2
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the combinational circuit described by the 4-variable
 *   Karnaugh map shown on the problem page (inputs a, b, c, d -> out).
 *    
 *        ab  00    01    11    10
 *      cd  +-----+-----+-----+-----+
 *      00  |  1  |  1  |  0  |  1  |
 *          +-----+-----+-----+-----+
 *      01  |  1  |  0  |  0  |  1  |
 *          +-----+-----+-----+-----+
 *      11  |  0  |  1  |  1  |  1  |
 *          +-----+-----+-----+-----+
 *      10  |  1  |  1  |  0  |  0  |
 *          +-----+-----+-----+-----+
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

    assign out = (~b & ~c) | (~a & ~d) | (b & c & d) | (a & c & d);

endmodule
//==========================================================================================
