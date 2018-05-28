/*
 * Function: grad_minui_fnc_FFVzeroing
 * Author: DerZade
 *
 * Returns players zeroing while unit is FFV (currentZeroing player always returns 0). The value is read
 * from the ui, which requires to go through multiple displays to find the zeroing control. (At least at
 * the first time this function is called) This is kind of performance heavy, so only use this in cases
 * where currentZeroing is not working.
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call grad_minui_fnc_FFVzeroing;
 *
 * Public: No
 */

disableSerialization;

private _zeroCtrl = uiNamespace getVariable ["grad_minui_zeroingCtrl", controlNull];

if (isNull _zeroCtrl) then {
  //all "RscUnitInfo"-displays
  private _unitInfoDisplays = (uiNamespace getVariable ["IGUI_displays", []]) select {_x getVariable ["BIS_fnc_initDisplay_configClass", ""] == "RscUnitInfo"};

  //find the zeroing control in all displays
  {
    private _ctrl = _x displayCtrl 168;
    if (!(isNull _ctrl) && ctrlClassName _ctrl isEqualTo "CA_Zeroing") exitWith {
      uiNamespace setVariable ["grad_minui_zeroingCtrl", _ctrl];
      _zeroCtrl = _ctrl;
    };
  } forEach _unitInfoDisplays;
};

parseNumber (ctrlText _zeroCtrl);
