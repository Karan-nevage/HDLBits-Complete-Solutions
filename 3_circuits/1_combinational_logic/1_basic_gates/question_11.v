/*==========================================================================================
 * HDLBits Problem : Simple circuit B
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Mt2015_q4b
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Module B behaves as the combinational function of inputs x and y
 *   described by the waveform/truth table in Midterm 2015 Question 4.
 *   Implement module B so its output z matches that behaviour.
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

    assign z = ~(x ^ y);

endmodule
//==========================================================================================
