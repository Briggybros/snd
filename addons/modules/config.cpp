
#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = CSTRING(component);
		author = "117Briggy";
		url = "https://github.com/Briggybros/snd";
		requiredVersion = 1.82; 
		requiredAddons[] = {
			QUOTE(MAIN_ADDON)
		};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
	};
};

#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "CfgFunctions.hpp"
