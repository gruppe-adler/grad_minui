/*
 * Function: grad_minui_fnc_EHseatSwitched
 * Author: DerZade
 *
 * Triggered by SeatSwitchedMan-EH
 * For more detailed info see: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#SeatSwitchedMan
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */

params ["_unit"];

//if unit isn't on a FFV position only the handler has to be removed
if !([_unit] call grad_minui_fnc_isFFV) exitWith {
  [] call grad_minui_fnc_hideWeaponInfo;
  if (grad_minui_ffv) then {
    ["grad_minui_veh", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    grad_minui_ffv = false;
  };
};

//show info if player switched from non FFV to FFV and setting is enabled
if (!(grad_minui_ffv) && ['weaponInfo_showOnGetIn'] call grad_minui_fnc_setting && isTurnedOut _unit) then {
  ["all"] call grad_minui_fnc_showWeaponInfo;
};

grad_minui_mode = currentWeaponMode _unit;
grad_minui_muzzle = currentMuzzle _unit;
grad_minui_throwable = currentThrowable _unit;
grad_minui_zeroing = [] call grad_minui_fnc_FFVzeroing;
grad_minui_ffv = true;

["grad_minui_veh", "onEachFrame", grad_minui_fnc_onEachFrameFFV] call BIS_fnc_addStackedEventHandler;
