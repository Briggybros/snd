params ["_attackingSide"];

if (!hasInterface) exitWith {};

["Task_Destroy", "FAILED"] call BIS_fnc_taskSetState;
["Task_Defend", "SUCCEEDED"] call BIS_fnc_taskSetState;

if (playerSide == _attackingSide) then {
	endMission "END4";
} else {
	endMission "END3";
};


