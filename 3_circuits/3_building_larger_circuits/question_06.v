/*==========================================================================================
 * HDLBits Problem : The complete timer
 * Category        : Circuits -> Building Larger Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/review2015_fancytimer
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build the full timer: detect 1101, then shift in the next 4 bits (MSB first)
 *   as delay[3:0]. Count for (delay+1)*1000 cycles while driving the remaining
 *   whole seconds on count[3:0], then assert done until ack is 1 and return to
 *   searching for 1101. reset is synchronous.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,      // Synchronous reset
 *       input data,
 *       output [3:0] count,
 *       output counting,
 *       output done,
 *       input ack );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    //----------------------------------------------------------
    // State Encoding
    //----------------------------------------------------------    
    // A..D   : searching for 1101 (A='', B='1', C='11', D='110')
    // SH1..4 : shifting in delay[3:0], MSB first
    // CNT    : counting down (delay+1) whole seconds
    // WAIT   : done, waiting for ack
    //----------------------------------------------------------
    parameter A=0, B=1, C=2, D=3, SH1=4, SH2=5, SH3=6, SH4=7, CNT=8, WAIT=9;
    reg [3:0] state, next;

    reg [3:0] secs;    // doubles as the delay shift register and the seconds-remaining counter
    reg [9:0] cyc;      // cycles remaining within the current second (999..0)

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
            CNT:  next = (cyc==0 && secs==0) ? WAIT : CNT;
            WAIT: next = ack ? A : WAIT;
            default: next = A;
        endcase
    end

    always @(posedge clk) begin
        if (reset) state <= A;
        else       state <= next;
    end

    // Shift in delay during SH1..SH4; count down whole seconds while CNT
    always @(posedge clk) begin
        if (state==SH1 || state==SH2 || state==SH3 || state==SH4)
            secs <= {secs[2:0], data};
        else if (state==CNT && cyc==0 && secs!=0)
            secs <= secs - 1'b1;
    end

    // 1000-cycle (1 "second") sub-counter, active only while CNT
    always @(posedge clk) begin
        if (state==SH4)
            cyc <= 10'd999;                    // Load for the first second
        else if (state==CNT)
            cyc <= (cyc==0) ? 10'd999 : cyc - 1'b1;
    end

    assign count    = secs;
    assign counting = (state==CNT);
    assign done     = (state==WAIT);

endmodule
//==========================================================================================
