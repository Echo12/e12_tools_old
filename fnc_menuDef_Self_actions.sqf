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

if (_menuName == "e12_menu_self_actions") then {
	_menus set [count _menus,
		[
			["e12_menu_self_actions","Aktionen", _menuRsc],
			[
            	[GVAR(custom_self1_text),
			        {[] spawn GVAR(custom_self1_code)}, // code to run
			        "", "", "", -1,1, // key
			        ([] call GVAR(custom_self1))],
                [GVAR(custom_self2_text),
			        {[] spawn GVAR(custom_self2_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self2))],
                [GVAR(custom_self3_text),
			        {[] spawn GVAR(custom_self3_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self3))],
                [GVAR(custom_self4_text),
			        {[] spawn GVAR(custom_self4_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self4))],
                [GVAR(custom_self5_text),
			        {[] spawn GVAR(custom_self5_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self5))],
                [GVAR(custom_self6_text),
			        {[] spawn GVAR(custom_self6_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self6))],
				[GVAR(custom_self7_text),
			        {[] spawn GVAR(custom_self7_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self7))],
				[GVAR(custom_self8_text),
			        {[] spawn GVAR(custom_self8_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self8))],
				[GVAR(custom_self9_text),
			        {[] spawn GVAR(custom_self9_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self9))],
				[GVAR(custom_self10_text),
			        {[] spawn GVAR(custom_self10_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self10))],
				[GVAR(custom_self11_text),
			        {[] spawn GVAR(custom_self11_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self11))],
				[GVAR(custom_self12_text),
			        {[] spawn GVAR(custom_self12_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self12))],
				[GVAR(custom_self13_text),
			        {[] spawn GVAR(custom_self13_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self13))],
				[GVAR(custom_self14_text),
			        {[] spawn GVAR(custom_self14_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self14))],
				[GVAR(custom_self15_text),
			        {[] spawn GVAR(custom_self15_code)}, // code to run
			        "", "", "", -1,1, // key
			         ([] call GVAR(custom_self15))]
			]
		]
	];
};


_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this} else {""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _params, __FILE__];
};

_menuDef
