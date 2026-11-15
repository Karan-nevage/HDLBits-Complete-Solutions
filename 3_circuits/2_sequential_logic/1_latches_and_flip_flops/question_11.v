/*==========================================================================================
 * HDLBits Problem : Mux and DFF
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Mt2015_muxdff
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the circuit (one stage of a shift register / LUT) shown in Midterm
 *   2015: a 2-to-1 mux selected by L choosing between q_in and r_in, feeding a
 *   D flip-flop whose output is Q.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input L,
 *       input r_in,
 *       input q_in,
 *       output reg Q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q
);

    always @(posedge clk)
        Q <= L ? r_in : q_in;

endmodule
//==========================================================================================
