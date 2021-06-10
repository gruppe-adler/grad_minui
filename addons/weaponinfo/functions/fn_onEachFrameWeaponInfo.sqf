/*
 * Function: grad_minui_fnc_onEachFrameWeaponInfo
 * Author: DerZade
 *
 * Called upon each frame. Checks for changes in weaponmode, zeroing, ...
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

private _magazine = currentMagazine grad_minui_player;
private _mode = currentWeaponMode grad_minui_player;
private _muzzle = currentMuzzle grad_minui_player;
private _throwable = currentThrowable grad_minui_player;
private _zeroing = [grad_minui_player] call grad_minui_fnc_zeroing;

if (grad_minui_magazine isNotEqualTo _magazine) then {
    grad_minui_magazine = _magazine;
    ["magazine"] call grad_minui_fnc_showWeaponInfo;
};

if (grad_minui_mode isNotEqualTo _mode) then {
    grad_minui_mode = _mode;
    ["mode"] call grad_minui_fnc_showWeaponInfo;
};

if (grad_minui_muzzle isNotEqualTo _muzzle) then {
    grad_minui_muzzle = _muzzle;
    ["muzzle"] call grad_minui_fnc_showWeaponInfo;
};

if (grad_minui_throwable isNotEqualTo _throwable) then {
    grad_minui_throwable = _throwable;
    ["throwable"] call grad_minui_fnc_showWeaponInfo;
};

if (grad_minui_zeroing isNotEqualTo _zeroing) then {
    grad_minui_zeroing = _zeroing;
    ["zeroing"] call grad_minui_fnc_showWeaponInfo;
};
