/*==========================================================================================
 * HDLBits Problem : Q6c: FSM one-hot next-state (Y2, Y4)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q6c
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   One-hot codes y[6:1]: A=y[1], B=y[2], C=y[3], D=y[4], E=y[5], F=y[6].
 *   Same FSM as Q6b. Y2 is the input of flip-flop y[2] (state B); Y4 is the input
 *   of y[4] (state D). Only A->B on w=0 reaches B; B,C,D,E,F ->D on w=1 reach D.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input [6:1] y,
 *       input w,
 *       output Y2,
 *       output Y4
 *   );
 */
//==========================================================================================
module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4
);

    // One-hot A=y[1],B=y[2],C=y[3],D=y[4],E=y[5],F=y[6]
    // Table: A:w?A:B  B:w?D:C  C:w?D:E  D:w?A:F  E:w?D:E  F:w?D:C
    assign Y2 = ~w & y[1];                           // ->B: A on w=0
    assign Y4 =  w & (y[2] | y[3] | y[5] | y[6]);    // ->D: B,C,E,F on w=1

endmodule
//==========================================================================================
