#include "script_component.hpp"
private["_telepos"];

_oldpos = getpos player;
_telepos = getPos (leader (group player));
_unit = (leader (group player));

if(!isNil "_unit") then {
	if(vehicle _unit == _unit) then {
		if(!(_telepos distance  [0,0,0] == 0)) then {
		    [QGVAR(event_groupmsg),[player, 1]] call CBA_fnc_globalEvent;
			_telepos call FUNC(teleport);
		};
	}else{;
		_veh = vehicle _unit;
		player groupChat format["Vehicle: %1", _veh];
		player moveInCargo _veh;
		sleep 0.5;
		if((getpos player distance _oldpos) < 3) then {
			player groupChat "Teleport fehlgeschlagen, Zielperson in vollbesetztem Fahrzeug, spaeter erneut probieren";
		}else{
			[QGVAR(event_groupmsg),[player, 1]] call CBA_fnc_globalEvent;
		};	
	};
}else{
    player groupChat "Teleport fehlgeschlagen, Position des Gruppenführers nicht bekannt";
};