params ["_side", ["_faction", []], ["_weapons", []], ["_mags", []], ["_items", []], ["_packs", []]];

if (!isnull (configFile >> "CfgPatches" >> "kat_airway")) then {
	_items = _items + ["kat_accuvac","kat_guedel","kat_larynx","kat_BVM"];
};

if (!isnull (configFile >> "CfgPatches" >> "kat_breathing")) then {
	_items = _items + ["kat_aatKit","kat_chestSeal","kat_Pulseoximeter","kat_stethoscope"];
};

if (!isnull (configFile >> "CfgPatches" >> "kat_circulation")) then {
	_items = _items + ["kat_bloodIV_A","kat_bloodIV_A_250","kat_bloodIV_A_N_250","kat_bloodIV_A_500","kat_bloodIV_A_N_500","kat_bloodIV_A_N","kat_bloodIV_AB","kat_bloodIV_AB_250","kat_bloodIV_AB_N_250","kat_bloodIV_AB_500","kat_bloodIV_AB_N_500","kat_bloodIV_AB_N","kat_bloodIV_B","kat_bloodIV_B_250","kat_bloodIV_B_N_250","kat_bloodIV_B_500","kat_bloodIV_B_N_500","kat_bloodIV_B_N","kat_bloodIV_O","kat_bloodIV_O_250","kat_bloodIV_O_N_250","kat_bloodIV_O_500","kat_bloodIV_O_N_500","kat_bloodIV_O_N","kat_crossPanel","KAT_Empty_bloodIV_250","KAT_Empty_bloodIV_500","kat_AED","kat_X_AED"];
};

private _isKatPharma =  !isnull (configFile >> "CfgPatches" >> "kat_pharma");
if (_isKatPharma) then {
	_items = _items + ["kat_IO_FAST","kat_IV_16","kat_amiodarone","kat_atropine","kat_Carbonate","kat_CarbonateItem","kat_EACA","kat_fentanyl","kat_ketamine","kat_lidocaine","kat_nalbuphine","kat_naloxone","kat_nitroglycerin","kat_norepinephrine","kat_Painkiller","kat_PainkillerItem","kat_phenylephrine","kat_TXA"];
};

private _isKatSurgery =  !isnull (configFile >> "CfgPatches" >> "kat_surgery");
if (_isKatSurgery) then {
	_items = _items + ["kat_clamp","kat_plate","kat_retractor","kat_scalpel","kat_vacuum"];
};

if (_isKatPharma && _isKatSurgery) then {
	_items = _items + ["kat_etomidate","kat_flumazenil","kat_lorazepam"];
};

if (!isnull (configFile >> "CfgPatches" >> "kat_misc")) then {
	_items = _items + ["Attachable_Helistretcher","kat_stretcherBag"];
};

[
	_weapons,
	_mags,
	_items,
	_packs
];