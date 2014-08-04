#include "script_component.hpp"
PARAMS_1(_unit);
titleText ["SAFE RECONNECT","BLACK OUT",3];
sleep 1;
_uid = getPlayerUID _unit;
if(isNil "_uid" || _uid == "") then {
	_uid="LOCAL";
};

if(!isNil format["e12_tools_safereconnect_uid_%1",_uid]) then {
	removeallweapons _unit;
	removeallitems _unit;
	removeBackpack _unit;
	[_unit, "ALL"] call ACE_fnc_RemoveGear;
	
	sleep 1;
	if((!isNil format["e12_tools_safereconnect_uid_%1",_uid])) then {
		_restore = call compile format["e12_tools_safereconnect_uid_%1", _uid];
		_magazines = _restore select 1;
		_weapons = _restore select 2;
		_weaponOnBack = _restore select 3;
		_ruckMags = _restore select 4;	
		_ruckWeps = _restore select 5;
		_pos = _restore select 6;
	
		if(!isNil "_weaponOnBack" && _weaponOnBack != "") then {
			_unit addweapon _weaponOnBack;
			[_unit, _weaponOnBack] call ACE_fnc_PutWeaponOnBack;
		};
		
		{
			[_unit, _x select 0, _x select 1] call ACE_fnc_PackMagazine;
		}foreach _ruckMags;
		{
			[_unit, _x select 0, _x select 1] call ACE_fnc_PackWeapon;
		}foreach _ruckWeps;
		
		{_unit addmagazine _x} foreach _magazines;
		{_unit addWeapon _x} foreach _weapons;	
		_unit setPosASL _pos;
		_unit setVariable [QGVAR(safereconnectset),true];
		[_unit] call FUNC(removeSafeReconnect);
	};
}else{
	_unit globalChat "Safe Reconnect not available!";
};
titleText ["SAFE RECONNECT","BLACK IN",3];
sleep 3;
