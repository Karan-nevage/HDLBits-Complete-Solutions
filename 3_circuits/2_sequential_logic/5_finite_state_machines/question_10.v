/*==========================================================================================
 * HDLBits Problem : Lemmings 1
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Lemmings1
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   A Lemming walks left or right and turns around when it bumps a wall.
 *   bump_left -> walk right; bump_right -> walk left. areset -> walk left.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input areset,
 *       input bump_left,
 *       input bump_right,
 *       output walk_left,
 *       output walk_right
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right
);

    parameter WL = 1'b0, WR = 1'b1;
    reg state, next;
    always @(*) case (state)
        WL: next = bump_left  ? WR : WL;
        WR: next = bump_right ? WL : WR;
    endcase
    always @(posedge clk or posedge areset)
        if (areset) state <= WL;
        else        state <= next;
    assign walk_left  = (state == WL);
    assign walk_right = (state == WR);

endmodule
//==========================================================================================
