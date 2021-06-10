/*
 * Function: grad_minui_fnc_EHseatSwitched
 * Author: DerZade
 *
 * Triggered by SeatSwitchedMan-EH
 * For more detailed info see: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#SeatSwitchedMan
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith { ["Unit must not be null"] call BIS_fnc_error; };

// if unit isn't on a FFV position only the handler has to be removed
if !([_unit] call grad_minui_fnc_isFFV) exitWith {
    ["grad_minui_weaponInfo", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    [] call grad_minui_fnc_hideWeaponInfo;
};

// show info to player if desired
if (['weaponInfo_showOnGetIn'] call grad_minui_fnc_setting) then {
    ["all"] call grad_minui_fnc_showWeaponInfo;
};

grad_minui_mode = currentWeaponMode _unit;
grad_minui_muzzle = currentMuzzle _unit;
grad_minui_throwable = currentThrowable _unit;
grad_minui_zeroing = [_unit] call grad_minui_fnc_zeroing;

// We don't care if there is already a handler, adding same type of EH with the same id will overwrite existing.
["grad_minui_weaponInfo", "onEachFrame", grad_minui_fnc_onEachFrameWeaponInfo] call BIS_fnc_addStackedEventHandler;
