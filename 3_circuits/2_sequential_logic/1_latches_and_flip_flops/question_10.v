/*==========================================================================================
 * HDLBits Problem : DFF+gate
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4d
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the circuit shown in the exam diagram: a D flip-flop whose input
 *   is the XOR of in and the flip-flop's own output q.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input in,
 *       output reg out
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input in,
    output reg out
);

    // The flip-flop's D input is (in XOR out).
    always @(posedge clk)
        out <= in ^ out;

endmodule
//==========================================================================================
