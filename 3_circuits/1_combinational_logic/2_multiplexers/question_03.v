/*==========================================================================================
 * HDLBits Problem : 9-to-1 multiplexer
 * Category        : Circuits -> Combinational Logic -> Multiplexers
 * Link            : https://hdlbits.01xz.net/wiki/Mux9to1v
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Create a 16-bit wide 9-to-1 multiplexer. sel chooses one of nine
 *   16-bit inputs (a..i) for sel = 0..8. For sel = 9..15, set all output
 *   bits to 1 ('1).
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [15:0] a, b, c, d, e, f, g, h, i,
 *       input  [3:0] sel,
 *       output [15:0] out
 *   );
 */
//==========================================================================================
module top_module (
    input  [15:0] a, b, c, d, e, f, g, h, i,
    input  [3:0] sel,
    output [15:0] out
);

        assign out = (sel == 4'd0) ? a :
                 (sel == 4'd1) ? b :
                 (sel == 4'd2) ? c :
                 (sel == 4'd3) ? d :
                 (sel == 4'd4) ? e :
                 (sel == 4'd5) ? f :
                 (sel == 4'd6) ? g :
                 (sel == 4'd7) ? h :
                 (sel == 4'd8) ? i : 16'hFFFF;

endmodule
//==========================================================================================

//==================[ Alternative Solution using case statement ]===========================
//    module top_module (
//    	input [15:0] a,
//    	input [15:0] b,
//    	input [15:0] c,
//    	input [15:0] d,
//    	input [15:0] e,
//    	input [15:0] f,
//    	input [15:0] g,
//    	input [15:0] h,
//    	input [15:0] i,
//    	input [3:0] sel,
//    	output logic [15:0] out
//    );
//    
//    	always @(*) begin
//    		out = 16'hFFFF;		
//    
//    		case (sel)
//    			4'h0: out = a;
//    			4'h1: out = b;
//    			4'h2: out = c;
//    			4'h3: out = d;
//    			4'h4: out = e;
//    			4'h5: out = f;
//    			4'h6: out = g;
//    			4'h7: out = h;
//    			4'h8: out = i;
//    		endcase
//    	end
//    
//    endmodule
//==========================================================================================