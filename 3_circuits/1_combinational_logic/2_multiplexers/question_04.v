/*==========================================================================================
 * HDLBits Problem : 256-to-1 multiplexer
 * Category        : Circuits -> Combinational Logic -> Multiplexers
 * Link            : https://hdlbits.01xz.net/wiki/Mux256to1
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create a 1-bit wide 256-to-1 multiplexer. The 256 inputs are packed
 *   into a single input vector in[255:0]. sel[7:0] selects which input bit
 *   drives the output (out = in[sel]).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [255:0] in,
 *       input  [7:0] sel,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input  [255:0] in,
    input  [7:0] sel,
    output out
);

    assign out = in[sel];

endmodule
//==========================================================================================
