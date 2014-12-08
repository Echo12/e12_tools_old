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

if (_menuName == "e12_menu_self_main") then {
	_menus set [count _menus,
		[
			["e12_menu_self_main","Echo 12 Tools", _menuRsc],
			[
				["Grafikeinstellungen",
					{[] call FUNC(settings_create)},
					"", "", "", -1,1,
					true],
                ["<t color='#ffc600'>Admin ></t>",
			        {}, // code to run
			        "", "", // ?? and ??
					[QPATHTO_F(fnc_menuDef_Self_admin),"e12_menu_self_admin",1], 
					-1,1, // key
			        (__isAdmin)],
                ["<t color='#ffc600'>Teleport ></t>",
			        {}, // code to run
			        "", "", // ?? and ??
					[QPATHTO_F(fnc_menuDef_Self_tele),"e12_menu_self_tele",1], 
					-1, // key
			        ((vehicle player == player))],
                ["<t color='#ffc600'>STHUD Einstellungen ></t>",
			        {}, // code to run
			        "", "", // ?? and ??
					[QPATHTO_F(fnc_menuDef_Self_sthud),"e12_menu_self_sthud",1],
					-1,1, // key
			        (GVAR(settings_perm_sthud) && (!(isNil "ST_FTHud_Init")))],
                ["<t color='#ffc600'>Missionbuild ></t>",
			        {}, // code to run
			        "", "", // ?? and ??
					[QPATHTO_F(fnc_menuDef_Self_mission),"e12_menu_self_mission",1], 
					-1,1, // key
			        (__isAdmin)],
				["Statistik einschalten",
					{[] spawn FUNC(statsloop)},
					"", "", "", -1,1,
					!GVAR(statsActive) && !GVAR(statsRunning)],
				["Statistik ausschalten",
					{GVAR(statsActive) = false},
					"", "", "", -1,1,
					GVAR(statsActive)],
				["Statistik anzeigen",
					{[] spawn FUNC(showStats)},
					"", "", "", -1,1,
					(!(isNil QGVAR(stats) || !(count GVAR(stats) > 0)))],
				["Safe Reconnect vorbereiten",
					{[player] spawn FUNC(setSafeReconnect)},
					"", "", "", -1,1,
					(!([player] call FUNC(hasSafeReconnect)) && (vehicle player == player))],//(!([player] call FUNC(hasSafeReconnect)))
				["Safe Reconnect",
					{[player] spawn FUNC(applySafeReconnect)},
					"", "", "", -1,1,
					([player] call FUNC(hasSafeReconnect))],//([player] call FUNC(hasSafeReconnect))
                ["<t color='#ffc600'>Aktionen ></t>",
			        {}, // code to run
			        "", "", // ?? and ??
					[QPATHTO_F(fnc_menuDef_Self_actions),"e12_menu_self_actions",1], 
					-1,1, // key
			        (([] call GVAR(custom_self1)) 
						|| ([] call GVAR(custom_self2)) 
						|| ([] call GVAR(custom_self3)) 
						|| ([] call GVAR(custom_self4))
						|| ([] call GVAR(custom_self5))
						|| ([] call GVAR(custom_self6))
						|| ([] call GVAR(custom_self7))
						|| ([] call GVAR(custom_self8))
						|| ([] call GVAR(custom_self9))
						|| ([] call GVAR(custom_self10))
						|| ([] call GVAR(custom_self11))
						|| ([] call GVAR(custom_self12))
						|| ([] call GVAR(custom_self13))
						|| ([] call GVAR(custom_self14))
						|| ([] call GVAR(custom_self15))

					)]
                   
                  
				
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
