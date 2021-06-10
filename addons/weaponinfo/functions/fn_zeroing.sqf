/*
 * Function: grad_minui_fnc_zeroing
 * Author: DerZade
 *
 * Returns players zeroing.
 * This uses an alternative method to calculate the current zeroing if the unit is within a vehicle,
 * because the currentZeroing script command does not work reliably when the unit is in an FFT position.
 * If the unit is within a FFV position the value is read from the ui, which requires to go through
 * multiple displays to find the zeroing control. (At least at the first time this function is called)
 * In those cases this is kind of performance heavy.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Zeroing <NUMBER>
 *
 * Example:
 * [player] call grad_minui_fnc_zeroing;
 *
 * Public: No
 */

params [
	["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith { ["Unit must not be null"] call BIS_fnc_error; };

// use currentZeroing script command when unit is not within vehicle
if (isNull objectParent _unit) exitWith {
    currentZeroing _unit;
};

private _zeroCtrl = uiNamespace getVariable ["grad_minui_zeroingCtrl", controlNull];

if (isNull _zeroCtrl) then {
    // all "RscUnitInfo"-displays
    private _unitInfoDisplays = (uiNamespace getVariable ["IGUI_displays", []]) select {_x getVariable ["BIS_fnc_initDisplay_configClass", ""] isEqualTo "RscUnitInfo"};

    // find the zeroing control in all displays
    {
        private _ctrl = _x displayCtrl 168;
        if (!(isNull _ctrl) && ctrlClassName _ctrl isEqualTo "CA_Zeroing") exitWith {
            uiNamespace setVariable ["grad_minui_zeroingCtrl", _ctrl];
            _zeroCtrl = _ctrl;
        };
    } forEach _unitInfoDisplays;
};

parseNumber (ctrlText _zeroCtrl);
