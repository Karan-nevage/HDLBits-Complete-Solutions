/*==========================================================================================
 * HDLBits Problem : Design a Mealy FSM (101 sequence detector)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q8
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement a Mealy-type FSM that recognizes the sequence "101" on input x and
 *   asserts z to 1 when the sequence is detected. The FSM must use only 3 states,
 *   recognize overlapping sequences, and have an asynchronous active-low reset
 *   (aresetn).
 *
 *   States: S0 = idle, S1 = seen "1", S2 = seen "10".
 *   Being a Mealy machine, z depends on both the current state and x: z = 1 when
 *   in S2 and x = 1 (the final "1" that completes "101"). Overlap is handled by
 *   moving from S2 back to S1 on that final "1", so it can start a new sequence.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input aresetn,   // asynchronous active-low reset
 *       input x,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input aresetn,   // asynchronous active-low reset
    input x,
    output z
);

    parameter S0 = 2'd0, S1 = 2'd1, S2 = 2'd2;
    reg [1:0] state, next;

    // Next-state logic
    always @(*) case (state)
        S0: next = x ? S1 : S0;   // see 1 -> S1
        S1: next = x ? S1 : S2;   // "1" then 0 -> S2 ("10")
        S2: next = x ? S1 : S0;   // "10" then 1 -> detected, restart at S1 (overlap)
        default: next = S0;
    endcase

    // State register with asynchronous active-low reset
    always @(posedge clk or negedge aresetn)
        if (!aresetn) state <= S0;
        else          state <= next;

    // Mealy output: 101 completed when in S2 and x = 1
    assign z = (state == S2) & x;

endmodule
//==========================================================================================
