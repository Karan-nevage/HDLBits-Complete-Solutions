/*==========================================================================================
 * HDLBits Problem : 32-bit LFSR
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Lfsr32
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a 32-bit Galois LFSR with XOR taps at bit positions 32, 22, 2 and 1.
 *   A synchronous active-high reset sets the state to 32'h1. The feedback is the
 *   LSB (q[0]), shifted toward the MSB.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       output reg [31:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    output reg [31:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 32'h1;
        else begin
            q[31]    <= q[0];            // feedback into bit 32
            q[30:22] <= q[31:23];
            q[21]    <= q[22] ^ q[0];    // tap at bit 22
            q[20:2]  <= q[21:3];
            q[1]     <= q[2] ^ q[0];     // tap at bit 2
            q[0]     <= q[1] ^ q[0];     // tap at bit 1
        end
    end

endmodule
//==========================================================================================
