/*==========================================================================================
 * HDLBits Problem : Signed addition overflow
 * Category        : Circuits -> Combinational Logic -> Arithmetic Circuits
 * Link            : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q1c
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Add two 8-bit two's-complement numbers a and b. Produce the 8-bit sum
 *   s, and an overflow output that is 1 when signed (two's-complement)
 *   overflow occurs, and 0 otherwise.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  [7:0] a,
 *       input  [7:0] b,
 *       output [7:0] s,
 *       output overflow
 *   );
 */
//==========================================================================================
module top_module (
    input  [7:0] a,
    input  [7:0] b,
    output [7:0] s,
    output overflow
);
   //-----------------------------------------------------------------------------------------
   //   An overflow in signed addition occurs when two positive numbers add up to a negative 
   //   number, or two negative numbers add up to a positive number. In hardware, this is 
   //   easily detected by checking if the carry-in and carry-out of the sign bit 
   //   (the MSB, bit 7) are different
   //-----------------------------------------------------------------------------------------
    
    assign s = a + b;

    assign overflow = (  (a[7] & b[7] & ~s[7])   |  (~a[7] & ~b[7] & s[7])  );

endmodule
//==========================================================================================
