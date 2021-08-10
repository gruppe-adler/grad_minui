/*
 * Function: grad_minui_fnc_canUseWeapon
 * Author: commy2
 *
 * Check if unit can use weapon.
 * This 200 IQ code is borrowed from CBA. (see CBA_fnc_canUseWeapon)
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * can use weapon <BOOL>
 *
 * Example:
 * _ret = [player] call grad_minui_fnc_canUseWeapon;
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

if (isNull objectParent _unit) exitWith {true}; // unit is on foot

private _config = configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit;

isClass _config && {getNumber (_config >> "canPullTrigger") == 1}
