/*==========================================================================================
 * HDLBits Problem : 3-input LUT
 * Category        : Circuits -> Sequential Logic -> Shift Registers
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q12
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build an 8-bit shift register (Q[0]..Q[7]) used as a 3-input look-up table.
 *   Serial input S feeds Q[0] (MSB shifted in first) and shifts toward Q[7] when
 *   enable is high. Three address inputs A,B,C select the output: when ABC=000
 *   Z=Q[0], ABC=001 Z=Q[1], ... (A is the MSB of the address).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input enable,
 *       input S,
 *       input A, B, C,
 *       output Z
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z
);

    reg [7:0] Q;

    always @(posedge clk) begin
        if (enable)
            Q <= {Q[6:0], S};   // S enters Q[0], shift toward Q[7]
    end

    assign Z = Q[{A, B, C}];    // 8:1 mux addressed by {A,B,C} (A = MSB)

endmodule
//==========================================================================================
