/*
 * Function: grad_minui_fnc_showInfo
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
 * ["zeroing"] call grad_minui_fnc_showInfo;
 *
 * Public: No
 */
params ["_type"];

switch (toLower _type) do {
    case ("all"): {
        ["mode"] call grad_minui_fnc_showInfo;
        ["zeroing"] call grad_minui_fnc_showInfo;
        ["throwable"] call grad_minui_fnc_showInfo;
    };
    case ("mode"): {
        private _text = switch (tolower currentWeaponMode player) do {
            case ("single"): {
                "<img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' />";
            };
            case ("burst"): {
                "<img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' />";
            };
            case ("fullauto"): {
                "<img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' />";
            };
            //if the weaponmode is non of the above we will check the config
            default {
                switch (getText (configFile >> "CfgWeapons" >> (currentMuzzle player) >> (currentWeaponMode player) >> "textureType")) do {
                    case ("semi"): {
                        "<img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' />";
                    };
                    case ("dual"): {
                        "<img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' />";
                    };
                    case ("full"): {
                        "<img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' /><img image='\grad_minui\data\dash100_ca.paa' />";
                    };
                    default {
                        "<img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' />";
                    };
                };

            };
        };

        //ace safemode
        if (isClass(configFile >> "CfgPatches" >> "ace_safemode")) then {
            private _safedWeapons = +(player getVariable ["ACE_safemode_safedWeapons",[]]);
            if ((currentWeapon player) in _safedWeapons) then {

                //ace needs some time to update the variable so in the worst case the weapon will be displayed as safed although it isn't
                //so we're going to check for the next 0.1 seconds and call this function again if anything changed
                [{!((_this select 0) isEqualTo ((_this select 1) getVariable ["ACE_safemode_safedWeapons",[]]))}, {["mode"] remoteExec ["grad_minui_fnc_showInfo", (_this select 1)];}, [_safedWeapons, player], 0.2, {}] call CBA_fnc_waitUntilAndExecute;
                _text = "<img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' /><img image='\grad_minui\data\dash25_ca.paa' />";
            };
        };

        //add muzzle and magazine to weapon mode if is other than primary muzzle of weapon (= is under barrel weapon)
        if !((toLower currentMuzzle player) isEqualTo (toLower currentWeapon player)) then {
            _text = format ["%1   %2", getText (configFile >> "CfgWeapons" >> (currentWeapon player) >> (currentMuzzle player) >> "displayName"), _text];

            //add magazine info if any is loaded
            private _mag = getText(configFile >> "CfgMagazines" >> (currentMagazine player) >> "DisplayNameShort");
            if (_mag != "") then {
                _text = format ["%1     |     %2", _mag, _text];
            };
        };


        //no mag loaded == red text
        if (currentMagazine player isEqualTo "") then {
            _text = format ["<t color='#BB0000'>%1</t>",_text];
        };

        ["weaponMode", _text] call grad_minui_fnc_createDisplay;
    };
    case ("zeroing"): {
        private _text = format["<br/>%1m", currentZeroing player];

        ["zeroing", _text] call grad_minui_fnc_createDisplay;
    };
    case ("throwable"): {
        private _text = if ((currentThrowable player) isEqualTo []) then {
            "<br/><t color='#BB0000'>NONE</t><t color='#00ffffff'>     0000m</t>";
        } else {
            format["<br/>%1<t color='#00ffffff'>     0000m</t>", getText (configFile >> "CfgMagazines" >> (currentThrowable player) select 0 >> "displayNameShort")];
        };

        ["throwable", _text] call grad_minui_fnc_createDisplay;
    };
    case ("magazine"): {
        _mag = getText(configFIle >> "CfgMagazines" >> (currentMagazine player) >> "DisplayNameShort");
        if (_mag == "") exitWith{};

        //layer "weaponMode" to make sure this gets overwritten by the weaponMode display because this also shows the magazine
        ["weaponMode", _mag] call grad_minui_fnc_createDisplay;
    };
    case ("muzzle"): {
        ["mode"] call grad_minui_fnc_showInfo;
        ["zeroing"] call grad_minui_fnc_showInfo;
    };
};
