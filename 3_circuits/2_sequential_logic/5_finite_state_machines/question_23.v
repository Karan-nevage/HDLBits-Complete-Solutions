/*==========================================================================================
 * HDLBits Problem : Serial two's complementer (Mealy, one-hot)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q5b
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Mealy serial 2's complementer (LSB first), one-hot encoded. Output z copies the
 *   input bits up to and including the first 1, then inverts the rest.
 *
 *   NOTE (best-effort, text-derived): 2-state one-hot (A=not-seen-1, B=seen-1);
 *         confirm against the diagram on HDLBits.
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

    // One-hot: A = state[0] (no 1 seen yet), B = state[1] (a 1 has been seen)
    parameter A = 2'b01, B = 2'b10;
    reg [1:0] state, next;
    always @(*) case (state)
        A: next = x ? B : A;
        B: next = B;
        default: next = A;
    endcase
    always @(posedge clk or posedge areset)
        if (areset) state <= A;
        else        state <= next;
    // Mealy output: in A pass x through; in B invert
    assign z = state[0] ? x : ~x;

endmodule
//==========================================================================================
