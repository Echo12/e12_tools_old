#include "script_component.hpp"
PARAMS_1(_unit);


//Reset morphin dosage
//_unit setVariable ["AGM_Painkiller", 0, true];

//Stop bleeding
//_unit setVariable ["AGM_Bleeding", 0, true];

//Stop unconscious
//_unit setVariable ["AGM_Unconscious", false, true];

//Stop pain
//_unit setVariable ["AGM_Pain", 0, true];

//Is the unit able to walk?
//_unit setVariable ["AGM_NoLegs", false, true]; 

//Is the unit able to hold a gun?
//_unit  setVariable ["AGM_NoArms", false, true];

//Is the weid effect going on?
//_unit  setVariable ["AGM_InPain", false, true];

//Reset state
//_unit setVariable ["ace_w_state", 0, true];

//Reset arma damage
_unit setDamage 0;


//Reset whole stamina system
_unit setVariable [QGVAR(Concussion), 0, true];
_unit setVariable [QGVAR(Breathing), 0, true];
_unit setVariable [QGVAR(Fatigue), 0, true];
_unit setVariable [QGVAR(heartBeat), [0, 1], true];
_unit setVariable [QGVAR(Wounds), 0, true];
_unit setVariable [QGVAR(Panic), false, true];