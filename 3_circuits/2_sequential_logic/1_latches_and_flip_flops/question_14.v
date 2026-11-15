/*==========================================================================================
 * HDLBits Problem : Create circuit from truth table
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q7
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   A JK flip-flop has the given characteristic truth table. Implement it
 *   using a D flip-flop plus logic:
 *       j k | Q(next)
 *       0 0 |   Q      (hold)
 *       0 1 |   0      (reset)
 *       1 0 |   1      (set)
 *       1 1 |  ~Q      (toggle)
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input j,
 *       input k,
 *       output reg Q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input j,
    input k,
    output reg Q
);

    always @(posedge clk) begin
        case ({j, k})
            2'b00: Q <= Q;       // hold
            2'b01: Q <= 1'b0;    // reset
            2'b10: Q <= 1'b1;    // set
            2'b11: Q <= ~Q;      // toggle
        endcase
    end

endmodule
//==========================================================================================
