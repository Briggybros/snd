class CfgVehicles {
	class Logic;
	class Module_F : Logic {
		class AttributesBase {
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};

		// Description base classes (for more information see below):
		class ModuleDescription {
			class AnyBrain;
		};
	};

	class GVAR(ModuleSearchAndDestroyInit) : Module_F {
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = CSTRING(ModuleSearchAndDestroyInit);				// Name displayed in the menu
		icon = QPATHTOF(data\snd_module_i_ca.paa);	// Map icon. Delete this entry to use the default icon.
		category = QGVAR(SearchAndDestroyMode);

		function = QFUNCMAIN(init);

		class Attributes : AttributesBase {
			class AttackingSide : Combo {
				property     = QGVAR(ModuleSearchAndDestroyInit_attacking_side);
				displayName  = CSTRING(ModuleSearchAndDestroyInit_attacking_side_name);
				tooltip      = CSTRING(ModuleSearchAndDestroyInit_attacking_side_desc);
				typeName     = "NUMBER";
				defaultValue = "0";

				class values {
					class BLUFOR {
						name  = "BLUFOR";
						value = 1;
					};
					class Independent {
						name  = "Independent";
						value = 2;
					};
					class OPFOR {
						name  = "OPFOR";
						value = 0;
					};
				};
			};

			class DefendingSide : Combo {
				property     = QGVAR(ModuleSearchAndDestroyInit_defending_side);
				displayName  = CSTRING(ModuleSearchAndDestroyInit_defending_side_name);
				tooltip      = CSTRING(ModuleSearchAndDestroyInit_defending_side_desc);
				typeName     = "NUMBER";
				defaultValue = "2";

				class values {
					class BLUFOR {
						name  = "BLUFOR";
						value = 1;
					};
					class Independent {
						name  = "Independent";
						value = 2;
					};
					class OPFOR {
						name  = "OPFOR";
						value = 0;
					};
				};
			};
		};
	};

	class GVAR(ModuleSearchAndDestroyBase) : Module_F {
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = CSTRING(ModuleSearchAndDestroyBase);				// Name displayed in the menu
		icon = QPATHTOF(data\snd_module_b_ca.paa);	// Map icon. Delete this entry to use the default icon.
		portrait = QPATHTOF(data\snd_module_b_ca.paa);	// Map icon. Delete this entry to use the default icon.
		category = QGVAR(SearchAndDestroyMode);

		canSetArea = 1;
		canSetAreaShape = 1;

		class AttributeValues {
			size3[] = {10, 10, -1};
			isRectangle = 0;
		};
	};

	class GVAR(ModuleSearchAndDestroyTarget) : Module_F {
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = CSTRING(ModuleSearchAndDestroyTarget);				// Name displayed in the menu
		icon = QPATHTOF(data\snd_module_o_ca.paa);	// Map icon. Delete this entry to use the default icon.
		category = QGVAR(SearchAndDestroyMode);

		function = QFUNCMAIN(initTarget);
	};
};
