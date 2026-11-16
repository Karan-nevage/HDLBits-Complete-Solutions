/*==========================================================================================
 * HDLBits Problem : FSM: One-hot logic equations
 * Category        : Circuits -> Building Larger Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/review2015_fsmonehot
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   For the 10-state one-hot FSM (states S, S1, S11, S110, B0, B1, B2, B3,
 *   Count, Wait), derive the next-state and output logic by inspection and
 *   implement ONLY the combinational logic. The HDLBits skeleton defines index
 *   parameters: S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8,
 *   Wait=9, so you reference bits as state[S], state[Count], etc.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module(
 *       input d,
 *       input done_counting,
 *       input ack,
 *       input [9:0] state,    // 10-bit one-hot current state
 *       output B3_next,
 *       output S_next,
 *       output S1_next,
 *       output Count_next,
 *       output Wait_next,
 *       output done,
 *       output counting,
 *       output shift_ena
 *   );
 */
//==========================================================================================
module top_module(
    input d,
    input done_counting,
    input ack,
    input [9:0] state,    // 10-bit one-hot current state
    output B3_next,
    output S_next,
    output S1_next,
    output Count_next,
    output Wait_next,
    output done,
    output counting,
    output shift_ena
);
    //------------------------------[ One-hot]---------------------------------------------
    //          S=state[0], S1=state[1], S11=state[2], S110=state[3],
    //          B0=state[4], B1=state[5], B2=state[6], B3=state[7],
    //          Count=state[8], Wait=state[9]
    //--------------------------------------------------------------------------------------
    // ----------------[ Transitions (from the equivalent binary FSM) ]---------------------
    //   S->S1(d=1), S->S(d=0), S1->S11(d=1), S1->S(d=0), S11->S11(d=1), S11->S110(d=0),
    //   S110->B0(d=1), S110->S(d=0), B0->B1->B2->B3 (unconditional), B3->Count,
    //   Count->Wait(done_counting), Count->Count(!done_counting),
    //   Wait->S(ack), Wait->Wait(!ack)
    //--------------------------------------------------------------------------------------
    assign S_next     = (state[0] & ~d) | (state[1] & ~d) | (state[3] & ~d) | (state[9] & ack);
    assign S1_next    = state[0] & d;
    assign B3_next    = state[6];
    assign Count_next = state[7] | (state[8] & ~done_counting);
    assign Wait_next  = (state[8] & done_counting) | (state[9] & ~ack);

    assign done       = state[9];
    assign counting   = state[8];
    assign shift_ena  = state[4] | state[5] | state[6] | state[7];

endmodule
//==========================================================================================
