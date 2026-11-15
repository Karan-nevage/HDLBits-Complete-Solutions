/*==========================================================================================
 * HDLBits Problem : D flip-flop
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Dff
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create a single D flip-flop that captures d on the rising edge of clk.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input d,
 *       output reg q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input d,
    output reg q
);

    always @(posedge clk)
        q <= d;

endmodule
//==========================================================================================
