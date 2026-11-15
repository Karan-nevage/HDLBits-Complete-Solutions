/*==========================================================================================
 * HDLBits Problem : K-map implemented with a multiplexer
 * Category        : Circuits -> Combinational Logic -> Karnaugh Map to Circuit
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q3
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   The 4-variable function is implemented using a 4-to-1 multiplexer
 *   whose select lines are a and b. For each (a, b) combination, the
 *   corresponding mux data input must be driven by a function of c and d
 *   (0, 1, c, d, ~c, ~d, c&d, ...). Determine these and drive mux_in[3:0]
 *   accordingly.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  c,
 *       input  d,
 *       output [3:0] mux_in
 *   );
 */
//==========================================================================================
module top_module (
    input  c,
    input  d,
    output [3:0] mux_in
);

    assign mux_in[0] = c | d;
    assign mux_in[1] = 1'b0;
    assign mux_in[2] = ~ d;
    assign mux_in[3] = c & d;

endmodule
//==========================================================================================

//====================[ Using a 2:1 MUX to implement the function ]=========================
//  module top_module (
//      input c,
//      input d,
//      output [3:0] mux_in
//  ); 
//  
//      assign mux_in[0] = c ? 1'b1 : d;
//      assign mux_in[1] = 1'b0;
//      assign mux_in[2] = d ? 1'b0 : 1'b1;
//      assign mux_in[3] = c ? d : 1'b0;
//  
//  endmodule
//==========================================================================================