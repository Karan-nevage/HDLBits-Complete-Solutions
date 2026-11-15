/*==========================================================================================
 * HDLBits Problem : Lemmings 2
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Lemmings2
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Extends Lemmings 1: when ground = 0 the Lemming falls (aaah) and cannot walk
 *   or turn until it lands (ground = 1), then resumes the same direction.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input areset,
 *       input bump_left,
 *       input bump_right,
 *       input ground,
 *       output walk_left,
 *       output walk_right,
 *       output aaah
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah
);

    parameter WL = 0, WR = 1, FL = 2, FR = 3;
    reg [1:0] state, next;
    always @(*) case (state)
        WL: next = ~ground ? FL : (bump_left  ? WR : WL);
        WR: next = ~ground ? FR : (bump_right ? WL : WR);
        FL: next =  ground ? WL : FL;
        FR: next =  ground ? WR : FR;
    endcase
    always @(posedge clk or posedge areset)
        if (areset) state <= WL;
        else        state <= next;
    assign walk_left  = (state == WL);
    assign walk_right = (state == WR);
    assign aaah       = (state == FL) | (state == FR);

endmodule
//==========================================================================================
