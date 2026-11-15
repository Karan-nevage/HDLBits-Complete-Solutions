/*==========================================================================================
 * HDLBits Problem : Counter 1-12
 * Category        : Circuits -> Sequential Logic -> Counters
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7a
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Design a counter that counts 1 to 12 (for a clock) using the provided 4-bit
 *   binary counter count4, which has enable and synchronous load (load has higher
 *   priority than enable). Reset is synchronous and forces the counter to 1.
 *   Drive the counter's enable, load and load-data inputs (exposed as c_enable,
 *   c_load, c_d) and output its value on Q.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input enable,
 *       output [3:0] Q,
 *       output c_enable,
 *       output c_load,
 *       output [3:0] c_d
 *   );
 *
 *   Provided by HDLBits (instantiate; do not redefine):
 *       module count4 ( input clk, input enable, input load, input [3:0] d, output reg [3:0] Q );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

    // Control signals for the provided count4 (load has priority over enable)
    assign c_enable = enable;
    assign c_load   = reset | (enable & (Q == 4'd12));  // force 1 on reset, wrap 12 -> 1
    assign c_d      = 4'd1;

    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule
//==========================================================================================
