
#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = CSTRING(component);
		author = "117Briggy";
		url = "https://github.com/Briggybros/snd";
		requiredVersion = 2; 
		requiredAddons[] = {
			QUOTE(MAIN_ADDON)
		};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
	};
};

#include "CfgVehicles.hpp"
#include "CfgFunctions.hpp"
