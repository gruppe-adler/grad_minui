#include "\A3\functions_f\HoldActions\fn_holdActionAdd.sqf"
; // This is needed because the original function does not include a ; at the end


private _iconSize = ["defaultactionicon_size"] call grad_minui_fnc_setting;

if (_iconSize isNotEqualTo 0) exitWith {};

grad_minui_hold_color = [profilenamespace getvariable ['IGUI_WARNING_RGB_R',0.77], profilenamespace getvariable ['IGUI_WARNING_RGB_G',0.51], profilenamespace getvariable ['IGUI_WARNING_RGB_B',0.08]] call BIS_fnc_colorRGBtoHTML;

bis_fnc_holdAction_showIcon = {
	params [
		["_target", objNull, [objNull]],
		["_actionID", 0, [123]],
		["_title", "", [""]],
		["_icon", "", ["", {}]],
		["_texSet", TEXTURES_PROGRESS, [[]]],
		["_frame", 0, [123]],
		["_hint", "", [""]]
	];

	if (_icon isEqualType {}) then {
		_icon = _target call _icon;
	};

	if (_texSet isEqualTo TEXTURES_PROGRESS) then {
		[_frame] call grad_minui_fnc_showHoldActionProgress;
	};

	_target setUserActionText [_actionID, format ["<t color='%2' size='0.8' valign='middle'>[HOLD]</t> %1", _title, grad_minui_hold_color], "", ""];
};

// make sure the new function is applied immediately
[_target, _actionID, _title, _iconIdle, TEXTURES_IDLE, 0] call bis_fnc_holdAction_showIcon;

// return _actionID, like the original function does
_actionID
