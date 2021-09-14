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

// check whether main menu is open
private _displayClass = (allDisplays select 0) getVariable ["BIS_fnc_initDisplay_configClass", ""];
if ((count allDisplays isEqualTo 1) && (_displayClass isEqualTo "RscDisplayMain")) exitWith {};

// check whether VN main menu is open
if (missionNamespace getVariable ["vn_cinematic_running", false]) exitWith {};

grad_minui_wepaonInfo_cutlayers = [];
grad_minui_player = objNull;
