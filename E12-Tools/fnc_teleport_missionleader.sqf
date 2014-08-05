#include "script_component.hpp" 
private["_telepos"];
  
_oldpos = getpos player;
_telepos = [0,0,0];
_unit = nil;
{
    if(_x getVariable[QGVAR(islead),false]) then {
      	_telepos = getPos _x;  
		_unit = _x;
    };
}foreach allUnits;

if(!isNil "_unit") then {
	if(vehicle _unit == _unit) then {
		if(!(_telepos distance  [0,0,0] == 0)) then {
		    [QGVAR(event_groupmsg),[player, 2]] call CBA_fnc_globalEvent;
			_telepos call FUNC(teleport);
		};
	}else{;
		_veh = vehicle _unit;
		player moveInCargo _veh;
		sleep 0.5;
		if((getpos player distance _oldpos) < 3) then {
			player groupChat "Teleport fehlgeschlagen, Zielperson in vollbesetztem Fahrzeug, spaeter erneut probieren";
		}else{
			[QGVAR(event_groupmsg),[player, 2]] call CBA_fnc_globalEvent;
		};	
	};
}else{
    player groupChat "Teleport fehlgeschlagen, Position des Missionsführers nicht bekannt";
};