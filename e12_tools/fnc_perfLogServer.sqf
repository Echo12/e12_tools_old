#include "script_component.hpp"
private["_localUnits"];
LOG("Performance Server Log starting up");
while {true} do {
    _localUnits = 0;
    {
     	if(local _x) then {
        	INC(_localUnits);    
        };   
    } foreach allunits;
	GVAR(perfLogServer)=[ceil diag_fps, ceil diag_fpsmin, _localUnits, (count allunits) - _localUnits];
    publicVariable QGVAR(perfLogServer);
	sleep 10;    
};
