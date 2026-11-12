/*==========================================================================================
 * HDLBits Problem : Two gates
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4g
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the circuit shown in the exam diagram, which consists of
 *   an XNOR gate feeding into a second gate. The circuit has three
 *   inputs (in1, in2, in3) and one output (out).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  in1,
 *       input  in2,
 *       input  in3,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input in1,
    input in2,
    input in3,
    output out);

    wire out1;

    xnor(out1, in1, in2 );
    xor (out ,out1, in3);

    //-------------- Optimized Way --------------------
    //  xor (out ,in3, ~(in1^in2));    // No need of extra signal declaration
endmodule
//==========================================================================================
