params["_thisBase", "_idx", "_otherBases", "_attackingSide", "_defendingSide"];

/** Get uppercase letter from a number e.g. [3] call _getLetterUpper => "D" */
_getLetterUpper = {
	params ["_int"];
	toString [65 + _int];
};

/** Get localized phonetic letter from a number e.g. [3] call _getPhoneticLetter => "Delta" */
_getPhoneticLetter = {
	params ["_int"];
	localize format ["str_a3_radio_%1", toString [97 + _int]];
};

_name = [_idx] call _getPhoneticLetter;
_letter = [_idx] call _getLetterUpper;
_thisBase setVariable ["name", _name];

// Setup Spawn
[_defendingSide, getPos _thisBase, _name] call BIS_fnc_addRespawnPosition;

// Setup tasks
[
	[
		format ["Task_Destroy_%1", _name], // ID
		"Task_Destroy" // Parent ID
	],
	_attackingSide, // Owner
	[format ["Destroy %1", _name], "", ""], // Description
	nil, // Destination
	"CREATED", // State
	0, // Priority
	true, // Notify
	true, // Global
	_letter, // Type
	false // 3D
] call BIS_fnc_setTask;
[
	[
		format ["Task_Defend_%1", _name], // ID
		"Task_Defend" // Parent ID
	],
	_defendingSide, // Owner
	[format ["Defend %1",  _name], "", ""], // Description
	getPos _thisBase, // Destination
	"CREATED", // State
	0, // Priority
	true, // Notify
	true, // Global
	_letter, // Type
	false // 3D
] call BIS_fnc_setTask;

// Setup teleport
_thisTrigger = _thisBase getVariable "_trigger";
_thisTrigger setVariable ["_otherBases", _otherBases, true];
_thisTrigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_thisTrigger triggerAttachVehicle [player];
_thisTrigger setTriggerStatements [
	"this && !(thisTrigger getVariable 'base' getVariable ['destroyed', false])",
	"thisTrigger setVariable ['actions', [thisTrigger getVariable 'base', thisTrigger getVariable '_otherBases'] call SnD_fnc_setupBaseTPActions]",
	"{ player removeAction _x } forEach (thisTrigger getVariable ['actions', []])"
];