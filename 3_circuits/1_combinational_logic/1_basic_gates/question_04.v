/*==========================================================================================
 * HDLBits Problem : Another gate
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4f
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the single-gate circuit shown in the exam diagram.
 *   out = in1 AND (NOT in2).
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

    assign out = in1 & (~in2);
    
    //-------------- Simple Way --------------------
    // and (out, in1, ~in2);
endmodule
//==========================================================================================
