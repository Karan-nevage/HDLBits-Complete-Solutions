/*==========================================================================================
 * HDLBits Problem : Dual-edge triggered flip-flop
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Dualedge
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a flip-flop that captures d on BOTH the rising and the falling edge
 *   of clk. FPGAs have no dual-edge flip-flop, so build it from one posedge
 *   flip-flop and one negedge flip-flop and combine them.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input d,
 *       output q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input d,
    output q
);

    reg p, n;

    always @(posedge clk) p <= d ^ n;
    always @(negedge clk) n <= d ^ p;

    assign q = p ^ n;

endmodule
//==========================================================================================
