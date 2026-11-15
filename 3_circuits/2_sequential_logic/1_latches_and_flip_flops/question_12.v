/*==========================================================================================
 * HDLBits Problem : Mux and DFF
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2014_q4a
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the circuit shown in the exam diagram, built from muxes and a D
 *   flip-flop: L loads R, otherwise E selects between the shift-in value w and
 *   holding the current value Q.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input w, R, E, L,
 *       output reg Q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);

    always @(posedge clk)
        Q <= L ? R : (E ? w : Q);

endmodule
//==========================================================================================
