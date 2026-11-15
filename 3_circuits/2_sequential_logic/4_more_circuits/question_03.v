/*==========================================================================================
 * HDLBits Problem : Conway's Game of Life 16x16
 * Category        : Circuits -> Sequential Logic -> More Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Conwaylife
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Simulate Conway's Game of Life on a 16x16 toroidal grid (edges wrap). Each of
 *   the 256 cells (cell (r,c) at bit r*16+c) lives if it has exactly 3 live
 *   neighbours, or 2 live neighbours while already alive. load sets the grid from
 *   data; otherwise advance one generation per clock.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input load,
 *       input [255:0] data,
 *       output reg [255:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

    integer r, c, dr, dc, cnt;
    reg [255:0] next_q;

    always @(*) begin
        for (r = 0; r < 16; r = r + 1) begin
            for (c = 0; c < 16; c = c + 1) begin
                cnt = 0;
                for (dr = -1; dr <= 1; dr = dr + 1)
                    for (dc = -1; dc <= 1; dc = dc + 1)
                        if (dr != 0 || dc != 0)
                            cnt = cnt + q[((r+dr+16)%16)*16 + ((c+dc+16)%16)];
                next_q[r*16 + c] = (cnt == 3) | ((cnt == 2) & q[r*16 + c]);
            end
        end
    end

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= next_q;
    end

endmodule
//==========================================================================================
