/*==========================================================================================
 * HDLBits Problem : DFFs and gates
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q4
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the sequential circuit shown in the exam diagram, built from three
 *   D flip-flops and gates. The three flip-flops have inputs (in XOR Q1),
 *   (in AND ~Q2) and (in OR ~Q3), and z is asserted when all three are 0.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input x,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input x,
    output z
);

    reg q1, q2, q3;

    always @(posedge clk) begin
        q1 <= x ^ q1;
        q2 <= x & ~q2;
        q3 <= x | ~q3;
    end

    assign z = ~(q1 | q2 | q3);

endmodule
//==========================================================================================
