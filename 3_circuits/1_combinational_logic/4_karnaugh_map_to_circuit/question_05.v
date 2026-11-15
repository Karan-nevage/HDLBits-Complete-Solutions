/*==========================================================================================
 * HDLBits Problem : Minimum SOP and POS
 * Category        : Circuits -> Combinational Logic -> Karnaugh Map to Circuit
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q2
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   A 4-variable function (a, b, c, d) with don't-cares is given as a
 *   Karnaugh map. Produce two outputs:
 *     out_sop = the minimum sum-of-products (SOP) form, and
 *     out_pos = the minimum product-of-sums (POS) form.
 *   Both implement the same function; the don't-cares may be chosen
 *   differently for each to minimize the logic.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  a,
 *       input  b,
 *       input  c,
 *       input  d,
 *       output out_sop,
 *       output out_pos
 *   );
 */
//==========================================================================================
module top_module (
    input  a,
    input  b,
    input  c,
    input  d,
    output out_sop,
    output out_pos
);

    assign out_sop = (c & d) | (~a & ~b & c);
    assign out_pos = c & (~a | ~c | d) & (a | ~b | ~c | d);

endmodule
//==========================================================================================
