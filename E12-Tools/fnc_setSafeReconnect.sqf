#include "script_component.hpp"
PARAMS_1(_unit);

_uid = getPlayerUID _unit;
if(isNil "_uid" || _uid == "") then {
	_uid="LOCAL";
};

_magazines = magazines _unit;
_weapons = weapons _unit;
_weaponOnBack = [_unit] call ACE_fnc_WeaponOnBackName;
_ruckMags = [_unit] call ACE_fnc_RuckMagazinesList;
_ruckWeps = [_unit] call ACE_fnc_RuckWeaponsList;
_unit setVariable [QGVAR(safereconnectset),true];
_pos = getPosASL _unit;

call compile format["e12_tools_safereconnect_uid_%1=[time,_magazines,_weapons,_weaponOnBack,_ruckMags,_ruckWeps,_pos];", _uid];
call compile format["publicVariable ""e12_tools_safereconnect_uid_%1"";", _uid];
_unit globalChat format ["Safe Reconnect set for uid %1, reconnect now!", _uid];
//_unit globalChat "Safe Reconnect set!";