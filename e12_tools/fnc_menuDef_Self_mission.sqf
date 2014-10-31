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
if (_menuName == "e12_menu_self_mission") then {
	_menus set [count _menus,
		[
			["e12_menu_self_mission","Mission Builder Options", _menuRsc],
			[
				["Set captive",
					{[player, "MyTag_Handcuffed", true] call AGM_Interaction_fnc_setCaptivityStatus},
					"", "", "", -1,1,
					((__isAdmin) && !("MyTag_Handcuffed" in ([player] call AGM_Interaction_fnc_getCaptivityStatus)))],
                ["Set non-captive",
					{[player, "MyTag_Handcuffed", false] call AGM_Interaction_fnc_setCaptivityStatus},
					"", "", "", -1,1,
					((__isAdmin) && ("MyTag_Handcuffed" in ([player] call AGM_Interaction_fnc_getCaptivityStatus)))],
				["Make invulnerable",
					{[player] spawn FUNC(toggleInvulnerability)},
					"", "", "", -1,1,
					((__isAdmin) && (!([player] call FUNC(isInvulnerable))) && (vehicle player == player))],
				["Make vulnerable",
					{[player] spawn FUNC(toggleInvulnerability)},
					"", "", "", -1,1,
					((__isAdmin) && ([player] call FUNC(isInvulnerable)) && (vehicle player == player))],
				["Open Virtual Arsenal",
					{["Open",true] spawn BIS_fnc_arsenal},
					"", "", "", -1,1,
					((__isAdmin) && (vehicle player == player))]
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