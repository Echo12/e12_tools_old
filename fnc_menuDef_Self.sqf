#include "script_component.hpp"
private ["_target","_params","_menuName","_menuRsc","_menuDef","_menus"];

_target = _this select 0;
_params = _this select 1;

_menuName = "main";
_menuRsc = "popup";

_menus = [
  [
    ["main", "Echo 12 Menu", _menuRsc], // Root menu, name of ???, rsc for it
    [
      ["<t color='#ffc600'>Tools ></t>",
        {}, // code to run
        "", "", // ?? and ??
        
		[QPATHTO_F(fnc_menuDef_Self_main),"e12_menu_self_main",1], //submenu - x\st\addons\st_interact\st_self_1.sqf
		-1, // key
        (true)] //conditions
    ]
  ]
];
//-----------------------------------------------------------------------------
_menuDef = [];
{
  if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
  hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""},__FILE__];
  diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef 
