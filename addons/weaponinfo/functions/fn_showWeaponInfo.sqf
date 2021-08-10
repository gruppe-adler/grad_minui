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

#define QUOTE(var) #var

#define DASH_025 <img image='x\grad_minui\addons\weaponInfo\data\dash_25_ca.paa' />
#define DASH_100 <img image='x\grad_minui\addons\weaponInfo\data\dash_100_ca.paa' />
#define DASH_DOUBLE <img image='x\grad_minui\addons\weaponInfo\data\dash_double_ca.paa' />
#define DASH_OVERFLY <img image='x\grad_minui\addons\weaponInfo\data\dash_overfly_ca.paa' />
#define DASH_TOPDOWN <img image='x\grad_minui\addons\weaponInfo\data\dash_topdown_ca.paa' />

#define WEAPON_MODE(dash1,dash2,dash3,dash4,dash5) dash1##dash2##dash3##dash4##dash5

#define MODE_SINGLE QUOTE(WEAPON_MODE(DASH_025,DASH_025,DASH_025,DASH_025,DASH_100))
#define MODE_BURST QUOTE(WEAPON_MODE(DASH_025,DASH_025,DASH_100,DASH_100,DASH_100))
#define MODE_DUAL QUOTE(WEAPON_MODE(DASH_025,DASH_025,DASH_025,DASH_100,DASH_100))
#define MODE_FULL QUOTE(WEAPON_MODE(DASH_100,DASH_100,DASH_100,DASH_100,DASH_100))
#define MODE_SAFE QUOTE(WEAPON_MODE(DASH_025,DASH_025,DASH_025,DASH_025,DASH_025))
#define MODE_UNKNOWN QUOTE(WEAPON_MODE(DASH_025,DASH_025,DASH_025,DASH_025,DASH_025))
#define MODE_FAST QUOTE(WEAPON_MODE(DASH_DOUBLE,DASH_DOUBLE,DASH_DOUBLE,DASH_DOUBLE,DASH_DOUBLE))
#define MODE_OVERFLY QUOTE(WEAPON_MODE(DASH_025,DASH_025,DASH_025,DASH_025,DASH_OVERFLY))
#define MODE_TOPDOWN QUOTE(WEAPON_MODE(DASH_025,DASH_025,DASH_025,DASH_025,DASH_TOPDOWN))

params [
    ["_type", "", [""]]
];

if !([grad_minui_player] call grad_minui_fnc_canUseWeapon) exitWith {};

