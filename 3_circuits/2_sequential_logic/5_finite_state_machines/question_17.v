/*==========================================================================================
 * HDLBits Problem : Serial receiver
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm_serial
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Serial receiver: line idle = 1, start bit = 0, 8 data bits, stop bit = 1.
 *   Assert done for one cycle after a correctly framed byte. On a framing error
 *   (stop bit not 1), wait until the line returns to 1 before looking for the next
 *   start bit. reset is synchronous.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input in,
 *       input reset,
 *       output done
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input in,
    input reset,
    output done
);

    parameter IDLE = 0, DATA = 1, STOP = 2, DONE = 3, WAITE = 4;
    reg [2:0] state, next;
    reg [3:0] cnt;
    always @(*) case (state)
        IDLE:  next = in ? IDLE : DATA;      // start bit = 0
        DATA:  next = (cnt == 4'd7) ? STOP : DATA;
        STOP:  next = in ? DONE : WAITE;     // stop bit must be 1
        DONE:  next = in ? IDLE : DATA;      // allow back-to-back frames
        WAITE: next = in ? IDLE : WAITE;     // wait for line idle after error
        default: next = IDLE;
    endcase
    always @(posedge clk) begin
        if (reset) begin state <= IDLE; cnt <= 0; end
        else begin
            state <= next;
            if (next == DATA) cnt <= (state == DATA) ? cnt + 1'b1 : 0;
            else              cnt <= 0;
        end
    end
    assign done = (state == DONE);

endmodule
//==========================================================================================
