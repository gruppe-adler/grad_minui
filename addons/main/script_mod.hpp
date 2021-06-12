#include "script_version.hpp"

#define VERSION MAJOR.MINOR.PATCHLVL-BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define VERSION_CONFIG version = #VERSION; versionStr = #VERSION; versionAr[] = {VERSION_AR}

#define MOD_CONFIG_CLASS_NAME grad_minui_config
#define QUOTE(var) #var
