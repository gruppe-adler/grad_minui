class CfgPatches
{
	class grad_minui_weaponinfo
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"grad_minui_main"};
		version = "0.1";
		author = "DerZade";
	};
};

class grad_minui_cba
{
	#include "cbaSettings.hpp"
	#include "cbaKeybinds.hpp"
}

#include "ui.hpp"
#include "RscTitles.hpp"
#include "CfgFunctions.hpp"
