/*==========================================================================================
 * HDLBits Problem : DFF (async reset)
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4b
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the circuit shown in the exam diagram: a D flip-flop with an
 *   asynchronous reset input that clears q to 0.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input d,
 *       input ar,   // asynchronous reset
 *       output reg q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input d,
    input ar,   // asynchronous reset
    output reg q
);

    always @(posedge clk or posedge ar) begin
        if (ar)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule
//==========================================================================================
