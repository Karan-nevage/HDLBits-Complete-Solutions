/*==========================================================================================
 * HDLBits Problem : D Latch
 * Category        : Circuits -> Sequential Logic -> Latches and Flip-Flops
 * Link            : https://hdlbits.01xz.net/wiki/Exams/m2014_q4a
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   Implement the D latch shown in the exam diagram. The latch is
 *   level-sensitive: q follows d while ena is high and holds otherwise.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input d,
 *       input ena,
 *       output reg q
 *   );
 */
//==========================================================================================
module top_module (
    input d,
    input ena,
    output reg q
);

    // Level-sensitive D latch: q follows d while ena is high, holds otherwise.
    // (A latch is intentionally inferred here.)
    always @(*)
        if (ena)
            q = d;

endmodule
//==========================================================================================
