/*==========================================================================================
 * HDLBits Problem : Simple FSM 2 (asynchronous reset)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm2
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Moore machine with two states OFF/ON. j turns it ON, k turns it OFF.
 *   Output out is 1 in the ON state. areset (asynchronous) returns to OFF.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input areset,
 *       input j,
 *       input k,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input areset,
    input j,
    input k,
    output out
);

    parameter OFF = 1'b0, ON = 1'b1;
    reg state, next;
    always @(*) case (state)
        OFF: next = j ? ON  : OFF;
        ON:  next = k ? OFF : ON;
    endcase
    always @(posedge clk or posedge areset)
        if (areset) state <= OFF;
        else        state <= next;
    assign out = (state == ON);

endmodule
//==========================================================================================
