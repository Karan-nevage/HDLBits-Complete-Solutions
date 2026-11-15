/*==========================================================================================
 * HDLBits Problem : Simple FSM 1 (asynchronous reset)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm1
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Two-state Moore FSM. in selects the next state; areset (asynchronous) returns
 *   to state B. Output out is 1 in state B.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input areset,
 *       input in,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input areset,
    input in,
    output out
);

    parameter A = 1'b0, B = 1'b1;
    reg state, next;
    always @(*) case (state)
        A: next = in ? A : B;   // A self-loops on in=1, goes to B on in=0
        B: next = in ? B : A;   // B self-loops on in=1, goes to A on in=0
    endcase
    always @(posedge clk or posedge areset)
        if (areset) state <= B;
        else        state <= next;
    assign out = (state == B);

endmodule
//==========================================================================================
