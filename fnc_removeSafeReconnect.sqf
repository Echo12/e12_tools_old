#include "script_component.hpp"
PARAMS_1(_unit);
_uid = getPlayerUID _unit;
if(isNil "_uid" || _uid == "") then {
	_uid="LOCAL";
};

call compile format["e12_tools_safereconnect_uid_%1=nil;", _uid];
call compile format["publicVariable ""e12_tools_safereconnect_uid_%1"";", _uid];