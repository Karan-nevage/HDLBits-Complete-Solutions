/*==========================================================================================
 * HDLBits Problem : DFF with byte enable
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Dff16e
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create 16 D flip-flops with a synchronous active-low reset (resetn) and
 *   byte-enable. byteena[1] enables the upper byte q[15:8] and byteena[0] the
 *   lower byte q[7:0]; a disabled byte keeps its old value.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input resetn,
 *       input [1:0] byteena,
 *       input [15:0] d,
 *       output reg [15:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);

    always @(posedge clk) begin
        if (!resetn)
            q <= 16'h0000;
        else begin
            if (byteena[0]) q[7:0]  <= d[7:0];
            if (byteena[1]) q[15:8] <= d[15:8];
        end
    end

endmodule
//==========================================================================================
