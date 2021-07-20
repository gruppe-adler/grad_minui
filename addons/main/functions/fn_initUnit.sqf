/*
 * Function: grad_minui_fnc_initUnit
 * Author: DerZade
 *
 * Initialize given unit. Add EHs and call GetIn / Out EH depending on if unit is in a vehicle or not. 
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

diag_log text format ["[GRAD] (minui) INFO: Initializing new unit: %1", _unit];

if ((_unit getVariable ["grad_minui_EHIDs", []]) isEqualTo []) then {
    private _ssEH = _unit addEventHandler ["SeatSwitchedMan", grad_minui_fnc_EHseatSwitched];
    private _giEH = _unit addEventHandler ["GetInMan", grad_minui_fnc_EHgetIn];
    private _goEH = _unit addEventHandler ["GetOutMan", grad_minui_fnc_EHgetOut];

    _unit setVariable ["grad_minui_EHIDs", [_ssEH, _giEH, _goEH]];
};

if (isNull objectParent _unit) then {
    //on foot
    [_unit] call grad_minui_fnc_EHgetOut;
} else {
    //in vehicle
    [_unit] call grad_minui_fnc_EHgetIn;
};

["all"] call grad_minui_fnc_showWeaponInfo;