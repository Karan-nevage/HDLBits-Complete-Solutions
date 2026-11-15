/*==========================================================================================
 * HDLBits Problem : Left/right rotator
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Rotate100
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a 100-bit left/right rotator with synchronous load. load parallel-
 *   loads data. ena[1:0] selects: 2'b01 rotate right by 1, 2'b10 rotate left by
 *   1, else hold. Rotation wraps bits around rather than shifting in zeros.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input load,
 *       input [1:0] ena,
 *       input [99:0] data,
 *       output reg [99:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q
);

    always @(posedge clk) begin
        if (load)
            q <= data;
        else case (ena)
            2'b01: q <= {q[0], q[99:1]};    // rotate right
            2'b10: q <= {q[98:0], q[99]};   // rotate left
            default: q <= q;                // hold
        endcase
    end

endmodule
//==========================================================================================
