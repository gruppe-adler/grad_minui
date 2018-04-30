/*
 * Function: grad_minui_fnc_showInfo
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
 * [] call grad_minui_fnc_hideInfo;
 *
 * Public: No
 */

{
    _x cutText ["","PLAIN"];
} forEach grad_minui_cutlayers;

//reset variable
grad_minui_cutlayers = [];
