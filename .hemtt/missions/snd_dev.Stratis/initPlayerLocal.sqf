["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;


0 spawn {
	sleep 5; // We need to sleep here because the player is 'killed' at the start of the game to pick their spawn point
	player addEventHandler ["Killed", { setPlayerRespawnTime (["respawn_delay", 60] call BIS_fnc_getParamValue) }]; // Sets custom respawn time
};

true;
