#include "script_component.hpp"

params [
	["_logic", objNull, [objNull]]		// Argument 0 is module logic
];

[_logic] spawn {
	params ["_logic", ["_base", nil]];

	waitUntil {
		sleep 1;

		_bases = synchronizedObjects _logic select {typeof _x == "SnD_modules_ModuleSearchAndDestroyBase"};

		if (count _bases == 0) exitWith { true };

		_base = _bases select 0;

		_base getVariable ['ready', false];
	};

	// No idea why isNil is the way it is, but needs a string param to reference a local variable
	if (isNil "_base") exitWith {};

	_targets = synchronizedObjects _logic select {typeof _x != "SnD_modules_ModuleSearchAndDestroyBase"};

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
		"[thisTrigger getVariable 'base'] call SnD_fnc_destroyBase",
		""
	];
};

