/*
 * Function: grad_minui_fnc_showWeaponInfo
 * Author: DerZade
 *
 * Hides all currently shown infos
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call grad_minui_fnc_hideWeaponInfo;
 *
 * Public: No
 */

{
  _x cutText ["","PLAIN"];
} forEach grad_minui_wepaonInfo_cutlayers;

//reset variable
grad_minui_wepaonInfo_cutlayers = [];
