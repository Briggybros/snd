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

	class GVAR(FactionArsenal) : Module_F {
		// Standard object definitions:
		scope = 2;								// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = CSTRING(FactionArsenal);  // Name displayed in the menu
		category = "ObjectModifiers";

		function = QFUNCMAIN(initArsenal);
		isGlobal = 1;
		

		class Attributes : AttributesBase {
			class Side : Combo {
				property     = QGVAR(FactionArsenal_side);
				displayName  = CSTRING(FactionArsenal_side_name);
				tooltip      = CSTRING(FactionArsenal_side_desc);
				typeName     = "NUMBER";
				defaultValue = "1";

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

			class Faction : Edit {
				property     = QGVAR(FactionArsenal_faction);
				displayName  = CSTRING(FactionArsenal_faction_name);
				tooltip      = CSTRING(FactionArsenal_faction_desc);
				typeName     = "STRING";
				defaultValue = "'BLU_F'";
			};
		};
	};
};
