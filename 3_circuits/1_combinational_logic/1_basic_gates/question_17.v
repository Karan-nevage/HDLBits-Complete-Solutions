/*==========================================================================================
 * HDLBits Problem : Even longer vectors
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Gatesv100
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Same as 'Gates and vectors' but for a 100-bit input vector in[99:0]:
 *     out_both[i]      = in[i] AND in[i+1]      (i = 0..98)
 *     out_any[i]       = in[i] OR  in[i-1]      (i = 1..99)
 *     out_different[i] = in[i] XOR in[i+1], with wraparound (in[99] vs in[0])
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [99:0] in,
 *       output [98:0] out_both,
 *       output [99:1] out_any,
 *       output [99:0] out_different
 *   );
 */
//==========================================================================================
module top_module (
    input  [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different
);

    assign out_both      = in[98:0] & in[99:1];
    assign out_any       = in[99:1] | in[98:0];
    assign out_different = in ^ {in[0], in[99:1]};

endmodule
//==========================================================================================
