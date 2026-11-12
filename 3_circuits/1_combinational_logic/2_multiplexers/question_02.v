/*==========================================================================================
 * HDLBits Problem : 2-to-1 bus multiplexer
 * Category        : Circuits -> Combinational Logic -> Multiplexers
 * Link            : https://hdlbits.01xz.net/wiki/Mux2to1v
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create a 100-bit wide 2-to-1 multiplexer.
 *   When sel = 0 choose a; when sel = 1 choose b.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [99:0] a,
 *       input  [99:0] b,
 *       input  sel,
 *       output [99:0] out
 *   );
 */
//==========================================================================================
module top_module (
    input  [99:0] a,
    input  [99:0] b,
    input  sel,
    output [99:0] out
);

    assign out = sel ? b : a;

endmodule
//==========================================================================================
