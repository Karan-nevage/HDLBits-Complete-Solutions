/*==========================================================================================
 * HDLBits Problem : GND
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4i
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the circuit shown in the exam diagram:
 *   the output is tied to logic 0 (ground).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    output out
);

    supply0 gnd = 1'b0;
    assign out = gnd;

    //-------------- Simple Way --------------------
    //assign out = 1'b0;

endmodule
//==========================================================================================
