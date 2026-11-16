/*==========================================================================================
 * HDLBits Problem : FSM: Sequence 1101 recognizer
 * Category        : Circuits -> Building Larger Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/review2015_fsmseq
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build an FSM that searches the serial input 'data' for the sequence 1101.
 *   Once the sequence has been found, assert start_shifting and keep it high
 *   until reset (getting permanently stuck in that state is intended for now).
 *   reset is synchronous.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,      // Synchronous reset
 *       input data,
 *       output start_shifting);
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    parameter A=0, B=1, C=2, D=3, DONE=4;    // A='', B='1', C='11', D='110', DONE=found
    reg [2:0] state, next;

    always @(*) begin
        case (state)
            A:    next = data ? B    : A;
            B:    next = data ? C    : A;
            C:    next = data ? C    : D;
            D:    next = data ? DONE : A;
            DONE: next = DONE;                // Latches here; only reset clears it (ignores data)
            default: next = A;
        endcase
    end

    always @(posedge clk) begin
        if (reset) state <= A;
        else       state <= next;
    end

    assign start_shifting = (state == DONE);

endmodule
//==========================================================================================
