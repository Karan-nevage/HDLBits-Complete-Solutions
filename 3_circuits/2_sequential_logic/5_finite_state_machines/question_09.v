/*==========================================================================================
 * HDLBits Problem : Design a Moore FSM (water reservoir)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q4
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Water reservoir controller. Sensors s[3:1] (s3 highest). Nominal flow outputs:
 *       Above S3 (s=111): none       Between S2,S1 (s=001): FR1,FR2
 *       Between S3,S2 (s=011): FR1   Below S1 (s=000): FR1,FR2,FR3
 *   So FR1=~s3, FR2=~s2, FR3=~s1. dfr (supplemental) is asserted when the level
 *   fell (previous level higher than current) and held until the next change.
 *   Synchronous reset -> low-for-a-long-time (all four outputs asserted).
 *
 *   NOTE (best-effort): the Moore output timing for dfr vs the FR outputs is subtle;
 *         confirm on HDLBits.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input [3:1] s,
 *       output fr3,
 *       output fr2,
 *       output fr1,
 *       output dfr
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
);

    reg [3:1] level;   // registered water level (Moore state)
    reg       dfr_r;   // 1 if the last level change was downward
    always @(posedge clk) begin
        if (reset) begin
            level <= 3'b000;   // low for a long time
            dfr_r <= 1'b1;     // supplemental on
        end else begin
            if      (s > level) dfr_r <= 1'b0;   // level rose
            else if (s < level) dfr_r <= 1'b1;   // level fell
            // level unchanged -> hold dfr
            level <= s;
        end
    end
    assign fr1 = ~level[3];
    assign fr2 = ~level[2];
    assign fr3 = ~level[1];
    assign dfr = dfr_r;

endmodule
//==========================================================================================
