/*==========================================================================================
 * HDLBits Problem : PS/2 packet parser and datapath
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm_ps2data
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Extend the PS/2 parser with a datapath: when done is asserted, out_bytes holds
 *   the three received bytes, with the first byte in out_bytes[23:16].
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input [7:0] in,
 *       input reset,
 *       output [23:0] out_bytes,
 *       output done
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input [7:0] in,
    input reset,
    output [23:0] out_bytes,
    output done
);

    parameter B1 = 0, B2 = 1, B3 = 2, DONE = 3;
    reg [1:0] state, next;
    reg [23:0] data;
    always @(*) case (state)
        B1:   next = in[3] ? B2 : B1;
        B2:   next = B3;
        B3:   next = DONE;
        DONE: next = in[3] ? B2 : B1;
    endcase
    always @(posedge clk) begin
        if (reset) state <= B1;
        else       state <= next;
        data <= {data[15:0], in};   // shift each incoming byte in
    end
    assign done = (state == DONE);
    assign out_bytes = data;        // valid when done is high

endmodule
//==========================================================================================
