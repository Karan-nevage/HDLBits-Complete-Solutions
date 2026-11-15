/*==========================================================================================
 * HDLBits Problem : Q6b: FSM next-state logic (Y2)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q6b
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Binary state codes y[3:1]: A=000, B=001, C=010, D=011, E=100, F=101.
 *   FSM transitions (input w): A:w0->B,w1->A; B:w0->C,w1->D; C:w0->E,w1->D;
 *   D:w0->F,w1->D; E:w0->E,w1->D; F:w0->F,w1->D. Derive the next-state bit Y2.
 *   Y2=1 when next state is C,D (w from C/E are 010/011...) - reduced below.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input [3:1] y,
 *       input w,
 *       output Y2
 *   );
 */
//==========================================================================================
module top_module (
    input [3:1] y,
    input w,
    output Y2
);

    // Binary codes A=000,B=001,C=010,D=011,E=100,F=101 (y[3:1]).
    // Table: A:w?A:B  B:w?D:C  C:w?D:E  D:w?A:F  E:w?D:E  F:w?D:C
    // Next state y[2]=1 (i.e. next state is C or D) for:
    //   B and F (both w), and C and E (w=1 only).
    assign Y2 = (~y[2] & y[1]) | (w & ~y[1] & (y[3] ^ y[2]));

endmodule
//==========================================================================================
