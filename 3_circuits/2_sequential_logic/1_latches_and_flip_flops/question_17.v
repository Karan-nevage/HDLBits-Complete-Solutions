/*==========================================================================================
 * HDLBits Problem : Edge capture register
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Edgecapture
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   For each of 32 bits, capture when the input changes from 1 to 0. The out
 *   bit stays 1 until reset. A synchronous reset (active high) clears out.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input [31:0] in,
 *       output reg [31:0] out
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

    reg [31:0] in_last;

    always @(posedge clk) begin
        in_last <= in;
        if (reset)
            out <= 32'b0;
        else
            out <= out | (in_last & ~in);   // capture 1 -> 0, hold until reset
    end

endmodule
//==========================================================================================
