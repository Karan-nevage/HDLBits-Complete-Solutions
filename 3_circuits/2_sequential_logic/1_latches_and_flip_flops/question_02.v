/*==========================================================================================
 * HDLBits Problem : D flip-flops
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Dff8
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create 8 D flip-flops. All share one clock; trigger on the rising edge.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input [7:0] d,
 *       output reg [7:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk)
        q <= d;

endmodule
//==========================================================================================
