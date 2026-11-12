/*==========================================================================================
 * HDLBits Problem : 3-bit population count
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Popcount3
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   A population-count circuit counts the number of '1's in its input.
 *   Build a circuit for a 3-bit input; the 2-bit output is the count
 *   (0 to 3).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [2:0] in,
 *       output [1:0] out
 *   );
 */
//==========================================================================================
module top_module (
    input  [2:0] in,
    output [1:0] out
);

    assign out = in[0] + in[1] + in[2];

endmodule
//==========================================================================================
