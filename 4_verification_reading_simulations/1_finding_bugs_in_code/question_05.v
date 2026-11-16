/*==========================================================================================
 * HDLBits Problem : Case statement (scancode)
 * Category        : Verification: Reading Simulations -> Finding Bugs in Code
 * Link            : https://hdlbits.01xz.net/wiki/Bugs_case
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   This circuit maps 8-bit keyboard scancodes for keys 0-9 to out[3:0] and sets
 *   valid=1 when a recognized scancode is seen (0 otherwise). It does not work;
 *   find and fix the bug(s).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input [7:0] code,
 *       output reg [3:0] out,
 *       output reg valid=1 );
 */
//==========================================================================================
module top_module (
    input [7:0] code,
    output reg [3:0] out,
    output reg valid=1 );

    always @(*) begin
        valid = 1'b1;
        case (code)
            8'h45: out = 4'd0;
            8'h16: out = 4'd1;
            8'h1e: out = 4'd2;
            8'h26: out = 4'd3;
            8'h25: out = 4'd4;
            8'h2e: out = 4'd5;
            8'h36: out = 4'd6;
            8'h3d: out = 4'd7;
            8'h3e: out = 4'd8;
            8'h46: out = 4'd9;
            default: begin
                out = 4'd0;
                valid = 1'b0;
            end
        endcase
    end

endmodule
//==========================================================================================
