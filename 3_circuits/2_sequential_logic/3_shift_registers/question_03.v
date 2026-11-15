/*==========================================================================================
 * HDLBits Problem : Left/right arithmetic shift by 1 or 8
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Shift18
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a 64-bit arithmetic shift register with synchronous load. load loads
 *   data. ena enables shifting; amount[1:0] selects: left by 1, left by 8, right
 *   by 1, right by 8. Arithmetic right shift replicates the sign bit q[63].
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input load,
 *       input ena,
 *       input [1:0] amount,
 *       input [63:0] data,
 *       output reg [63:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q
);

    always @(posedge clk) begin
        if (load)
            q <= data;
        else if (ena) begin
            case (amount)
                2'b00: q <= {q[62:0], 1'b0};         // shift left by 1
                2'b01: q <= {q[55:0], 8'b0};         // shift left by 8
                2'b10: q <= {q[63], q[63:1]};        // arithmetic right by 1
                2'b11: q <= {{8{q[63]}}, q[63:8]};   // arithmetic right by 8
            endcase
        end
    end

endmodule
//==========================================================================================
