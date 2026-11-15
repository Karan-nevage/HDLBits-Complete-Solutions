/*==========================================================================================
 * HDLBits Problem : Serial receiver with parity checking
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Fsm_serialdp
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Extend the serial receiver+datapath with odd parity: each byte now has a
 *   parity bit before the stop bit. Assert done only when the parity is correct.
 *   A parity module is provided; reset it before each byte and feed it 'in'.
 *
 *   NOTE (best-effort): the parity-accumulator reset/sample timing is subtle;
 *         confirm on HDLBits.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input in,
 *       input reset,
 *       output [7:0] out_byte,
 *       output done
 *   );
 *
 *   Provided by HDLBits (instantiate; do not redefine):
 *       module parity ( input clk, input reset, input in, output reg odd );  // running odd parity
 */
//==========================================================================================
module top_module (
    input clk,
    input in,
    input reset,
    output [7:0] out_byte,
    output done
);

    parameter IDLE = 0, DATA = 1, PAR = 2, STOP = 3, DONE = 4, WAITE = 5;
    reg [2:0] state, next;
    reg [3:0] cnt;
    reg [7:0] sr;
    wire odd;

    // Accumulate parity only while receiving data + parity bits; reset otherwise
    parity u_par (.clk(clk), .reset(~(state == DATA || state == PAR)), .in(in), .odd(odd));

    always @(*) case (state)
        IDLE:  next = in ? IDLE : DATA;
        DATA:  next = (cnt == 4'd7) ? PAR : DATA;
        PAR:   next = STOP;
        STOP:  next = in ? (odd ? DONE : IDLE) : WAITE;
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
