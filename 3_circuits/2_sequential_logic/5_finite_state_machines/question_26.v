/*==========================================================================================
 * HDLBits Problem : Q3c: FSM logic (Y0 and z)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2014_q3c
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Given the same state-assigned table as Q3b, implement just the next-state bit
 *   Y[0] and the output z as combinational functions of the current state y[2:0]
 *   and input x. (clk is in the port list but unused here.)
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input [2:0] y,
 *       input x,
 *       output Y0,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    reg [2:0] Y;
    always @(*) case (y)
        3'b000: Y = x ? 3'b001 : 3'b000;
        3'b001: Y = x ? 3'b100 : 3'b001;
        3'b010: Y = x ? 3'b001 : 3'b010;
        3'b011: Y = x ? 3'b010 : 3'b001;
        3'b100: Y = x ? 3'b100 : 3'b011;
        default: Y = 3'b000;
    endcase
    assign Y0 = Y[0];
    assign z  = (y == 3'b011) | (y == 3'b100);

endmodule
//==========================================================================================
