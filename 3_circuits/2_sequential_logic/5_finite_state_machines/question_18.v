/*==========================================================================================
 * HDLBits Problem : Serial receiver and datapath
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm_serialdata
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Extend the serial receiver with a datapath that assembles the 8 data bits
 *   (LSB first) into out_byte, valid when done is asserted.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input in,
 *       input reset,
 *       output [7:0] out_byte,
 *       output done
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input in,
    input reset,
    output [7:0] out_byte,
    output done
);

    parameter IDLE = 0, DATA = 1, STOP = 2, DONE = 3, WAITE = 4;
    reg [2:0] state, next;
    reg [3:0] cnt;
    reg [7:0] sr;
    always @(*) case (state)
        IDLE:  next = in ? IDLE : DATA;
        DATA:  next = (cnt == 4'd7) ? STOP : DATA;
        STOP:  next = in ? DONE : WAITE;
        DONE:  next = in ? IDLE : DATA;
        WAITE: next = in ? IDLE : WAITE;
        default: next = IDLE;
    endcase
    always @(posedge clk) begin
        if (reset) begin state <= IDLE; cnt <= 0; end
        else begin
            state <= next;
            if (next == DATA) cnt <= (state == DATA) ? cnt + 1'b1 : 0;
            else              cnt <= 0;
        end
        if (state == DATA) sr <= {in, sr[7:1]};   // LSB first
    end
    assign done = (state == DONE);
    assign out_byte = sr;

endmodule
//==========================================================================================
