/*
 * Function: grad_minui_fnc_registerCBASettings
 * Author: DerZade
 *
 * Called by post init. Registers all CBA Settings
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
#define MODDISPLAYNAME "GRAD minui"

if !(isClass(configFile >> "CfgPatches" >> "cba_settings")) exitWith {};

{
  private _component = configName _x;

  {
    private _params = [
      format ["grad_minui_%1_%2", _component, configName _x],
      [_x, "type"] call BIS_fnc_returnConfigEntry,
      [_x, "title"] call BIS_fnc_returnConfigEntry,
      MODDISPLAYNAME,
      call compile ([_x, "valueInfo"] call BIS_fnc_returnConfigEntry),
      2
    ];

    if !(isNull (_x >> "script")) then {
      _params pushBack (call compile ([_x, "script"] call BIS_fnc_returnConfigEntry));
    };

    _params call CBA_Settings_fnc_init;
  } forEach(_x call BIS_fnc_subClasses);


} forEach((configfile >> "grad_minui_cba" >> "settings") call BIS_fnc_subClasses);
