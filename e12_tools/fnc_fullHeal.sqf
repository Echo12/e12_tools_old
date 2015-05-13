#include "script_component.hpp"
PARAMS_1(_unit);

// full heal ace
[nil, _unit] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;

//Reset whole stamina system
_unit setFatigue 0;
