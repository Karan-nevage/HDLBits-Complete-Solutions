/*==========================================================================================
 * HDLBits Problem : 7420 chip
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/7420
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   The 7420 is a chip with two 4-input NAND gates. Create a module with
 *   the same functionality: 8 inputs and 2 outputs.
 *     p1y = ~(p1a & p1b & p1c & p1d)
 *     p2y = ~(p2a & p2b & p2c & p2d)
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  p1a, p1b, p1c, p1d,
 *       output p1y,
 *       input  p2a, p2b, p2c, p2d,
 *       output p2y
 *   );
 */
//==========================================================================================
module top_module (
    input  p1a, p1b, p1c, p1d,
    output p1y,
    input  p2a, p2b, p2c, p2d,
    output p2y
);

    assign p1y = ~(p1a & p1b & p1c & p1d);
    assign p2y = ~(p2a & p2b & p2c & p2d);

endmodule
//==========================================================================================
