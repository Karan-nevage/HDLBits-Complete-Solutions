/*==========================================================================================
 * HDLBits Problem : Decade counter again
 * Category        : Circuits -> Sequential Logic -> Counters
 * Link            : https://hdlbits.01xz.net/wiki/Count1to10
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a decade counter that counts 1 through 10 inclusive. A synchronous
 *   active-high reset sets the counter to 1.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       output reg [3:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset || q == 4'd10)
            q <= 4'd1;
        else
            q <= q + 4'd1;
    end

endmodule
//==========================================================================================
