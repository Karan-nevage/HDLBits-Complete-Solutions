/*==========================================================================================
 * HDLBits Problem : 3-bit LFSR
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Mt2015_lfsr
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the 3-bit LFSR shown in the Midterm 2015 schematic on a DE1-SoC:
 *   SW = parallel-load value R, KEY[0] = clock, KEY[1] = L (load control), and
 *   LEDR shows the state Q. Each bit is a MUXDFF (Q <= L ? R : shift-value).
 *
 *   NOTE: the exact XOR tap comes from the figure (not in the page text). The
 *         solution below uses the standard accepted tap - confirm on HDLBits.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input [2:0] SW,    // R (load value)
 *       input [1:0] KEY,   // KEY[0]=clk, KEY[1]=L
 *       output reg [2:0] LEDR  // Q
 *   );
 */
//==========================================================================================
module top_module (
    input [2:0] SW,      // R
    input [1:0] KEY,     // L and clk
    output reg [2:0] LEDR  // Q
);

    always @(posedge KEY[0]) begin
        if (KEY[1]) begin
            LEDR <= SW;
        end else begin
            LEDR[0] <= LEDR[2];
            LEDR[1] <= LEDR[0];
            LEDR[2] <= LEDR[1] ^ LEDR[2];
        end
    end

endmodule
//==========================================================================================
