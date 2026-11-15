/*==========================================================================================
 * HDLBits Problem : Shift register
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2014_q4b
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a 4-bit shift register by instantiating four copies of the MUXDFF cell
 *   (reused from 'Mux and DFF', exams/2014_q4a) on a DE2 board. Mapping:
 *   SW = R (load data), KEY[0] = clk, KEY[1] = E (enable), KEY[2] = L (load),
 *   KEY[3] = w (serial in); LEDR[3:0] = the stage outputs.
 *
 *   NOTE: the chain order comes from the figure; this is the standard
 *         interpretation (w -> stage3 -> ... -> stage0) - confirm on HDLBits.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input [3:0] SW,
 *       input [3:0] KEY,
 *       output [3:0] LEDR
 *   );
 */
//==========================================================================================
module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);

    // MUXDFF ports: (clk, w, R, E, L, Q). Chain the serial input w through
    // stage 3 down to stage 0.
    MUXDFF m3 (KEY[0], KEY[3],  SW[3], KEY[1], KEY[2], LEDR[3]);
    MUXDFF m2 (KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    MUXDFF m1 (KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    MUXDFF m0 (KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);

endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q
);
    // L loads R; otherwise E selects serial-in w vs. hold Q
    always @(posedge clk)
        Q <= L ? R : (E ? w : Q);
endmodule
//==========================================================================================
