/*==========================================================================================
 * HDLBits Problem : PS/2 packet parser
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm_ps2
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   A PS/2 mouse sends 3-byte messages. The first byte of a message is identified
 *   by in[3] == 1. Build an FSM that reads one byte per cycle and asserts done
 *   after the third byte of a message. reset is synchronous.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input [7:0] in,
 *       input reset,
 *       output done
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input [7:0] in,
    input reset,
    output done
);

    parameter B1 = 0, B2 = 1, B3 = 2, DONE = 3;
    reg [1:0] state, next;
    always @(*) case (state)
        B1:   next = in[3] ? B2 : B1;
        B2:   next = B3;
        B3:   next = DONE;
        DONE: next = in[3] ? B2 : B1;
    endcase
    always @(posedge clk)
        if (reset) state <= B1;
        else       state <= next;
    assign done = (state == DONE);

endmodule
//==========================================================================================
