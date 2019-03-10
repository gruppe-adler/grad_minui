#include "script_component.hpp"

class CfgPatches
{
	class grad_minui_stanceindicator
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"grad_minui_main"};
		author = "DerZade";
		VERSION_CONFIG;
	};
};

#include "ui.hpp"

class grad_minui_cba
{
	#include "cbaSettings.hpp"
};
