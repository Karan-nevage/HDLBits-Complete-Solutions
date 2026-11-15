/*==========================================================================================
 * HDLBits Problem : Shift register
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4k
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the 4-bit shift register shown in the exam diagram. resetn is a
 *   synchronous active-low reset (clears the register to 0); the register shifts
 *   in 'in' at the MSB and shifts 'out' from the LSB.
 *
 *   NOTE: stage count / direction come from the figure; this is the standard
 *         4-stage interpretation - confirm on HDLBits.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input resetn,
 *       input in,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input resetn,
    input in,
    output out
);

    reg [3:0] sr;

    always @(posedge clk) begin
        if (!resetn)
            sr <= 4'b0;
        else
            sr <= {in, sr[3:1]};   // shift right, 'in' at the MSB
    end

    assign out = sr[0];

endmodule
//==========================================================================================
