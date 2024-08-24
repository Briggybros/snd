params ["_attackingSide"];

if (!hasInterface) exitWith {};

["Task_Destroy", "SUCCEEDED"] call BIS_fnc_taskSetState;
["Task_Defend", "FAILED"] call BIS_fnc_taskSetState;

if (playerSide == _attackingSide) then {
	endMission "END1";
} else {
	endMission "END2";
};


