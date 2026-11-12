/*==========================================================================================
 * HDLBits Problem : Simple circuit A
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Mt2015_q4a
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Module A behaves as the combinational function of inputs x and y
 *   described by the waveform/truth table in Midterm 2015 Question 4.
 *   Implement module A so its output z matches that behaviour.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  x,
 *       input  y,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input  x,
    input  y,
    output z
);

    assign z = (x ^ y) & x;

endmodule
//==========================================================================================
