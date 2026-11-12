/*==========================================================================================
 * HDLBits Problem : Thermostat
 * Category        : Circuits -> Combinational Logic -> Basic Gates
 * Link            : https://hdlbits.01xz.net/wiki/Thermostat
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   A heating/cooling thermostat controls both a heater and an air
 *   conditioner, plus a blower fan.
 *     - In heating mode (mode = 1): turn on heater when too_cold.
 *     - In cooling mode (mode = 0): turn on aircon when too_hot.
 *     - The fan runs whenever heater or aircon is on, OR when the user
 *       requests it directly via fan_on.
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module (
 *       input  too_cold,
 *       input  too_hot,
 *       input  mode,
 *       input  fan_on,
 *       output heater,
 *       output aircon,
 *       output fan
 *   );
 */
//==========================================================================================
module top_module (
    input  too_cold,
    input  too_hot,
    input  mode,
    input  fan_on,
    output heater,
    output aircon,
    output fan
);

    assign heater = mode & too_cold;
    assign aircon = ~mode & too_hot;
    assign fan    = fan_on | heater | aircon;

endmodule
//==========================================================================================
