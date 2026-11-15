/*==========================================================================================
 * HDLBits Problem : Rule 110
 * Category        : Circuits -> Sequential Logic -> More Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Rule110
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Simulate the 1-D cellular automaton Rule 110 on 512 cells. With left = q[i+1],
 *   centre = q[i], right = q[i-1] (off-grid = 0), the next state follows the Rule
 *   110 table. load sets the initial state from data.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input load,
 *       input [511:0] data,
 *       output reg [511:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
);

    wire [511:0] left_n  = {1'b0, q[511:1]};   // neighbour at higher index
    wire [511:0] right_n = {q[510:0], 1'b0};   // neighbour at lower index

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            // Rule 110: next = (C & ~(L & R)) | (~C & R)
            q <= (q & ~(left_n & right_n)) | (~q & right_n);
    end

endmodule
//==========================================================================================
