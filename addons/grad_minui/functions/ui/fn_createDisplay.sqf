/*
 * Function: grad_minui_fnc_createDisplay
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
 * ["testlayer", "TEST<br/>2nd Line"] call grad_minui_fnc_createDisplay;
 *
 * Public: No
 */

disableSerialization;
params ["_layer","_text"];

//apply color
private _color = profileNameSpace getVariable ['grad_minui_setting_color_hex','#d8d8d8'];
_text = format ["<t color='%1'>%2</t>",_color, _text];

private _layerName = format ["grad_minui_%1",_layer];

grad_minui_cutlayers pushBackUnique _layerName;

_layerName cutRsc ["grad_minui","PLAIN"];
private _disp = uiNamespace getVariable "grad_minui";

(_disp displayCtrl 1) ctrlSetStructuredText parseText _text;
