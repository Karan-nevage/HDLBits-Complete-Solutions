/*==========================================================================================
 * HDLBits Problem : Mux (2-to-1, 8-bit)
 * Category        : Verification: Reading Simulations -> Finding Bugs in Code
 * Link            : https://hdlbits.01xz.net/wiki/Bugs_mux2
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   This 8-bit wide 2-to-1 multiplexer does not work. Find and fix the bug(s).
 *   out should be a when sel=0 and b when sel=1.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input sel,
 *       input [7:0] a,
 *       input [7:0] b,
 *       output [7:0] out  );
 */
//==========================================================================================
module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );

    assign out = sel ? a : b;

endmodule
//==========================================================================================
