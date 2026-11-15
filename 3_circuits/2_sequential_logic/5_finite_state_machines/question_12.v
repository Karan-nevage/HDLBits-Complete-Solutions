/*==========================================================================================
 * HDLBits Problem : Lemmings 3
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Lemmings3
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Extends Lemmings 2: dig makes the Lemming dig downward while there is ground.
 *   Priority: falling > digging > bumping/walking.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input areset,
 *       input bump_left,
 *       input bump_right,
 *       input ground,
 *       input dig,
 *       output walk_left,
 *       output walk_right,
 *       output aaah,
 *       output digging
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging
);

    parameter WL = 0, WR = 1, FL = 2, FR = 3, DL = 4, DR = 5;
    reg [2:0] state, next;
    always @(*) case (state)
        WL: next = ~ground ? FL : (dig ? DL : (bump_left  ? WR : WL));
        WR: next = ~ground ? FR : (dig ? DR : (bump_right ? WL : WR));
        FL: next =  ground ? WL : FL;
        FR: next =  ground ? WR : FR;
        DL: next = ~ground ? FL : DL;
        DR: next = ~ground ? FR : DR;
        default: next = WL;
    endcase
    always @(posedge clk or posedge areset)
        if (areset) state <= WL;
        else        state <= next;
    assign walk_left  = (state == WL);
    assign walk_right = (state == WR);
    assign aaah       = (state == FL) | (state == FR);
    assign digging    = (state == DL) | (state == DR);

endmodule
//==========================================================================================
