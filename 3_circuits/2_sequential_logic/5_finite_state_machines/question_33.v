/*==========================================================================================
 * HDLBits Problem : Q2b: FSM (motor control)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2013_q2bfsm
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   After resetn is de-asserted, pulse f=1 for one cycle. Starting the cycle after
 *   f, watch x for the pattern 1,0,1; on detection set g=1 the next cycle. While
 *   g=1, watch y: if y=1 within two cycles, hold g=1 permanently; otherwise clear g
 *   permanently. resetn is active-low synchronous (holds state A while asserted).
 *
 *   NOTE (best-effort, text-derived): exact x-pattern overlap comes from the
 *         diagram image; confirm on HDLBits.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input resetn,
 *       input x,
 *       input y,
 *       output f,
 *       output g
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input resetn,
    input x,
    input y,
    output f,
    output g
);

    parameter A=0, F1=1, X0=2, X1=3, X2=4, G1=5, G2=6, GHOLD=7, GOFF=8;
    reg [3:0] state, next;
    always @(*) case (state)
        A:     next = F1;                 // resetn released -> pulse f next cycle
        F1:    next = X0;                 // begin watching x the cycle after f
        X0:    next = x ? X1 : X0;        // look for 1
        X1:    next = x ? X1 : X2;        // saw 1, look for 0
        X2:    next = x ? G1 : X0;        // saw 1,0, look for 1 -> detected
        G1:    next = y ? GHOLD : G2;     // g=1, first y check
        G2:    next = y ? GHOLD : GOFF;   // g=1, second y check
        GHOLD: next = GHOLD;              // g stays 1
        GOFF:  next = GOFF;               // g stays 0
        default: next = A;
    endcase
    always @(posedge clk)
        if (!resetn) state <= A;
        else         state <= next;
    assign f = (state == F1);
    assign g = (state == G1) | (state == G2) | (state == GHOLD);

endmodule
//==========================================================================================
