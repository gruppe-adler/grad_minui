/*
 * Function: grad_minui_fnc_onEachFrameFoot
 * Author: DerZade
 *
 * Called upon each frame, while unit is on foot. Checks for changes in weaponmode, zeroing, ...
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

if !(grad_minui_magazine isEqualTo currentMagazine grad_minui_player) then {
  grad_minui_magazine = currentMagazine grad_minui_player;
  ["magazine"] call grad_minui_fnc_showWeaponInfo;
};

if !(grad_minui_mode isEqualTo currentWeaponMode grad_minui_player) then {
  grad_minui_mode = currentWeaponMode grad_minui_player;
  ["mode"] call grad_minui_fnc_showWeaponInfo;
};

if !(grad_minui_muzzle isEqualTo currentMuzzle grad_minui_player) then {
  grad_minui_muzzle = currentMuzzle grad_minui_player;
  ["muzzle"] call grad_minui_fnc_showWeaponInfo;
};

if !(grad_minui_throwable isEqualTo (currentThrowable grad_minui_player)) then {
  grad_minui_throwable = currentThrowable grad_minui_player;
  ["throwable"] call grad_minui_fnc_showWeaponInfo;
};

if !(grad_minui_zeroing isEqualTo currentZeroing grad_minui_player) then {
  grad_minui_zeroing = currentZeroing grad_minui_player;
  ["zeroing"] call grad_minui_fnc_showWeaponInfo;
};
