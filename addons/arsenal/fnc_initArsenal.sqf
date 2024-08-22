#include "script_component.hpp"

params [
	["_logic", objNull, [objNull]]		// Argument 0 is module logic
];

if (!hasInterface) exitWith {};
waitUntil {sleep 1; !isNull player};

_side = (_logic getVariable "Side") call BIS_fnc_sideType;

_faction = _logic getVariable ["Faction", "BLU_F"] splitString " ,";

_weapons = [];
_magazines = [];
_items = [];
_backpacks = [];

([_side, _faction, _weapons, _magazines, _items, _backpacks] call FUNCMAIN(getFactionItems)) params ["_weapons", "_magazines", "_items", "_backpacks"];

if (!isnull (configfile >> "CfgPatches" >> "task_force_radio")) then {
	([_side, _faction, _weapons, _magazines, _items, _backpacks] call FUNCMAIN(getTFARItems)) params ["_weapons", "_magazines", "_items", "_backpacks"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_main")) then {
	([_side, _faction, _weapons, _magazines, _items, _backpacks] call FUNCMAIN(getAceItems)) params ["_weapons", "_magazines", "_items", "_backpacks"];
};

if (!isnull (configFile >> "CfgPatches" >> "kat_main")) then {
	([_side, _faction, _weapons, _magazines, _items, _backpacks] call FUNCMAIN(getKATItems)) params ["_weapons", "_magazines", "_items", "_backpacks"];
};

// Dedupe lists
_finalWeapons = [];
{_finalWeapons pushBackUnique _x} forEach _weapons;
_finalMagazines = [];
{_finalMagazines pushBackUnique _x} forEach _magazines;
_finalItems = [];
{_finalItems pushBackUnique _x} forEach _items;
_finalBackpacks = [];
{_finalBackpacks pushBackUnique _x} forEach _backpacks;

{
	_x setVariable ['access_side', _side];
	[_x, _finalWeapons,   false, false] call BIS_fnc_addVirtualWeaponCargo;
	[_x, _finalMagazines, false, false] call BIS_fnc_addVirtualMagazineCargo; 
	[_x, _finalItems,     false, false] call BIS_fnc_addVirtualItemCargo;
	[_x, _finalBackpacks, false, false] call BIS_fnc_addVirtualBackpackCargo;
	["AmmoboxInit", [_x, false, {(_target distance _this) < 3 && side _this == _target getVariable "access_side"}]] spawn BIS_fnc_arsenal;
} forEach synchronizedObjects _logic;

true;
