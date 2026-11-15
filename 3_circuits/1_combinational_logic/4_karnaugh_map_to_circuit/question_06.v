/*==========================================================================================
 * HDLBits Problem : Karnaugh map #1
 * Category        : Circuits -> Combinational Logic -> Karnaugh Map to Circuit
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q3
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the 4-variable function f described by the Karnaugh map on
 *   the exam page. The inputs are packed into the vector x[4:1].
 *            x1x2  00    01    11    10
 *     x3x4      +-----+-----+-----+-----+
 *       00      |  d  |  0  |  d  |  d  |
 *               +-----+-----+-----+-----+
 *       01      |  0  |  d  |  1  |  0  |
 *               +-----+-----+-----+-----+
 *       11      |  1  |  1  |  d  |  d  |
 *               +-----+-----+-----+-----+
 *       10      |  1  |  1  |  0  |  d  |
 *               +-----+-----+-----+-----+
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [4:1] x,
 *       output f
 *   );
 */
//==========================================================================================
module top_module (
    input  [4:1] x,
    output f
);

    assign f = (~ x[1] & x[3] ) | (x[1] & x[2] & ~x[3]);

endmodule
//==========================================================================================
