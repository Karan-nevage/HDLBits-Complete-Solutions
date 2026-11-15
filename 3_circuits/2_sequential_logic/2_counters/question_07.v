/*==========================================================================================
 * HDLBits Problem : 4-digit decimal counter
 * Category        : Circuits -> Sequential Logic -> Counters
 * Link            : https://hdlbits.01xz.net/wiki/Countbcd
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a 4-digit BCD counter (0000 to 9999). q[3:0] is the ones digit, up
 *   to q[15:12] the thousands. ena[1], ena[2], ena[3] indicate when each of
 *   the upper three digits should be incremented. Synchronous active-high
 *   reset clears all digits.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       output [3:1] ena,
 *       output reg [15:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output reg [15:0] q
);

    // Enables cascade: a digit rolls over only when all lower digits are 9
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[3:0] == 4'd9) & (q[7:4] == 4'd9);
    assign ena[3] = (q[3:0] == 4'd9) & (q[7:4] == 4'd9) & (q[11:8] == 4'd9);

    always @(posedge clk) begin
        if (reset)
            q <= 16'd0;
        else begin
            q[3:0]             <= (q[3:0]   == 4'd9) ? 4'd0 : q[3:0]   + 4'd1;
            if (ena[1]) q[7:4]   <= (q[7:4]   == 4'd9) ? 4'd0 : q[7:4]   + 4'd1;
            if (ena[2]) q[11:8]  <= (q[11:8]  == 4'd9) ? 4'd0 : q[11:8]  + 4'd1;
            if (ena[3]) q[15:12] <= (q[15:12] == 4'd9) ? 4'd0 : q[15:12] + 4'd1;
        end
    end

endmodule
//==========================================================================================
