params ["_base"];

// Complete the attacking side task
[format ['Task_Destroy_%1', _base getVariable 'name'], 'SUCCEEDED', true] call BIS_fnc_taskSetState;
// Fail the defending side task
[format ['Task_Defend_%1',  _base getVariable 'name'], 'FAILED',    true] call BIS_fnc_taskSetState;
// Mark the base as destroyed
_base setVariable ['destroyed', true];
