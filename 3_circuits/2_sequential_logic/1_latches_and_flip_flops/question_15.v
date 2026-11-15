/*==========================================================================================
 * HDLBits Problem : Detect an edge
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Edgedetect
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   For each bit of an 8-bit input, detect a rising edge: when a bit was 0 in
 *   the previous cycle and 1 in the current cycle, set the matching pedge bit
 *   in the following cycle.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input [7:0] in,
 *       output reg [7:0] pedge
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

    reg [7:0] in_last;

    always @(posedge clk) begin
        in_last <= in;
        pedge   <= in & ~in_last;   // 0 -> 1 transition on each bit
    end

endmodule
//==========================================================================================
