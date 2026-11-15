/*==========================================================================================
 * HDLBits Problem : Serial two's complementer (Moore FSM)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q5a
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Moore serial 2's complementer (LSB first): copy input bits up to and including
 *   the first 1, then invert. areset is asynchronous. Because it is a Moore
 *   machine, the output is registered (z appears one cycle after each input bit).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input areset,
 *       input x,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input areset,
    input x,
    output z
);

    parameter A = 1'b0, B = 1'b1;   // A = no 1 seen yet, B = a 1 has been seen
    reg state;
    reg zr;

    // Moore machine: the output is registered, so z is a function of state only
    // (one clock-cycle latency). z = 0 while in reset.
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= A;
            zr    <= 1'b0;
        end else begin
            zr <= (state == A) ? x : ~x;   // copy up to & including first 1, then invert
            if (x) state <= B;             // once a 1 is seen, stay in B
        end
    end

    assign z = zr;

endmodule
//==========================================================================================
