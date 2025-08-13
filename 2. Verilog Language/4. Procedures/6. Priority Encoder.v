// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos
);

    always @(*) begin
        case (in)
            4'h0: pos = 2'd0;                                           // No bits high
            4'h1, 4'h3, 4'h5, 4'h7, 4'h9, 4'hb, 4'hd, 4'hf: pos = 2'd0; // Bit 0 is high
            4'h2, 4'h6, 4'ha, 4'he: pos = 2'd1;                         // Bit 1 is high (bit 0 low)
            4'h4, 4'hc: pos = 2'd2;                                     // Bit 2 is high (bits 1,0 low)
            4'h8: pos = 2'd3;                                           // Bit 3 is high (bits 2,1,0 low)
            default: pos = 2'd0;                                        // Default case (though all cases covered)
        endcase
    end

endmodule
