/*==========================================================================================
 * HDLBits Problem : Simple state transitions 3
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm3comb
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Combinational next-state and output logic for a 4-state machine (A,B,C,D).
 *   state is the current 2-bit state. Transition table:
 *       A: in0->A, in1->B    C: in0->A, in1->D
 *       B: in0->C, in1->B    D: in0->C, in1->B    (out = 1 in state D)
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input in,
 *       input [1:0] state,
 *       output reg [1:0] next_state,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output out
);

    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    always @(*) case (state)
        A: next_state = in ? B : A;
        B: next_state = in ? B : C;
        C: next_state = in ? D : A;
        D: next_state = in ? B : C;
    endcase
    assign out = (state == D);

endmodule
//==========================================================================================
