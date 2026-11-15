/*==========================================================================================
 * HDLBits Problem : Q2b: One-hot FSM equations (Y1, Y3)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2012_q2b
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   One-hot codes y[5:0]: A=y[0], B=y[1], C=y[2], D=y[3], E=y[4], F=y[5].
 *   Same FSM as 2012 Q2a. Y1 = input of flip-flop y[1] (state B); Y3 = input of
 *   y[3] (state D). Only A->B on w=1 reaches B; B,C,E ->D on w=0 reach D.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input [5:0] y,
 *       input w,
 *       output Y1,
 *       output Y3
 *   );
 */
//==========================================================================================
module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);

    // One-hot A=y[0],B=y[1],C=y[2],D=y[3],E=y[4],F=y[5]
    // Table (mirror of m2014_q6): A:w?B:A B:w?C:D C:w?E:D D:w?F:A E:w?E:D F:w?C:D
    assign Y1 = w & y[0];                            // ->B: A on w=1
    assign Y3 = ~w & (y[1] | y[2] | y[4] | y[5]);    // ->D: B,C,E,F on w=0

endmodule
//==========================================================================================
