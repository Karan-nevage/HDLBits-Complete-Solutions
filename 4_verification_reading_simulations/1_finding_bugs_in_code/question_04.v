/*==========================================================================================
 * HDLBits Problem : Add/sub (with zero flag)
 * Category        : Verification: Reading Simulations -> Finding Bugs in Code
 * Link            : https://hdlbits.01xz.net/wiki/Bugs_addsubz
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   This 8-bit adder-subtractor with a zero flag does not work. Find and fix the
 *   bug(s). do_sub=0 computes a+b, do_sub=1 computes a-b; result_is_zero is 1 when
 *   the result out is zero.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   // synthesis verilog_input_version verilog_2001
 *   module top_module (
 *       input do_sub,
 *       input [7:0] a,
 *       input [7:0] b,
 *       output reg [7:0] out,
 *       output reg result_is_zero
 *   );
 */
//==========================================================================================
// synthesis verilog_input_version verilog_2001
module top_module (
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);

    always @(*) begin
        out = do_sub ? (a - b) : (a + b);
        result_is_zero = (out == 8'b0);
    end

endmodule
//==========================================================================================
