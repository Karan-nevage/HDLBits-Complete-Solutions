/*==========================================================================================
 * HDLBits Problem : Sequence recognition
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm_hdlc
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   HDLC bit-stream framing: pulse disc one cycle after a 0 that follows exactly 5
 *   ones (a stuffed bit); pulse flag one cycle after 6 ones followed by a 0
 *   (01111110); pulse err one cycle after 7+ consecutive ones. reset is synchronous.
 *   Outputs are Moore (based on state), which gives the required one-cycle delay.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input in,
 *       output disc,
 *       output flag,
 *       output err
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input in,
    output disc,
    output flag,
    output err
);

    parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, DISC=7, FLAG=8, ERR=9;
    reg [3:0] state, next;
    always @(*) case (state)
        S0:   next = in ? S1 : S0;
        S1:   next = in ? S2 : S0;
        S2:   next = in ? S3 : S0;
        S3:   next = in ? S4 : S0;
        S4:   next = in ? S5 : S0;
        S5:   next = in ? S6   : DISC;   // 5 ones then 0 -> discard
        S6:   next = in ? ERR  : FLAG;   // 6 ones then 1 -> error, then 0 -> flag
        DISC: next = in ? S1 : S0;
        FLAG: next = in ? S1 : S0;
        ERR:  next = in ? ERR : S0;      // stay in error until a 0
        default: next = S0;
    endcase
    always @(posedge clk)
        if (reset) state <= S0;
        else       state <= next;
    assign disc = (state == DISC);
    assign flag = (state == FLAG);
    assign err  = (state == ERR);

endmodule
//==========================================================================================
