/*==========================================================================================
 * HDLBits Problem : 256-to-1 4-bit multiplexer
 * Category        : Circuits -> Combinational Logic -> Multiplexers
 * Link            : https://hdlbits.01xz.net/wiki/Mux256to1v
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create a 4-bit wide 256-to-1 multiplexer. The 256 four-bit inputs are
 *   packed into in[1023:0] (input 0 is in[3:0], input 1 is in[7:4], ...).
 *   sel[7:0] selects which 4-bit group drives the 4-bit output.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [1023:0] in,
 *       input  [7:0] sel,
 *       output [3:0] out
 *   );
 */
//==========================================================================================
module top_module (
    input  [1023:0] in,
    input  [7:0] sel,
    output [3:0] out
);

     assign out = {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};

    // assign out = in >> (sel * 4);


endmodule
//==========================================================================================
