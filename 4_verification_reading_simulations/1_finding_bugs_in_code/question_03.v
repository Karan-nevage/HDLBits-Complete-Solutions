/*==========================================================================================
 * HDLBits Problem : Mux (4-to-1, 8-bit)
 * Category        : Verification: Reading Simulations -> Finding Bugs in Code
 * Link            : https://hdlbits.01xz.net/wiki/Bugs_mux4
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   This 4-to-1 8-bit multiplexer, built from three instances of a provided 2-to-1
 *   mux, does not work. Find and fix the bug(s).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input [1:0] sel,
 *       input [7:0] a,
 *       input [7:0] b,
 *       input [7:0] c,
 *       input [7:0] d,
 *       output [7:0] out  );
 *
 *   Provided by HDLBits (instantiate; do not redefine):
 *       module mux2 ( input sel, input [7:0] a, input [7:0] b, output [7:0] out );
 */
//==========================================================================================
module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  );

    wire [7:0] low, high;

    mux2 m_lo (sel[0], a, b, low);    // sel[0]=0->a, 1->b
    mux2 m_hi (sel[0], c, d, high);   // sel[0]=0->c, 1->d
    mux2 m_out (sel[1], low, high, out);

endmodule
//==========================================================================================
