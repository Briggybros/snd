params ["_side", ["_faction", []], ["_weapons", []], ["_mags", []], ["_items", []], ["_packs", []]];

switch (_side) do {
	case EAST: {
		_packs = _packs + ["TFAR_mr3000","TFAR_mr3000_multicam","TFAR_mr3000_rhs","TFAR_bussole","TFAR_mr3000_bwmod","TFAR_mr3000_bwmod_tropen","TFAR_mr6000l"];
		_items = _items + ["TFAR_fadak","TFAR_pnr1000a"];
	};
	case WEST: {
		_packs = _packs + ["TFAR_rt1523g","TFAR_rt1523g_big","TFAR_rt1523g_black","TFAR_rt1523g_fabric","TFAR_rt1523g_green","TFAR_rt1523g_rhs","TFAR_rt1523g_sage","TFAR_rt1523g_big_bwmod","TFAR_rt1523g_big_bwmod_tropen","TFAR_rt1523g_big_rhs","TFAR_rt1523g_bwmod"];
		_items = _items + ["TFAR_anprc152","TFAR_rf7800str"];
	};
	case INDEPENDENT: {
		_packs = _packs + ["TFAR_anprc155","TFAR_anprc155_coyote","TFAR_anarc164","TFAR_anarc210"];
		_items = _items + ["TFAR_anprc148jem","TFAR_anprc154"];
	};
	default {};
};

_items = _items - ["ItemRadio"];
_items = _items + ["TFAR_microdagr"];

[
	_weapons,
	_mags,
	_items,
	_packs
];