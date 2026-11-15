/*==========================================================================================
 * HDLBits Problem : DFF with reset
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Dff8r
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create 8 D flip-flops with an active-high synchronous reset.
 *   All triggered by the rising edge of clk; reset forces the outputs to 0.
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

    always @(posedge clk) begin
        if (reset)
            q <= 8'h00;
        else
            q <= d;
    end

endmodule
//==========================================================================================
