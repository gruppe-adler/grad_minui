/*
 * Function: grad_minui_fnc_EHgetOut
 * Author: DerZade
 *
 * Triggered by GetOutMan-EH
 * For more detailed info see: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#GetOutMan
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

params ["_unit", "", "", "", ["_postInit", false]];

//show all info upon spawn
if (['weaponInfo_showOnGetOut'] call grad_minui_fnc_setting || _postInit) then {
  ["all"] call grad_minui_fnc_showWeaponInfo;
};

if !(isNil "grad_minui_ffv") then {
  if (grad_minui_ffv) then {
    ["grad_minui_veh", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
  };
};

//update variables
grad_minui_mode = currentWeaponMode _unit;
grad_minui_muzzle = currentMuzzle _unit;
grad_minui_throwable = currentThrowable player;
grad_minui_zeroing = currentZeroing _unit;
grad_minui_magazine = currentMagazine _unit;
grad_minui_ffv = false;

//init onEachFrame-Handler
["grad_minui", "onEachFrame", grad_minui_fnc_onEachFrame] call BIS_fnc_addStackedEventHandler;
