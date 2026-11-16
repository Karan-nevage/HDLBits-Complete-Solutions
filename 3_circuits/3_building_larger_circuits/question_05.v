/*==========================================================================================
 * HDLBits Problem : FSM: The complete FSM
 * Category        : Circuits -> Building Larger Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/review2015_fsm
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement ONLY the control FSM of the timer (no datapath). After the 1101
 *   pattern is detected, assert shift_ena for 4 cycles, then assert counting
 *   until done_counting is high, then assert done until ack is 1, after which
 *   it returns to searching for 1101. reset is synchronous.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,      // Synchronous reset
 *       input data,
 *       output shift_ena,
 *       output counting,
 *       input done_counting,
 *       output done,
 *       input ack );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    //----------------------------------------------------------
    // State Encoding
    //----------------------------------------------------------    
    // A..D   : searching for 1101 (A='', B='1', C='11', D='110')
    // SH1..4 : shifting in the next 4 bits (not used by this control-only FSM)
    // CNT    : counting, waiting for done_counting
    // WAIT   : done, waiting for ack
    //----------------------------------------------------------
    parameter A=0, B=1, C=2, D=3, SH1=4, SH2=5, SH3=6, SH4=7, CNT=8, WAIT=9;
    reg [3:0] state, next;

    always @(*) begin
        case (state)
            A:    next = data ? B   : A;
            B:    next = data ? C   : A;
            C:    next = data ? C   : D;
            D:    next = data ? SH1 : A;
            SH1:  next = SH2;
            SH2:  next = SH3;
            SH3:  next = SH4;
            SH4:  next = CNT;
            CNT:  next = done_counting ? WAIT : CNT;
            WAIT: next = ack ? A : WAIT;
            default: next = A;
        endcase
    end

    always @(posedge clk) begin
        if (reset) state <= A;
        else       state <= next;
    end

    assign shift_ena = (state==SH1) | (state==SH2) | (state==SH3) | (state==SH4);
    assign counting  = (state==CNT);
    assign done      = (state==WAIT);

endmodule
//==========================================================================================
