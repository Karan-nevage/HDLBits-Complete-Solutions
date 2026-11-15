/*==========================================================================================
 * HDLBits Problem : 12-hour clock
 * Category        : Circuits -> Sequential Logic -> Counters
 * Link            : https://hdlbits.01xz.net/wiki/Count_clock
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a 12-hour time-of-day clock with hours (hh, BCD 1-12), minutes (mm),
 *   seconds (ss) and a pm flag. It advances only when ena is high; reset is
 *   synchronous and sets the time to 12:00:00 AM.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input ena,
 *       output reg pm,
 *       output reg [7:0] hh,
 *       output reg [7:0] mm,
 *       output reg [7:0] ss
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    // Increment a two-digit BCD value (ones in [3:0], tens in [7:4])
    function [7:0] bcd_inc;
        input [7:0] v;
        begin
            if (v[3:0] == 4'd9) bcd_inc = {v[7:4] + 4'd1, 4'd0};
            else                bcd_inc = {v[7:4], v[3:0] + 4'd1};
        end
    endfunction

    wire sec_wrap = (ss == 8'h59);
    wire min_wrap = (mm == 8'h59);

    always @(posedge clk) begin
        if (reset) begin
            pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
        end else if (ena) begin
            ss <= sec_wrap ? 8'h00 : bcd_inc(ss);
            if (sec_wrap)
                mm <= min_wrap ? 8'h00 : bcd_inc(mm);
            if (sec_wrap && min_wrap) begin
                hh <= (hh == 8'h12) ? 8'h01 : bcd_inc(hh);
                if (hh == 8'h11) pm <= ~pm;   // 11 -> 12 flips AM/PM
            end
        end
    end

endmodule
//==========================================================================================
