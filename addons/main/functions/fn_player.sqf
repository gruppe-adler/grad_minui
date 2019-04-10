/*
 * Function: grad_minui_fnc_player
 * Author: DerZade
 *
 * Returns player unit.
 * This takes the remote controling of a unit into account.
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * Player Unit <OBJECT>
 *
 * Example:
 * [] call grad_minui_fnc_player
 *
 * Public: No
 */

missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player]
