/*==========================================================================================
 * HDLBits Problem : Rule 90
 * Category        : Circuits -> Sequential Logic -> More Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Rule90
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Simulate the 1-D cellular automaton Rule 90 on 512 cells. Each cell's next
 *   state is the XOR of its two neighbours (off-grid neighbours are 0). load
 *   sets the initial state from data; otherwise advance one step per clock.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input load,
 *       input [511:0] data,
 *       output reg [511:0] q
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
);

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= {q[510:0], 1'b0} ^ {1'b0, q[511:1]};  // left XOR right neighbour
    end

endmodule
//==========================================================================================
