/*==========================================================================================
 * HDLBits Problem : Combine circuits A and B
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Mt2015_q4
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Using the subcircuits A and B from the two previous problems,
 *   instantiate both and connect them as shown in the exam diagram to
 *   produce the final output z. (Module definitions for A and B are
 *   expected to be provided / instantiated.)
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  x,
 *       input  y,
 *       output z
 *   );
 */
//==========================================================================================
module top_module(
	input x,
	input y,
	output z);

	wire o1, o2, o3, o4;
	
	A ia1 (x, y, o1);
	B ib1 (x, y, o2);
	A ia2 (x, y, o3);
	B ib2 (x, y, o4);
	
	assign z = (o1 | o2) ^ (o3 & o4);

	// Or you could simplify the circuit including the sub-modules:
	// assign z = x|~y;
	
endmodule

//------------------------------------------------------------------------------------------

module A (
	input x,
	input y,
	output z);

	assign z = (x^y) & x;
	
endmodule

//------------------------------------------------------------------------------------------

module B (
	input x,
	input y,
	output z);

	assign z = ~(x^y);

endmodule
//==========================================================================================


//==============================|| Another Method ||========================================
/* module top_module(
	input x,
	input y,
	output z);

	wire o1, o2, o3, o4;
	
	A ia1 (x, y, o1);
	B ib1 (x, y, o2);
	A ia2 (x, y, o3);
	B ib2 (x, y, o4);
	
	assign z = (o1 | o2) ^ (o3 & o4);

	// Or you could simplify the circuit including the sub-modules:
	// assign z = x|~y;
	
endmodule

module A (
	input x,
	input y,
	output z);

	assign z = (x^y) & x;
	
endmodule

module B (
	input x,
	input y,
	output z);

	assign z = ~(x^y);

endmodule
*/