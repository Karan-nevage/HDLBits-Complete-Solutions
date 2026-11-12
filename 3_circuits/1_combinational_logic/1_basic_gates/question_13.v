/*==========================================================================================
 * HDLBits Problem : Ring or vibrate?
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Ringer
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   A cellphone must ring or vibrate on an incoming call:
 *     - If vibrate_mode = 0 and ring = 1 -> ring the ringer (ringer = 1).
 *     - If vibrate_mode = 1 and ring = 1 -> vibrate the motor (motor = 1).
 *     - If ring = 0 -> both outputs are 0.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  ring,
 *       input  vibrate_mode,
 *       output ringer,   // Make sound
 *       output motor     // Vibrate
 *   );
 */
//==========================================================================================
module top_module (
    input  ring,
    input  vibrate_mode,
    output ringer,   // Make sound
    output motor     // Vibrate
);

    assign ringer = ring & ~vibrate_mode;
    assign motor  = ring & vibrate_mode;

endmodule
//==========================================================================================
