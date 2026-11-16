/*==========================================================================================
 * HDLBits Problem : Counter with period 1000
 * Category        : Circuits -> Building Larger Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/review2015_count1k
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Build a counter that counts from 0 to 999 inclusive, with a period of 1000
 *   cycles. The reset input is synchronous and resets the counter to 0.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       output [9:0] q);
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    always @(posedge clk) begin             // Check for rising edge of clock
        
        if (reset) begin                    // Check for reset signal
           q <= 10'b0;            
        end
        else if (q>998) begin               // Check if counter has reached 999
            q <= 10'b0;
        end
        else begin
            q <= q + 1;
        end        
    end

endmodule
//==========================================================================================
