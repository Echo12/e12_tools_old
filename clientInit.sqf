#include "script_component.hpp"
waitUntil {!isNil "CBA_ui_fnc_add"};


//Settings
if(isNil "e12_settings_maxvd") then {e12_settings_maxvd = 10000;};


//Call defaults
[] spawn FUNC(sthud_setdefault);

//Run Statistics
//[] spawn FUNC(statsloop);

//Group Management
GVAR(interact_original_group) = group player;

//Init Event
[QGVAR(event_groupmsg),{
    _this spawn {
		if(((__isAdmin) || player == leader (group (_this select 0)))) then {
            switch(_this select 1) do {
             	case (0): {
		        	(_this select 0) sideChat format["%1 hat sich zur Fehlerbehebung in die Base teleportiert", name (_this select 0)];    
		        };
                case (1): {
		        	(_this select 0) sideChat format["%1 hat sich zum Gruppenführer teleportiert", name (_this select 0)];    
		        };
                case (2): {
		        	(_this select 0) sideChat format["%1 hat sich zum Missionsführer teleportiert", name (_this select 0)];    
		        };
                case (3): {
		        	(_this select 0) sideChat format["%1 hat sich zum Medic gemacht", name (_this select 0)];    
		        };
                case (4): {
		        	(_this select 0) sideChat format["%1 hat %2 zum Medic gemacht", name (_this select 0), name (_this select 2)];    
		        };  
                case (5): {
                    if(player == leader (group (_this select 0))) then {
                    	(_this select 0) sideChat format["%1 hat deine Gruppe übernommen", name (_this select 0), name (_this select 2)];
                    };
                }; 
            }
            
        };
    };
}] call CBA_fnc_addEventHandler;


//[QGVAR(event_makemedic),{
//    if(local (_this select 0)) then {
//    	_this spawn {
//        	if(player == (_this select 0)) then {
//	       		player setVariable ["ace_w_ismedic",true]; 
//	    	};
//	    };
//    };
//}] call CBA_fnc_addEventHandler;



["player", [ace_sys_interaction_key_self], -100, [QPATHTO_F(fnc_menuDef_Self), "main"]] call CBA_ui_fnc_add;
["player", [ace_sys_interaction_key], -100, [QPATHTO_F(fnc_menuDef_Other), "main"]] call CBA_ui_fnc_add;
