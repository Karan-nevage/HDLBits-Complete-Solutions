/*==========================================================================================
 * HDLBits Problem : Counter 1000
 * Category        : Circuits -> Sequential Logic -> Counters
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7b
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   From a 1000 Hz clock, derive a 1 Hz OneHertz pulse (high for exactly one cycle
 *   per second) to enable a wall-clock's counters. Build the /1000 divider from
 *   three provided modulo-10 (BCD) counters, all clocked by the same 1000 Hz clock.
 *   Also output each BCD counter's enable: c_enable[0] fastest ... c_enable[2]
 *   slowest.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       output OneHertz,
 *       output [2:0] c_enable
 *   );
 *
 *   Provided by HDLBits (instantiate; do not redefine):
 *       module bcdcount ( input clk, input reset, input enable, output reg [3:0] Q );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);

    wire [3:0] Q0, Q1, Q2;

    // Each BCD counter advances only when all faster ones are at 9
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (Q0 == 4'd9);
    assign c_enable[2] = (Q0 == 4'd9) & (Q1 == 4'd9);
    assign OneHertz    = (Q0 == 4'd9) & (Q1 == 4'd9) & (Q2 == 4'd9);

    bcdcount counter0 (clk, reset, c_enable[0], Q0);
    bcdcount counter1 (clk, reset, c_enable[1], Q1);
    bcdcount counter2 (clk, reset, c_enable[2], Q2);

endmodule
//==========================================================================================
