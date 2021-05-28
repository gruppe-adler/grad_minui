/*
 * Function: grad_minui_fnc_deInitUnit
 * Author: DerZade
 *
 * Initialize given unit. Add EHs and call GetIn / Out EH depending on if unit is in a vehicle or not. 
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

params ["_unit"];

// we don't need to add EHS if the unit already has them
if (count (_unit getVariable ["grad_minui_EHIDs", []]) isEqualTo 0) then {
    private _ssEH = _unit addEventHandler ["SeatSwitchedMan", grad_minui_fnc_EHseatSwitched];
    private _giEH = _unit addEventHandler ["GetInMan", grad_minui_fnc_EHgetIn];
    private _goEH = _unit addEventHandler ["GetOutMan", grad_minui_fnc_EHgetOut];

    _unit setVariable ["grad_minui_EHIDs", [_ssEH, _giEH, _goEH]];
};

if (isNull objectParent _unit) then {
    //on foot
    [_unit, nil, nil, nil, true] call grad_minui_fnc_EHgetOut;
} else {
    //in vehicle
    [_unit, nil, nil, nil, true] call grad_minui_fnc_EHgetIn;
}