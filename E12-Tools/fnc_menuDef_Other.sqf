#include "script_component.hpp"
private ["_target","_params","_menuName","_menuRsc","_menuDef","_menus"];

_target = _this select 0;
_params = _this select 1;

_menuName = "main";
_menuRsc = "popup";


if (_target == player) exitWith {}; 
if !(_target isKindOf "MAN") exitWith {}; // I'm sure there's some other better way to do this but hey, this is what you get when stuff isn't documented. 
if !(alive _target) exitWith {}; 

_menus = [
  [
    ["main", "Echo 12 Menu", _menuRsc], // Root menu, name of ???, rsc for it
    [
      ["<t color='#ffc600'>Tools ></t>",
        {}, // code to run
        "", "", // ?? and ??
		[QPATHTO_F(fnc_menuDef_Other_main),"e12_menu_other_main",1], //submenu
		-1, // key
        (true && (cba_ui_target != player))] //conditions
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
