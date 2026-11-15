/*==========================================================================================
 * HDLBits Problem : One-hot FSM (10-state)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm_onehot
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Given the one-hot 10-state machine (states S0..S9 = state[0..9], input in,
 *   outputs out1, out2), derive the combinational next-state equations and outputs
 *   by inspection. Transitions: S0..S4 advance on in=1 (S0->..->S5) and return to
 *   S0 on in=0; S5 in=0 -> S8; S6 in=0 -> S9; S7 in=1 self, in=0 -> S9; S6/S7 in=1
 *   -> S7; S8/S9 go to S1 on in=1 and S0 on in=0. out1 in S8,S9; out2 in S7,S9.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input in,
 *       input [9:0] state,
 *       output [9:0] next_state,
 *       output out1,
 *       output out2
 *   );
 */
//==========================================================================================
module top_module (
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2
);

    assign next_state[0] = ~in & (state[0]|state[1]|state[2]|state[3]|state[4]|state[7]|state[8]|state[9]);
    assign next_state[1] =  in & (state[0]|state[8]|state[9]);
    assign next_state[2] =  in &  state[1];
    assign next_state[3] =  in &  state[2];
    assign next_state[4] =  in &  state[3];
    assign next_state[5] =  in &  state[4];
    assign next_state[6] =  in &  state[5];
    assign next_state[7] =  in & (state[6]|state[7]);
    assign next_state[8] = ~in &  state[5];
    assign next_state[9] = ~in &  state[6];
    assign out1 = state[8] | state[9];
    assign out2 = state[7] | state[9];

endmodule
//==========================================================================================
