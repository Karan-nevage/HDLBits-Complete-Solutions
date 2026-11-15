/*==========================================================================================
 * HDLBits Problem : Karnaugh map #2
 * Category        : Circuits -> Combinational Logic -> Karnaugh Map to Circuit
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2012_q1g
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the 4-variable function f described by the Karnaugh map on
 *   the exam page. The inputs are packed into the vector x[4:1].
 *             x1x2  00    01    11    10
 *     x3x4      +-----+-----+-----+-----+
 *       00      |  1  |  0  |  0  |  1  |
 *               +-----+-----+-----+-----+
 *       01      |  0  |  0  |  0  |  0  |
 *               +-----+-----+-----+-----+
 *       11      |  1  |  1  |  1  |  0  |
 *               +-----+-----+-----+-----+
 *       10      |  1  |  1  |  0  |  1  |
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

    assign f = (x[2] & x[3] & x[4]) | (x[3] & ~(x[1])) | (~(x[2]) & ~(x[4]));

endmodule
//==========================================================================================
