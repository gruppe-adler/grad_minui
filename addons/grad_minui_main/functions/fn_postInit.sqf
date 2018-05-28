/*
 * Function: grad_minui_fnc_postInit
 * Author: DerZade
 *
 * PostInit
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * n/a
 *
 * Public: No
 */

//check wether main menu is open
private _displayClass = (allDisplays select 0) getVariable ["BIS_fnc_initDisplay_configClass", ""];
if ((count allDisplays == 1) && (_displayClass isEqualTo "RscDisplayMain")) exitWith {};

//register keybinds & Settings
[] call grad_minui_fnc_registerCBAKeybinds;
[] call grad_minui_fnc_registerCBASettings;

//register event handlers
player addEventHandler ["SeatSwitchedMan", grad_minui_fnc_EHseatSwitched];
player addEventHandler ["GetInMan", grad_minui_fnc_EHgetIn];
player addEventHandler ["GetOutMan", grad_minui_fnc_EHgetOut];

grad_minui_wepaonInfo_cutlayers = [];

if (isNull objectParent player) then { //on foot
  [player, nil, nil, nil, true] call grad_minui_fnc_EHgetOut;
} else {
  [player, nil, nil, nil, true] call grad_minui_fnc_EHgetIn;
}
