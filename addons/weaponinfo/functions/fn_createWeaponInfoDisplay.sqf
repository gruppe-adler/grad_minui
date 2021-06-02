/*
 * Function: grad_minui_fnc_createWeaponInfoDisplay
 * Author: DerZade
 *
 * Shows display with given text on given layer
 *
 * Arguments:
 * 0: layer (prefix not needed) <STRING>
 * 1: text (structured text formatting may be used) <STRING>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * ["testlayer", "TEST<br/>2nd Line"] call grad_minui_fnc_createWeaponInfoDisplay;
 *
 * Public: No
 */

params [
	["_layer", "", [""]],
	["_text", "", [""]]
];

// apply color
private _color = (["weaponinfo_color"] call grad_minui_fnc_setting) call BIS_fnc_colorRGBAtoHTML;
_text = format ["<t color='%1'>%2</t>",_color, _text];

// layer name
private _layerName = format ["grad_minui_weaponInfo_%1", toLower _layer];
grad_minui_wepaonInfo_cutlayers pushBackUnique _layerName;

// create display
_layerName cutRsc ["grad_minui_weaponInfo", "PLAIN"];
private _disp = uiNamespace getVariable "grad_minui_weaponInfo";

// add text 
(_disp displayCtrl 1) ctrlSetStructuredText parseText _text;
