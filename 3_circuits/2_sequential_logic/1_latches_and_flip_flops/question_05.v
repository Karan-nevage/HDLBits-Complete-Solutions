/*==========================================================================================
 * HDLBits Problem : DFF with asynchronous reset
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Dff8ar
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create 8 D flip-flops with an active-high ASYNCHRONOUS reset.
 *   Triggered by the rising edge of clk; areset clears the outputs immediately.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input areset,
 *       input [7:0] d,
 *       output reg [7:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input areset,
    input [7:0] d,
    output reg [7:0] q
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            q <= 8'h00;
        else
            q <= d;
    end

endmodule
//==========================================================================================
