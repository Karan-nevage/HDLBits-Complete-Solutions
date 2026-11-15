/*==========================================================================================
 * HDLBits Problem : Simple one-hot state transitions 3
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm3onehot
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Same 4-state machine as fsm3comb, but states are one-hot (state[3:0] for
 *   A,B,C,D). Derive the one-hot next-state equations and the output by inspection
 *   (combinational only).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input in,
 *       input [3:0] state,
 *       output [3:0] next_state,
 *       output out
 *   );
 */
//==========================================================================================
module top_module (
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out
);

    // next = OR of (incoming transitions). A=bit0, B=bit1, C=bit2, D=bit3
    assign next_state[0] = (~in) & (state[0] | state[2]);          // ->A on in=0 from A,C
    assign next_state[1] = ( in) & (state[0] | state[1] | state[3]); // ->B on in=1 from A,B,D
    assign next_state[2] = (~in) & (state[1] | state[3]);          // ->C on in=0 from B,D
    assign next_state[3] = ( in) &  state[2];                       // ->D on in=1 from C
    assign out = state[3];

endmodule
//==========================================================================================
