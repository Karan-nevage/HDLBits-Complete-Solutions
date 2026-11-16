/*==========================================================================================
 * HDLBits Problem : FSM: Enable shift register
 * Category        : Circuits -> Building Larger Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/review2015_fsmshift
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build an FSM that, after each reset, asserts shift_ena for exactly 4 clock
 *   cycles, then holds shift_ena at 0 until the next reset. (No sequence
 *   detection here - just the 4-cycle enable pulse.) reset is synchronous.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,      // Synchronous reset
 *       output shift_ena);
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    parameter S0=0, S1=1, S2=2, S3=3, DONE=4;    // S0..S3 = the 4 enabled cycles
    reg [2:0] state;

    always @(posedge clk) begin
        if (reset) state <= S0;
        else begin
            case (state)
                S0:   state <= S1;
                S1:   state <= S2;
                S2:   state <= S3;
                S3:   state <= DONE;
                DONE: state <= DONE;          // Stays 0 until next reset
                default: state <= S0;
            endcase
        end
    end

    assign shift_ena = (state == S0) | (state == S1) | (state == S2) | (state == S3);

endmodule
//==========================================================================================
