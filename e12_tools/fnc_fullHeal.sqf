#include "script_component.hpp"
PARAMS_1(_unit);


//Reset morphin dosage
_unit setVariable ["AGM_Painkiller", 1, true];

//Stop bleeding
_unit setVariable ["AGM_isBleeding", false, true];

//Stop unconscious
_unit setVariable ["AGM_Unconscious", false, true];

//Stop pain
_unit setVariable ["AGM_Pain", 0, true];
_unit setVariable ["AGM_inPain", false, true];      

//Is the unit able to walk?
_unit setVariable ["AGM_NoLegs", false, true]; 

//Is the unit able to hold a gun?
_unit  setVariable ["AGM_NoArms", false, true];

//Is the weid effect going on?
_unit  setVariable ["AGM_InPain", false, true];

//Reset state
_unit setVariable ["AGM_Blood", 1, true]; 

//Reset Overdosis
_unit setVariable ["AGM_isOverdosing", false];

//Reset arma damage
_unit setDamage 0;


//Reset whole stamina system
_unit setFatigue 0;
