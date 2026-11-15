/*==========================================================================================
 * HDLBits Problem : Q2a: FSM (priority arbiter)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2013_q2afsm
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Arbiter for three requesters r[3:1] with grants g[3:1]. Device 1 has highest
 *   priority, device 3 lowest. From idle (state A, no grant), grant the highest-
 *   priority active request; hold that grant while its request stays 1, then return
 *   to A. resetn is active-low synchronous.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input resetn,    // active-low synchronous reset
 *       input [3:1] r,
 *       output [3:1] g
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,
    output [3:1] g
);

    parameter A = 0, G1 = 1, G2 = 2, G3 = 3;
    reg [1:0] state, next;
    always @(*) case (state)
        A:  next = r[1] ? G1 : r[2] ? G2 : r[3] ? G3 : A;
        G1: next = r[1] ? G1 : A;
        G2: next = r[2] ? G2 : A;
        G3: next = r[3] ? G3 : A;
        default: next = A;
    endcase
    always @(posedge clk)
        if (!resetn) state <= A;
        else         state <= next;
    assign g[1] = (state == G1);
    assign g[2] = (state == G2);
    assign g[3] = (state == G3);

endmodule
//==========================================================================================
