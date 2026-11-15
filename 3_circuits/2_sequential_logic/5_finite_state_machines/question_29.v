/*==========================================================================================
 * HDLBits Problem : Q6: FSM (full)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q6
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Full FSM from the m2014 Q6 state diagram (input w, output z). Transitions:
 *       A:w0->B,w1->A   C:w0->E,w1->D   E:w0->E,w1->D
 *       B:w0->C,w1->D   D:w0->F,w1->D   F:w0->F,w1->D
 *   z = 1 in states E and F. Synchronous reset to A.
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
        A: next = w ? A : B;
        B: next = w ? D : C;
        C: next = w ? D : E;
        D: next = w ? A : F;
        E: next = w ? D : E;
        F: next = w ? D : C;
        default: next = A;
    endcase
    always @(posedge clk)
        if (reset) state <= A;
        else       state <= next;
    assign z = (state == E) | (state == F);

endmodule
//==========================================================================================
