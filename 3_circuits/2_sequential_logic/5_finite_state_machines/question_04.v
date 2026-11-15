/*==========================================================================================
 * HDLBits Problem : Simple FSM 2 (synchronous reset)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm2s
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Same machine as fsm2 (OFF/ON via j/k), but with a synchronous reset to OFF.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input j,
 *       input k,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
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
    always @(posedge clk)
        if (reset) state <= OFF;
        else       state <= next;
    assign out = (state == ON);

endmodule
//==========================================================================================
