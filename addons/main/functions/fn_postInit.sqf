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
if ((count allDisplays isEqualTo 1) && (_displayClass isEqualTo "RscDisplayMain")) exitWith {};

grad_minui_wepaonInfo_cutlayers = [];
grad_minui_player = objNull;
grad_minui_ffv = false;

["grad_minui_main", "onEachFrame", grad_minui_fnc_onEachFrameMain] call BIS_fnc_addStackedEventHandler;