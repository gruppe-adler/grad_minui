/*
 * Function: grad_minui_fnc_disableWeaponInfo
 * Author: DerZade
 *
 * Disable weapon info. This force hides the weapon info.
 * and removes the onEachFrame eventhandler.
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call grad_minui_fnc_disableWeaponInfo;
 *
 * Public: No
 */

[] call grad_minui_fnc_hideWeaponInfo;

// this will silently fail if there was no event hadler with given id and type
["grad_minui_weaponInfo", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;