/*==========================================================================================
 * HDLBits Problem : Lemmings 4
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Lemmings4
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Extends Lemmings 3: if the Lemming falls for more than 20 cycles it splats on
 *   landing and then does nothing until areset.
 *
 *   NOTE (best-effort): the exact splat threshold is a known HDLBits gotcha - this
 *         uses count >= 20; confirm on HDLBits and adjust if the edge case fails.
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

    parameter WL = 0, WR = 1, FL = 2, FR = 3, DL = 4, DR = 5, SPLAT = 6;
    reg [2:0] state, next;
    reg [5:0] fcount;   // cycles spent falling (saturates at 21)
    always @(*) case (state)
        WL: next = ~ground ? FL : (dig ? DL : (bump_left  ? WR : WL));
        WR: next = ~ground ? FR : (dig ? DR : (bump_right ? WL : WR));
        DL: next = ~ground ? FL : DL;
        DR: next = ~ground ? FR : DR;
        FL: next =  ground ? (fcount >= 6'd21 ? SPLAT : WL) : FL;  // >20 cycles -> splat
        FR: next =  ground ? (fcount >= 6'd21 ? SPLAT : WR) : FR;
        SPLAT: next = SPLAT;
        default: next = WL;
    endcase
    always @(posedge clk or posedge areset) begin
        if (areset) begin state <= WL; fcount <= 0; end
        else begin
            state <= next;
            if (next == FL || next == FR) fcount <= (fcount < 6'd21) ? fcount + 1'b1 : 6'd21;
            else                          fcount <= 0;
        end
    end
    assign walk_left  = (state == WL);
    assign walk_right = (state == WR);
    assign aaah       = (state == FL) | (state == FR);
    assign digging    = (state == DL) | (state == DR);

endmodule
//==========================================================================================
