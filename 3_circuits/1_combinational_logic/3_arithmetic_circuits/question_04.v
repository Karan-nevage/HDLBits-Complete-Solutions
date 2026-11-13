/*==========================================================================================
 * HDLBits Problem : Adder
 * Category        : Circuits -> Combinational Logic -> Arithmetic Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4j
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Assume you have full adders available. Connect them as shown in the
 *   exam diagram to add two 4-bit numbers x and y, producing a 5-bit sum.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [3:0] x,
 *       input  [3:0] y,
 *       output [4:0] sum
 *   );
 */
//==========================================================================================
module top_module (
    input  [3:0] x,
    input  [3:0] y,
    output [4:0] sum
);

    // Using Verilog's built-in addition operator, which infers a ripple-carry adder / adder chain
    assign sum = x + y;

endmodule
//==========================================================================================

//=========================[ Alternative Solution using Full Adders ]=======================
//        module top_module (
//            input [3:0] x,
//            input [3:0] y, 
//            output [4:0] sum);
//        
//            wire [3:0] cout;
//        
//            fadd fa0 (.a(x[0]), .b(y[0]), .cin(1'b0),    .cout(cout[0]), .sum(sum[0]));
//            fadd fa1 (.a(x[1]), .b(y[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
//            fadd fa2 (.a(x[2]), .b(y[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));
//            fadd fa3 (.a(x[3]), .b(y[3]), .cin(cout[2]), .cout(sum[4]), .sum(sum[3]));
//        
//        endmodule
//        
//        //===================>>>  Include the full adder submodule definition <<<=====================
//        module fadd (
//            input a,
//            input b,
//            input cin,
//            output cout,
//            output sum
//        );
//            assign sum = a ^ b ^ cin;
//            assign cout = (a & b) | (a & cin) | (b & cin);
//        
//        endmodule
//==========================================================================================