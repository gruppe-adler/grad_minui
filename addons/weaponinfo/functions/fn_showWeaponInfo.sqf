/*
 * Function: grad_minui_fnc_showWeaponInfo
 * Author: DerZade
 *
 * Shows given info type ("mode"/"zeroing"/"throwable","muzzle","all")
 * "muzzle" shows zeroing and weaponMode
 *
 * Arguments:
 * 0: info type <STRING>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * ["zeroing"] call grad_minui_fnc_showWeaponInfo;
 *
 * Public: No
 */

#define DASH_025 "<img image='x\grad_minui\addons\weaponInfo\data\dash25_ca.paa' />"
#define DASH_100 "<img image='x\grad_minui\addons\weaponInfo\data\dash100_ca.paa' />"

params ["_type"];

switch (toLower _type) do {
  case ("all"): {
    ["mode"] call grad_minui_fnc_showWeaponInfo;
    ["zeroing"] call grad_minui_fnc_showWeaponInfo;
    ["throwable"] call grad_minui_fnc_showWeaponInfo;
  };
  case ("mode"): { //********************************************************** MODE ****************************************************************
    if (currentWeaponMode grad_minui_player isEqualType 0) exitWith {};

    private _currentWeaponMode = tolower currentWeaponMode grad_minui_player;
    private _currentWeapon = tolower currentWeapon grad_minui_player;
    private _currentMuzzle = toLower currentMuzzle grad_minui_player;

    //dashes
    private _text = switch (_currentWeaponMode) do {
      case ("single"): {
        ([DASH_025, DASH_025, DASH_025, DASH_025, DASH_100] joinString "");
      };
      case ("burst"): {
        ([DASH_025, DASH_025, DASH_025, DASH_100, DASH_100] joinString "");
      };
      case ("fullauto"): {
        ([DASH_100, DASH_100, DASH_100, DASH_100, DASH_100] joinString "");
      };
      //if the weaponmode is non of the above we will check the config
      default {
        switch (getText (configFile >> "CfgWeapons" >> (currentMuzzle grad_minui_player) >> _currentWeaponMode >> "textureType")) do {
          case ("semi"): {
            ([DASH_025, DASH_025, DASH_025, DASH_025, DASH_100] joinString "");
          };
          case ("dual"): {
            ([DASH_025, DASH_025, DASH_025, DASH_100, DASH_100] joinString "");
          };
          case ("full"): {
            ([DASH_100, DASH_100, DASH_100, DASH_100, DASH_100] joinString "");
          };
          default {
            ([DASH_025, DASH_025, DASH_025, DASH_025, DASH_025] joinString "");
          };
        };
      };
    };

    //ace safemode
    if (isClass(configFile >> "CfgPatches" >> "ace_safemode")) then {
      private _safedWeapons = +(grad_minui_player getVariable ["ACE_safemode_safedWeapons",[]]);
      _safedWeapons = _safedWeapons apply {toLower _x};
      if (_currentWeapon in _safedWeapons) then {

        //ace needs some time to update the variable so in the worst case the weapon will be displayed as safed although it isn't
        //so we're going to check for the next 0.1 seconds and call this function again if anything changed
        [{!((_this select 0) isEqualTo ((_this select 1) getVariable ["ACE_safemode_safedWeapons",[]]))}, {["mode"] remoteExec ["grad_minui_fnc_showWeaponInfo", (_this select 1)];}, [_safedWeapons, grad_minui_player], 0.2, {}] call CBA_fnc_waitUntilAndExecute;
        _text = [DASH_025, DASH_025, DASH_025, DASH_025, DASH_025] joinString "";
      };
    };

    //add muzzle and magazine to weapon mode if is other than primary muzzle of weapon (= is under barrel weapon)
    if !(_currentMuzzle isEqualTo _currentWeapon) then {
      _text = format ["%1   %2", getText (configFile >> "CfgWeapons" >> _currentWeapon >> _currentMuzzle >> "displayName"), _text];

      //add magazine info if any is loaded
      private _mag = getText(configFile >> "CfgMagazines" >> (currentMagazine grad_minui_player) >> "DisplayNameShort");
      if (_mag != "") then {
        _text = format ["%1     |     %2", _mag, _text];
      };
    };

    //no mag loaded == red text
    if (currentMagazine grad_minui_player isEqualTo "") then {
      _text = format ["<t color='#BB0000'>%1</t>",_text];
    };

    ["weaponMode", _text] call grad_minui_fnc_createWeaponInfoDisplay;
  };
  case ("zeroing"): { //******************************************************* ZEROING *************************************************************
    private _text = format["<br/>%1m", currentZeroing grad_minui_player];

    if !(isNull objectParent grad_minui_player) then {
      _text = format["<br/>%1m", [] call grad_minui_fnc_FFVzeroing];
    };

    ["zeroing", _text] call grad_minui_fnc_createWeaponInfoDisplay;
  };
  case ("throwable"): { //***************************************************** THROWABLE ***********************************************************
    private _currentThrowable = currentThrowable grad_minui_player;
    private _text = if (_currentThrowable isEqualTo []) then {
      "<br/><t color='#BB0000'>NONE</t><t color='#00ffffff'>     0000m</t>";
    } else {
      format["<br/>%1<t color='#00ffffff'>     0000m</t>", getText (configFile >> "CfgMagazines" >> _currentThrowable select 0 >> "displayNameShort")];
    };

    ["throwable", _text] call grad_minui_fnc_createWeaponInfoDisplay;
  };
  case ("magazine"): { //****************************************************** MAGAZINE ************************************************************
    _mag = getText(configFile >> "CfgMagazines" >> (currentMagazine grad_minui_player) >> "DisplayNameShort");
    if (_mag == "") exitWith{};

    //layer "weaponMode" to make sure this gets overwritten by the weaponMode display because this also shows the magazine
    ["weaponMode", _mag] call grad_minui_fnc_createWeaponInfoDisplay;
  };
  case ("muzzle"): { //******************************************************** MUZZLE **************************************************************
    ["mode"] call grad_minui_fnc_showWeaponInfo;
    ["zeroing"] call grad_minui_fnc_showWeaponInfo;
  };
};
