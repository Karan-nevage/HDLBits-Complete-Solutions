/*==========================================================================================
 * HDLBits Problem : Gates and vectors
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Gatesv
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Given a 4-bit input vector in[3:0], compute, for pairs of neighbouring
 *   bits:
 *     out_both[i]      = in[i] AND in[i+1]      (i = 0..2)
 *     out_any[i]       = in[i] OR  in[i-1]      (i = 1..3)
 *     out_different[i] = in[i] XOR in[i+1], treating the vector as wrapping
 *                        around so in[3] is compared with in[0] (i = 0..3)
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [3:0] in,
 *       output [2:0] out_both,
 *       output [3:1] out_any,
 *       output [3:0] out_different
 *   );
 */
//==========================================================================================
module top_module (
    input  [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different
);

    assign out_both     = in[2:0] & in[3:1];
    assign out_any      = in[3:1] | in[2:0];
    assign out_different = in ^ {in[0], in[3:1]};

endmodule
//==========================================================================================
