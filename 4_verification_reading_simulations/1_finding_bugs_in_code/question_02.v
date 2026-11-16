/*==========================================================================================
 * HDLBits Problem : NAND (3-input)
 * Category        : Verification: Reading Simulations -> Finding Bugs in Code
 * Link            : https://hdlbits.01xz.net/wiki/Bugs_nand3
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   This three-input NAND gate, built from a provided 5-input AND gate, does not
 *   work. Find and fix the bug(s). You may only use the provided andgate plus one
 *   inverter; tie the unused AND inputs so they don't affect the result.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (input a, input b, input c, output out);
 *
 *   Provided by HDLBits (instantiate; do not redefine):
 *       module andgate ( output out, input a, input b, input c, input d, input e );
 */
//==========================================================================================
module top_module (input a, input b, input c, output out);

    wire and_out;

    // Tie the two unused AND inputs to 1 so they don't affect a&b&c, then invert
    andgate inst1 (and_out, a, b, c, 1'b1, 1'b1);
    assign out = ~and_out;

endmodule
//==========================================================================================
