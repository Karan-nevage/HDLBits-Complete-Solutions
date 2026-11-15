/*==========================================================================================
 * HDLBits Problem : Karnaugh map (4-variable) #2
 * Category        : Circuits -> Combinational Logic -> Karnaugh Map to Circuit
 * Link            : https://hdlbits.01xz.net/wiki/Kmap3
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the combinational circuit described by the 4-variable
 *   Karnaugh map shown on the problem page. This map contains don't-care
 *   entries (d / x) which you may assign to whatever minimizes the logic.
 *
 *      ab  01    00    10    11
 *    cd  +-----+-----+-----+-----+
 *    00  |  x  |  0  |  1  |  1  |
 *        +-----+-----+-----+-----+
 *    01  |  0  |  0  |  x  |  x  |
 *        +-----+-----+-----+-----+
 *    11  |  0  |  1  |  1  |  1  |
 *        +-----+-----+-----+-----+
 *    10  |  0  |  1  |  1  |  1  |
 *        +-----+-----+-----+-----+
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

    assign out = a | (c & ~b);

endmodule
//==========================================================================================
