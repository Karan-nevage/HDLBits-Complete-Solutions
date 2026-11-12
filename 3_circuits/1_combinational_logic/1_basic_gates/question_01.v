/*==========================================================================================
 * HDLBits Problem : Wire
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4h
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the single-wire circuit shown in the exam diagram:
 *   connect the input directly to the output (out = in).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  in,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input  in,
    output out
);

    assign out = in;

endmodule
//==========================================================================================
