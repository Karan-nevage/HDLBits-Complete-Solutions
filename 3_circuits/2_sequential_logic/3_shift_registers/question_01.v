/*==========================================================================================
 * HDLBits Problem : 4-bit shift register
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Shift4
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a 4-bit shift register with asynchronous reset, synchronous load and
 *   enable. areset clears q; load parallel-loads data; ena shifts the register
 *   right by one position (a 0 is shifted into the MSB). load has priority over
 *   ena.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input areset,
 *       input load,
 *       input ena,
 *       input [3:0] data,
 *       output reg [3:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input areset,
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            q <= 4'b0;
        else if (load)
            q <= data;
        else if (ena)
            q <= {1'b0, q[3:1]};   // shift right, 0 into the MSB
    end

endmodule
//==========================================================================================
