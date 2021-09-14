/*
 * Function: grad_minui_fnc_enableWeaponInfo
 * Author: DerZade
 *
 * Enable weapon info.
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call grad_minui_fnc_enableWeaponInfo;
 *
 * Public: No
 */

if (isNull grad_minui_player) exitWith { ["must not be null"] call BIS_fnc_error; };

// update variables
grad_minui_mode = currentWeaponMode grad_minui_player;
grad_minui_muzzle = currentMuzzle grad_minui_player;
grad_minui_throwable = currentThrowable grad_minui_player;
grad_minui_zeroing = [grad_minui_player] call grad_minui_fnc_zeroing;
grad_minui_magazine = currentMagazine grad_minui_player;

// We don't care if there is already a handler, adding same type of EH with the same id will overwrite existing.
["grad_minui_weaponInfo", "onEachFrame", grad_minui_fnc_onEachFrameWeaponInfo] call BIS_fnc_addStackedEventHandler;
