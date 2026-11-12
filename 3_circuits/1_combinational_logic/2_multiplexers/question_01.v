/*==========================================================================================
 * HDLBits Problem : 2-to-1 multiplexer
 * Category        : Circuits -> Combinational Logic -> Multiplexers
 * Link            : https://hdlbits.01xz.net/wiki/Mux2to1
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create a 1-bit wide 2-to-1 multiplexer.
 *   When sel = 0 choose a; when sel = 1 choose b.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  a,
 *       input  b,
 *       input  sel,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input  a,
    input  b,
    input  sel,
    output out
);

    // assign out = sel ? b : a;  // Mux expressed as conditional operator

    assign out = (sel & b) | (~sel & a);	// Mux expressed as AND and OR

endmodule
//==========================================================================================
