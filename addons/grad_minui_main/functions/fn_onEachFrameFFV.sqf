/*
 * Function: grad_minui_fnc_onEachFrameFFV
 * Author: DerZade
 *
 * Called upon each frame, while player is ffv. Checks for changes in weaponmode, zeroing, etc.
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

if !(grad_minui_magazine isEqualTo currentMagazine player) then {
  grad_minui_magazine = currentMagazine player;
  ["magazine"] call grad_minui_fnc_showWeaponInfo;
};

if !(grad_minui_mode isEqualTo currentWeaponMode player) then {
  grad_minui_mode = currentWeaponMode player;
  ["mode"] call grad_minui_fnc_showWeaponInfo;
};

if !(grad_minui_muzzle isEqualTo currentMuzzle player) then {
  grad_minui_muzzle = currentMuzzle player;
  ["muzzle"] call grad_minui_fnc_showWeaponInfo;
};

if !(grad_minui_throwable isEqualTo (currentThrowable player)) then {
  grad_minui_throwable = currentThrowable player;
  ["throwable"] call grad_minui_fnc_showWeaponInfo;
};

if !(grad_minui_zeroing isEqualTo ([] call grad_minui_fnc_FFVzeroing)) then {
  grad_minui_zeroing = ([] call grad_minui_fnc_FFVzeroing);
  ["zeroing"] call grad_minui_fnc_showWeaponInfo;
};
