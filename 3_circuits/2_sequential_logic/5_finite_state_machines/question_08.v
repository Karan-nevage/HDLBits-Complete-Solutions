/*==========================================================================================
 * HDLBits Problem : Simple FSM 3 (synchronous reset)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm3s
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Same 4-state Moore machine as fsm3, but with a synchronous reset to A.
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

    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] state, next;
    always @(*) case (state)
        A: next = in ? B : A;
        B: next = in ? B : C;
        C: next = in ? D : A;
        D: next = in ? B : C;
    endcase
    always @(posedge clk)
        if (reset) state <= A;
        else       state <= next;
    assign out = (state == D);

endmodule
//==========================================================================================
