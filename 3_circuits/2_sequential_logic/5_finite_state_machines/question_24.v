/*==========================================================================================
 * HDLBits Problem : Q3a: FSM (two-of-three w)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2014_q3fsm
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   From reset state A, stay while s=0 and move to B when s=1. Starting in B,
 *   examine w over windows of three clock cycles; if w=1 in exactly two of the
 *   three, assert z in the following cycle; repeat for each window. Synchronous
 *   reset.
 *
 *   NOTE (best-effort, text-derived): the three-cycle window timing comes from the
 *         timing diagram image; confirm on HDLBits.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input s,
 *       input w,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input s,
    input w,
    output z
);

    // States track (position in 3-window, number of 1s so far).
    // S0/S0Z = window start (S0Z also drives z=1 for the previous window).
    parameter A=0, S0=1, S0Z=2, P1_0=3, P1_1=4, P2_0=5, P2_1=6, P2_2=7;
    reg [2:0] state, next;
    always @(*) case (state)
        A:    next = s ? S0 : A;
        S0:   next = w ? P1_1 : P1_0;
        S0Z:  next = w ? P1_1 : P1_0;
        P1_0: next = w ? P2_1 : P2_0;
        P1_1: next = w ? P2_2 : P2_1;
        P2_0: next = S0;                 // total 0 or 1 -> never exactly two
        P2_1: next = w ? S0Z : S0;       // 1 + w
        P2_2: next = w ? S0  : S0Z;      // 2 + w (two only when w=0)
        default: next = A;
    endcase
    always @(posedge clk)
        if (reset) state <= A;
        else       state <= next;
    assign z = (state == S0Z);

endmodule
//==========================================================================================
