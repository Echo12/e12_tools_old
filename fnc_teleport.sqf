#include "script_component.hpp"
private["_pos"];
_pos = _this;
GVAR(teleport_oldpos) = getPos player;
titleText ["TELEPORTING","BLACK OUT",3];
sleep 3;
player setPos [_pos select 0, _pos select 1, 0];
titleText ["TELEPORTING","BLACK IN",3];
sleep 3; 
