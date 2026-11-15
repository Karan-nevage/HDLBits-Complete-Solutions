/*==========================================================================================
 * HDLBits Problem : Simple FSM 1 (synchronous reset)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm1s
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Same two-state Moore machine as fsm1, but reset is synchronous.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input in,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input in,
    output out
);

    parameter A = 1'b0, B = 1'b1;
    reg state, next;
    always @(*) case (state)
        A: next = in ? A : B;   // A self-loops on in=1, goes to B on in=0
        B: next = in ? B : A;   // B self-loops on in=1, goes to A on in=0
    endcase
    always @(posedge clk)
        if (reset) state <= B;
        else       state <= next;
    assign out = (state == B);

endmodule
//==========================================================================================
