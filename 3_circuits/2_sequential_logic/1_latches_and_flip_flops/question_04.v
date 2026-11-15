/*==========================================================================================
 * HDLBits Problem : DFF with reset value
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Dff8p
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create 8 D flip-flops triggered by the NEGATIVE (falling) edge of clk.
 *   An active-high synchronous reset sets the outputs to 0x34 instead of 0.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input [7:0] d,
 *       output reg [7:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output reg [7:0] q
);

    always @(negedge clk) begin
        if (reset)
            q <= 8'h34;
        else
            q <= d;
    end

endmodule
//==========================================================================================
