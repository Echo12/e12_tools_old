#include "script_component.hpp"
if(!isServer) exitWith{};
_group = _this select 0;  
_group setVariable [QGVAR(data),_this select 1,true];