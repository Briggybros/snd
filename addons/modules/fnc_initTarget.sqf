#include "script_component.hpp"

params [
	["_logic", objNull, [objNull]]		// Argument 0 is module logic
];

_syncedObjects = synchronizedObjects _logic;
_syncedBases = _syncedObjects select {typeof _x == "SnD_modules_ModuleSearchAndDestroyBase"};

if (count _syncedBases != 1) exitWith {
	systemChat format ["Target %1 has no synchronised base", _logic];
};

_base = _syncedBases select 0;

_targets = _syncedObjects select {typeof _x != "SnD_modules_ModuleSearchAndDestroyBase"};

if (count _targets == 0) exitWith {
	systemChat format ["Target %1 has no objects to complete it", _logic];
};

_trigger = createTrigger ["EmptyDetector", getPos _logic, true];
_logic setVariable ["trigger", _trigger];
_trigger setTriggerActivation ["NONE", "PRESENT", false];
_trigger setVariable ["targets", _targets];
_trigger setVariable ["base", _base];
_trigger setTriggerStatements [
	// every(target => !alive(target)), but stupid sqf
	"!(true in ((thisTrigger getVariable ['targets', []]) apply {alive _x}))",
	// 1. set base destroyed.
	// 2. set searchers destroy task completed
	// 3. set defenders defent task failed
	"[thisTrigger getVariable 'base'] call SnD_fnc_destroyBase",
	""
];

true;