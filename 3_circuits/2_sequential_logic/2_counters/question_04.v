/*==========================================================================================
 * HDLBits Problem : Slow decade counter
 * Category        : Circuits -> Sequential Logic -> Counters
 * Link            : https://hdlbits.01xz.net/wiki/Countslow
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a decade counter (0 to 9) that only advances when slowena is high,
 *   so it can be slowed down. Synchronous active-high reset sets it to 0.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input slowena,
 *       input reset,
 *       output reg [3:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input slowena,
    input reset,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 4'd0;
        else if (slowena) begin
            if (q == 4'd9)
                q <= 4'd0;
            else
                q <= q + 4'd1;
        end
    end

endmodule
//==========================================================================================
