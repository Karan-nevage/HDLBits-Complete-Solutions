/*==========================================================================================
 * HDLBits Problem : Detect both edges
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Edgedetect2
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   For each bit of an 8-bit input, detect ANY change (0->1 or 1->0) between
 *   the previous and current cycle, and set the matching anyedge bit in the
 *   following cycle.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input [7:0] in,
 *       output reg [7:0] anyedge
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    reg [7:0] in_last;

    always @(posedge clk) begin
        in_last <= in;
        anyedge <= in ^ in_last;    // any change on each bit
    end

endmodule
//==========================================================================================
