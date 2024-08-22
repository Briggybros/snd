#include "script_component.hpp"

params [
	["_logic", objNull, [objNull]]		// Argument 0 is module logic
];

// TODO: Use module param
_baseCount = ["insurgent_base_count", 3] call BIS_fnc_getParamValue; 

_attackingSide = (_logic getVariable "AttackingSide") call BIS_fnc_sideType;
_defendingSide = (_logic getVariable "DefendingSide") call BIS_fnc_sideType;

[
	"Task_Destroy", // ID
	_attackingSide, // Owner
	["Find and destroy enemy caches", "Search & Destroy", ""], // Description
	nil, // Destination
	"ASSIGNED", // State
	0, // Priority
	true, // Notify
	true, // Global
	"destroy", // Type
	false // 3D
] call BIS_fnc_setTask;

[
	"Task_Defend",  // ID
	_defendingSide, // Owner
	["Defend your caches from the enemy", "Defend", ""], // Description
	nil, // Destination
	"ASSIGNED", // State
	0, // Priority
	true, // Notify
	true, // Global
	"defend", // Type
	false // 3D
] call BIS_fnc_setTask;

_syncedObjects = synchronizedObjects _logic;
_syncedBases = _syncedObjects select {typeof _x == "SnD_modules_ModuleSearchAndDestroyBase"};

{
	_trigger = createTrigger ["EmptyDetector", getPos _x, false];
	_trigger setTriggerArea (_x getVariable ['objectarea', [50, 50, 0, false, -1]]);
	
	_trigger setVariable ["base", _x];
	_x setVariable ["_trigger", _trigger];
} forEach _syncedBases;

_shuffledBases = _syncedBases call BIS_fnc_arrayShuffle;
_activeBases   = _shuffledBases select [0, _baseCount];
_basesToRemove = _shuffledBases select [_baseCount, (count _syncedObjects - 1)];


// Configure active bases
{	
	_base = _x;
	_otherBases = _activeBases select {_x != _base};
	[_base, _forEachIndex, _otherBases, _attackingSide, _defendingSide] call FUNCMAIN(initBase);
} forEach _activeBases;

// Remove excess bases
{
	[_x] call FUNCMAIN(removeBase);
} forEach _basesToRemove;

true;