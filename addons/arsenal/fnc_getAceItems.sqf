params ["_side", ["_faction", []], ["_weapons", []], ["_mags", []], ["_items", []], ["_packs", []]];

if (!isnull (configfile >> "CfgPatches" >> "ace_atragmx")) then {
	_items = _items + ["ACE_ATragMX"];
};


if (!isnull (configfile >> "CfgPatches" >> "ace_attach")) then {
	_items = _items + ["ACE_IR_Strobe_Item"];
};

// TODO: Ballistics

if (!isnull (configfile >> "CfgPatches" >> "ace_captives")) then {
	_items = _items + ["ACE_CableTie"];
};

// TODO: Chemlights
// TODO: Concertina Wire

if (!isnull (configFile >> "CfgPatches" >> "ace_dagr")) then {
	_items = _items + ["ACE_DAGR"];
};

// TODO: Disposable

if (!isnull (configFile >> "CfgPatches" >> "ace_explosives")) then {
	_items = _items + ["ACE_Cellphone", "ACE_Clacker", "ACE_M26_Clacker", "ACE_DefusalKit", "ACE_DeadManSwitch"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_flashlights")) then {
	_items = _items + ["ACE_Flashlight_MX991", "ACE_Flashlight_KSF1", "ACE_Flashlight_XL50"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_fortify")) then {
	_items = _items + ["ACE_Fortify"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_grenades")) then {
	_mags = _mags + ["ACE_HandFlare_White", "ACE_HandFlare_Red", "ACE_HandFlare_Green", "ACE_HandFlare_Yellow", "ACE_M14", "ACE_M84"];
};

// TODO: Gunbag

if (!isnull (configFile >> "CfgPatches" >> "ace_hearing")) then {
	_items = _items + ["ACE_EarPlugs"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_huntir")) then {
	_items = _items + ["ACE_HuntIR_monitor"];
	_mags = _mags + ["ACE_HuntIR_M203"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_kestrel4500")) then {
	_items = _items + ["ACE_Kestrel4500"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_laser")) then {
	_items = _items + ["acc_pointer_IR", "ACE_acc_pointer_red", "ACE_acc_pointer_green_IR", "ACE_acc_pointer_green"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_logistics_uavbattery")) then {
	_items = _items + ["ACE_UAVBattery"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_logistics_wirecutter")) then {
	_items = _items + ["ACE_wirecutter"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_maptools")) then {
	_items = _items + ["ACE_MapTools"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_medical")) then {
	_items = _items - ["FirstAidKit", "Medikit"];
	_items = _items + ["ACE_adenosine", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_quikclot", "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250", "ACE_bodyBag", "ACE_epinephrine", "ACE_morphine", "ACE_packingBandage", "ACE_personalAidKit", "ACE_plasmaIV", "ACE_plasmaIV_500", "ACE_plasmaIV_250", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_surgicalKit", "ACE_tourniquet", "ACE_splint"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_microdagr")) then {
	_items = _items + ["ACE_microDAGR"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_minedetector")) then {
	_weapons = _weapons - ["MineDetector"];
	_weapons = _weapons + ["ACE_VMH3", "ACE_VMM3"];
};

if (!isnull (configfile >> "CfgPatches" >> "ace_nightvision")) then {
	_items = _items - ["NVGoggles_OPFOR", "NVGoggles", "NVGoggles_INDEP"];
	_items = _items + ["ACE_NVG_Gen1","ACE_NVG_Gen1_Brown","ACE_NVG_Gen1_Green","ACE_NVG_Gen2","ACE_NVG_Gen2_Black","ACE_NVG_Gen2_Brown","ACE_NVG_Gen4","ACE_NVG_Gen4_Black","ACE_NVG_Gen4_Green","ACE_NVG_Wide","ACE_NVG_Wide_Black","ACE_NVG_Wide_Green"];
};

// TODO: MK6 Mortar
// TODO: MX2A
// TODO: Optics

if (!isnull (configFile >> "CfgPatches" >> "ace_overheating")) then {
	_mags = _mags + ["ACE_SpareBarrel"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_parachute")) then {
	_items = _items + ["ACE_Altimeter"];
	_packs = _packs + ["ACE_NonSteerableParachute", "ACE_ReserveParachute"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_rangecard")) then {
	_items = _items + ["ACE_RangeCard"];
};

// TODO: Sandbag
// TODO: Spotting Scope
// TODO: Tactical Ladder
// TODO: Tagging

if (!isnull (configFile >> "CfgPatches" >> "ace_trenches")) then {
	_items = _items + ["ACE_EntrenchingTool"];
};

if (!isnull (configFile >> "CfgPatches" >> "ace_tripod")) then {
	_items = _items + ["ACE_Tripod"];
};

// TODO: Vehicle Lock
// TODO: Vector
// TODO: Yardage 450

[
	_weapons, // Weapons
	_mags, // Magazines
	_items, // Items
	_packs // Backpacks
];