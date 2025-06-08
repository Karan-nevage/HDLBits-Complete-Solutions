module top_module( 
    input [31:0] in,
    output reg [31:0] out ); 
    
    assign out[31:24] = in[ 7: 0];	
	assign out[23:16] = in[15: 8];	
	assign out[15: 8] = in[23:16];	
	assign out[ 7: 0] = in[31:24];	
    
    // This can be possible
    //assign out = {in[7:0], in[15:8], in[23:16], in[31:24]}; 
    
endmodule
