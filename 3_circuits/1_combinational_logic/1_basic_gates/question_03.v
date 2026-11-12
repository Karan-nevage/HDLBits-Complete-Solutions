/*==========================================================================================
 * HDLBits Problem : NOR
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4e
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the NOR gate shown in the exam diagram.
 *   A NOR gate is an OR gate with its output inverted.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  in1,
 *       input  in2,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input  in1,
    input  in2,
    output out
);

    nor( out, in1, in2);

    //-------------- Simple Way --------------------
    // assign out = ~(in1 | in2);

endmodule
//==========================================================================================
