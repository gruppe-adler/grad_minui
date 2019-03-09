/*
 * Function: grad_minui_fnc_registerCBASettings
 * Author: DerZade
 *
 * Called by post init. Registers all CBA Keybinds
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

if !(isClass(configFile >> "CfgPatches" >> "cba_keybinding")) exitWith {};

{
  private _component = configName _x;

  {
    private _params = [
      MODDISPLAYNAME,
      format ["grad_minui_%1_%2", _component, configName _x],
      [_x, "title"] call BIS_fnc_returnConfigEntry,
      call compile ([_x, "downCode"] call BIS_fnc_returnConfigEntry),
      ""
    ];

    _params call CBA_fnc_addKeybind;
  } forEach(_x call BIS_fnc_subClasses);


} forEach((configfile >> "grad_minui_cba" >> "keybinds") call BIS_fnc_subClasses);
