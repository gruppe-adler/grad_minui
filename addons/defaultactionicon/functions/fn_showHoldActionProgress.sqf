#include "\A3\functions_f\HoldActions\defines.inc"
#include "script_component.hpp"

params [
	["_frame", 0, [123]]
];

private _display = uiNamespace getVariable [QUOTE(PROGRESS_DISPLAY_CLASS), displayNull];

if ((_frame isEqualTo 0) && !(isNull _display)) exitWith {
	// the user aborted the hold action, if there already
	// is a display and we get frame 0 -> close display
	PROGRESS_DISPLAY_LAYER cutText ["", "PLAIN"];
};

// create display if it does not exist
if (isNull _display) then {
	PROGRESS_DISPLAY_LAYER cutRsc [QUOTE(PROGRESS_DISPLAY_CLASS), "PLAIN"];
	_display = uiNamespace getVariable QUOTE(PROGRESS_DISPLAY_CLASS);
};

private _image = TEXTURES_PROGRESS select _frame;
(_display displayCtrl 1) ctrlSetStructuredText parseText format ["<t size='0.8'>%1</t>", _image];