switch (toLower _type) do {
    case ("all"): {
        ["mode"] call grad_minui_fnc_showWeaponInfo;
        ["zeroing"] call grad_minui_fnc_showWeaponInfo;
        ["throwable"] call grad_minui_fnc_showWeaponInfo;
    };
    case ("mode"): { //********************************************************** MODE ****************************************************************
        if (currentWeaponMode grad_minui_player isEqualType 0) exitWith {};

        private _currentWeaponMode = currentWeaponMode grad_minui_player;
        private _currentWeapon = currentWeapon grad_minui_player;
        private _currentMuzzle = currentMuzzle grad_minui_player;

        // dashes
        private _text = switch (toLower _currentWeaponMode) do {
            case ("single"): { MODE_SINGLE; };
            case ("burst"): { MODE_BURST; };
            case ("fullauto"): { MODE_FULL; };
            // if the weaponmode is non of the above we will check the config
            default {
                private _textureType = toLower ([configFile >> "CfgWeapons" >> (currentMuzzle grad_minui_player) >> _currentWeaponMode, "textureType", ""] call BIS_fnc_returnConfigEntry);
                switch (_textureType) do {
                    case ("semi"): { MODE_SINGLE; };
                    case ("dual"): { MODE_DUAL; };
                    case ("burst"): { MODE_BURST; };
                    case ("full"): { MODE_FULL; };
                    case ("fullauto"): { MODE_FULL; };
                    case ("overfly"): { MODE_OVERFLY; };
                    case ("topdown"): { MODE_TOPDOWN; };
                    case ("fastauto"): { MODE_FAST; };
                    default { MODE_UNKNOWN; };
                };
            };
        };

        // ace safemode
        if (isClass (configFile >> "CfgPatches" >> "ace_safemode")) then {
            private _safedWeapons = +(grad_minui_player getVariable ["ACE_safemode_safedWeapons",[]]);
            private _isSafed = _currentWeapon in _safedWeapons;

            // ace needs some time to update the variable so in the worst case the weapon will be displayed as safed although it isn't
            // so we're going to check for the next 0.2 seconds and call this function again if anything changed
            [
                { params ["_isSafed", "_weapon", "_unit"]; _isSafed isNotEqualTo (_weapon in (_unit getVariable ["ACE_safemode_safedWeapons",[]]))},
                { ["mode"] call grad_minui_fnc_showWeaponInfo; },
                [_isSafed, _currentWeapon, grad_minui_player],
                0.2
            ] call CBA_fnc_waitUntilAndExecute;

            if (_isSafed) then {
                _text = MODE_SAFE;
            };
        };

        // add muzzle and magazine to weapon mode if is other than primary muzzle of weapon (= is under barrel weapon)
        if (_currentMuzzle isNotEqualTo _currentWeapon) then {
            private _muzzeleDisplayName = [configFile >> "CfgWeapons" >> _currentWeapon >> _currentMuzzle, "displayName", ""] call BIS_fnc_returnConfigEntry;
            
            _text = format ["%1   %2", _muzzeleDisplayName, _text];

            // add magazine info if any is loaded
            private _magDisplayName = [configFile >> "CfgMagazines" >> (currentMagazine grad_minui_player), "DisplayNameShort", ""] call BIS_fnc_returnConfigEntry;
            if (_magDisplayName isNotEqualTo "") then {
                _text = format ["%1     |     %2", _magDisplayName, _text];
            };
        };

        // no mag loaded == red text
        if (currentMagazine grad_minui_player isEqualTo "") then {
            _text = format ["<t color='#BB0000'>%1</t>",_text];
        };

        ["weaponMode", _text] call grad_minui_fnc_createWeaponInfoDisplay;
    };
    case ("zeroing"): { //******************************************************* ZEROING *************************************************************
        private _text = format["<br/>%1m", [grad_minui_player] call grad_minui_fnc_zeroing];

        ["zeroing", _text] call grad_minui_fnc_createWeaponInfoDisplay;
    };
    case ("throwable"): { //***************************************************** THROWABLE ***********************************************************
        private _currentThrowable = currentThrowable grad_minui_player;
        private _text = if (_currentThrowable isEqualTo []) then {
            "<br/><t color='#BB0000'>NONE</t><t color='#00ffffff'>     0000m</t>";
        } else {
            format["<br/>%1<t color='#00ffffff'>     0000m</t>", [configFile >> "CfgMagazines" >> (_currentThrowable select 0), "displayNameShort", ""] call BIS_fnc_returnConfigEntry];
        };

        ["throwable", _text] call grad_minui_fnc_createWeaponInfoDisplay;
    };
    case ("magazine"): { //****************************************************** MAGAZINE ************************************************************
        private _magDisplayName = [configFile >> "CfgMagazines" >> (currentMagazine grad_minui_player), "DisplayNameShort", ""] call BIS_fnc_returnConfigEntry;
        if (_magDisplayName isEqualTo "") exitWith{};

        // layer "weaponMode" to make sure this gets overwritten by the weaponMode display because this also shows the magazine
        ["weaponMode", _magDisplayName] call grad_minui_fnc_createWeaponInfoDisplay;
    };
    case ("muzzle"): { //******************************************************** MUZZLE **************************************************************
        ["mode"] call grad_minui_fnc_showWeaponInfo;
        ["zeroing"] call grad_minui_fnc_showWeaponInfo;
    };
    default {
        ["Unknown type '%1'.", _type] call BIS_fnc_error;
    };
};
