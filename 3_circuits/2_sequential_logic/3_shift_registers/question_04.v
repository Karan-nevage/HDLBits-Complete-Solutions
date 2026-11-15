/*==========================================================================================
 * HDLBits Problem : 5-bit LFSR
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Lfsr5
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a 5-bit Galois LFSR with XOR taps at bit positions 5 and 3 (counting
 *   from 1). A synchronous active-high reset sets the state to 5'h1. The feedback
 *   is the LSB (q[0]), shifted toward the MSB.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       output reg [4:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    output reg [4:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 5'h1;
        else begin
            q[4] <= q[0];           // feedback into bit 5
            q[3] <= q[4];
            q[2] <= q[3] ^ q[0];    // tap at bit 3
            q[1] <= q[2];
            q[0] <= q[1];
        end
    end

endmodule
//==========================================================================================
