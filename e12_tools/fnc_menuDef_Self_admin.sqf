#include "script_component.hpp"
private ["_target","_params","_menuName","_menuRsc","_menuDef","_menus"];


_target = _this select 0;
_params = _this select 1;

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__]};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

_menus = [];
if (_menuName == "e12_menu_self_admin") then {
	_menus set [count _menus,
		[
			["e12_menu_self_admin","Admin Options", _menuRsc],
			[
				["Performance Monitor",
					{[] spawn FUNC(admin_perfmon)},
					"", "", "", -1,1,
					((__isAdmin) && isClass(configFile >> "CfgPatches" >> "e12_amf_perflog"))],
				["Teleport Mapclick",
					{[] spawn FUNC(admin_teleport)},
					"", "", "", -1,1,
					((__isAdmin))],
                ["Selbst zum Medic machen",
					{player spawn FUNC(admin_medic)},
					"", "", "", -1,1,
					(__isAdmin)],
				["Magische Heilung",
					{player spawn FUNC(fullHeal)},
					"", "", "", -1,1,
					(__isAdmin)],
                ["Item Kiste erstellen",
					{(getPos player) spawn FUNC(admin_createitemcrate)},
					"", "", "", -1,1,
					(__isAdmin)],
                ["AGM Item Kiste erstellen",
					{(getPos player) spawn FUNC(admin_createagmitemcrate)},
					"", "", "", -1,1,
					(__isAdmin)],
                ["Medic Kiste erstellen",
					{(getPos player) spawn FUNC(admin_createmediccrate)},
					"", "", "", -1,1,
					(__isAdmin)],
                ["ACRE Kiste erstellen",
					{(getPos player) spawn FUNC(admin_createacrecrate)},
					"", "", "", -1,1,
					(__isAdmin)]
                
				
			]
		]
	];
};



//["Restore original group",
				//	{[player] join st_interact_original_group},
				//	"", "", "", -1,
				//	((group player) != st_interact_original_group) && (!isNull st_interact_original_group)]

_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this} else {""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _params, __FILE__];
};

_menuDef