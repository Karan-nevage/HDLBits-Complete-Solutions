/*==========================================================================================
 * HDLBits Problem : Q3b: FSM (from state-assigned table)
 * Category        : Circuits -> Sequential Logic -> Finite State Machines
 * Link            : https://hdlbits.01xz.net/wiki/Exams/2014_q3bfsm
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the FSM from the given state-assigned table. Reset (synchronous) goes
 *   to state 000.
 *       y     | Y(x=0) | Y(x=1) | z
 *       000   |  000   |  001   | 0
 *       001   |  001   |  100   | 0
 *       010   |  010   |  001   | 0
 *       011   |  001   |  010   | 1
 *       100   |  011   |  100   | 1
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input clk,
 *       input reset,
 *       input x,
 *       output z
 *   );
 */
//==========================================================================================
module top_module (
    input clk,
    input reset,
    input x,
    output z
);

    reg [2:0] y, Y;
    always @(*) case (y)
        3'b000: Y = x ? 3'b001 : 3'b000;
        3'b001: Y = x ? 3'b100 : 3'b001;
        3'b010: Y = x ? 3'b001 : 3'b010;
        3'b011: Y = x ? 3'b010 : 3'b001;
        3'b100: Y = x ? 3'b100 : 3'b011;
        default: Y = 3'b000;
    endcase
    always @(posedge clk)
        if (reset) y <= 3'b000;
        else       y <= Y;
    assign z = (y == 3'b011) | (y == 3'b100);

endmodule
//==========================================================================================
