/*
 * Function: grad_minui_fnc_registerCBASettings
 * Author: DerZade
 *
 * Called by post init. Registers all CBA Keybinds and Settings
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
#define MODDISPLAYNAME "Gruppe Adler Minimalistic UI"

//keybinds
if (isClass(configFile >> "CfgPatches" >> "cba_keybinding")) then {
    [
        MODDISPLAYNAME,
        'grad_minui_all',
        'Show All',
        {[] spawn {sleep 0.03; ["all"] call grad_minui_fnc_showInfo;}},
        ''
    ] call CBA_fnc_addKeybind;
    [
        MODDISPLAYNAME,
        'grad_minui_zeroing',
        'Show Current Zeroing',
        {[] spawn {sleep 0.03; ["zeroing"] call grad_minui_fnc_showInfo;}},
        ''
    ] call CBA_fnc_addKeybind;
    [
        MODDISPLAYNAME,
        'grad_minui_mode',
        'Show Current Weaponmode',
        {[] spawn {sleep 0.03; ["mode"] call grad_minui_fnc_showInfo;}},
        ''
    ] call CBA_fnc_addKeybind;
    [
        MODDISPLAYNAME,
        'grad_minui_throwable',
        'Show Current Throwable',
        {[] spawn {sleep 0.03; ["throwable"] call grad_minui_fnc_showInfo;}},
        ''
    ] call CBA_fnc_addKeybind;
    [
        MODDISPLAYNAME,
        'grad_minui_magazine',
        'Show Current Magazine',
        {[] spawn {sleep 0.03; ["magazine"] call grad_minui_fnc_showInfo;}},
        ''
    ] call CBA_fnc_addKeybind;
};

//settings
if (isClass(configFile >> "CfgPatches" >> "cba_settings")) then {
    [
        'grad_minui_setting_showInfoOnGetOut',
        'CHECKBOX',
        'Show All Weapon Info when getting out of Vehicle',
        MODDISPLAYNAME,
        true,
        2
    ] call CBA_Settings_fnc_init;
    [
        'grad_minui_setting_showInfoOnGetIn',
        'CHECKBOX',
        'Show All Weapon Info when getting in Vehicle',
        MODDISPLAYNAME,
        true,
        2
    ] call CBA_Settings_fnc_init;

    [
        'grad_minui_setting_duration',
        'SLIDER',
        'UI Visible Duration',
        MODDISPLAYNAME,
        [0.1, 10, 2, 1],
        2
    ] call CBA_Settings_fnc_init;
    [
        'grad_minui_setting_fadeOutDuration',
        'SLIDER',
        'UI Fade Out Duration',
        MODDISPLAYNAME,
        [0.1, 10, 1, 1],
        2
    ] call CBA_Settings_fnc_init;

    [
        'grad_minui_setting_color',
        'COLOR',
        'UI Color',
        MODDISPLAYNAME,
        [0.85, 0.85, 0.85, 1],
        2,
        {profileNameSpace setVariable ["grad_minui_setting_color_hex", _this call BIS_fnc_colorRGBAtoHTML];}
    ] call CBA_Settings_fnc_init;
};
