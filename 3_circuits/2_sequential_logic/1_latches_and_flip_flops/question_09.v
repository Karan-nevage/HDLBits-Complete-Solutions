/*==========================================================================================
 * HDLBits Problem : DFF (sync reset)
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4c
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the circuit shown in the exam diagram: a D flip-flop with a
 *   synchronous reset input that clears q to 0.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input d,
 *       input r,   // synchronous reset
 *       output reg q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input d,
    input r,   // synchronous reset
    output reg q
);

    always @(posedge clk) begin
        if (r)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule
//==========================================================================================
