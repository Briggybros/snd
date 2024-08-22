params [
	"_base", 
	["_otherBases", []]
];

if (_base getVariable ['destroyed', false]) exitWith {
	[];
};

_aliveBases = _otherBases select {!(_x getVariable ['destroyed', false])};

_aliveBases apply {
	player addAction [
		(format ["Teleport to: %1", _x getVariable "name"]),
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			_location = _arguments select 0;
			_tpDelay = ["teleportdelay", 30] call BIS_fnc_getParamValue; // TODO: Maybe change this up?
			player setVariable ['isTeleporting', true];
			hint format ["Teleporting to %1 in %2 seconds", _location getVariable "name", _tpDelay];
			[_location, _tpDelay] spawn {
				params ["_location", "_tpDelay"];
				sleep _tpDelay;
				player setPos (getPos _location);
				hint format ["You have arrived at %1", _location getVariable "name"];
				player setVariable ['isTeleporting', false];
			};
		},
		[_x],
		0, false, true, "", "(_target == _this && !(_this getVariable ['isTeleporting', false]))"
	];
};