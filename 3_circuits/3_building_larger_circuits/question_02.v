/*==========================================================================================
 * HDLBits Problem : 4-bit shift register and down counter
 * Category        : Circuits -> Building Larger Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/review2015_shiftcount
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a four-bit shift register that also acts as a down counter.
 *   When shift_ena is 1, data is shifted in (most-significant-bit first).
 *   When count_ena is 1, the current number is decremented. The two enables
 *   are never asserted together, so that case does not matter.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input shift_ena,
 *       input count_ena,
 *       input data,
 *       output [3:0] q);
 */
//==========================================================================================
module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    always @(posedge clk) begin
        if (shift_ena)
            q <= {q[2:0], data};   // Shift left, bring data in at LSB
        else if (count_ena)
            q <= q - 1'b1;         // Decrement
    end

endmodule
//==========================================================================================
