/*
 * Function: grad_minui_fnc_isFFV
 * Author: DerZade
 *
 * Chechs wether given unit is in a FFV turret
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * is in FFV Turret <BOOL>
 *
 * Example:
 * _ret = [player] call grad_minui_fnc_isFFV;
 *
 * Public: No
 */

params ["_unit"];

private _veh = objectParent _unit;

if (isNull _veh) exitWith {false}; //unit is on foot

private _isFFV = false;
{
    _x params ["_curUnit","","","","_personTurret"];
    if (_unit isEqualTo _curUnit) exitWith {_isFFV = _personTurret};
} forEach (fullCrew _veh);

_isFFV
