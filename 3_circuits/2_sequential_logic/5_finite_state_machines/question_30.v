/*==========================================================================================
 * HDLBits Problem : Q2a: FSM (2012 final)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2012_q2fsm
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Full FSM from the 2012 Q2 state diagram (input w, output z). Transitions:
 *       A:w0->A,w1->B   C:w0->D,w1->E   E:w0->D,w1->E
 *       B:w0->D,w1->C   D:w0->F,w1->C   F:w0->F,w1->C
 *   z = 1 in states E and F. Synchronous active-high reset to A.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input w,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input w,
    output z
);

    parameter A=0, B=1, C=2, D=3, E=4, F=5;
    reg [2:0] state, next;
    always @(*) case (state)
        A: next = w ? B : A;
        B: next = w ? C : D;
        C: next = w ? E : D;
        D: next = w ? F : A;
        E: next = w ? E : D;
        F: next = w ? C : D;
        default: next = A;
    endcase
    always @(posedge clk)
        if (reset) state <= A;
        else       state <= next;
    assign z = (state == E) | (state == F);

endmodule
//==========================================================================================
