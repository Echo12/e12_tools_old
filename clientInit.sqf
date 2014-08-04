#include "script_component.hpp"
#define DIK_F5              0x3F
#define DIK_F6              0x40


waitUntil {!isNil "CBA_fnc_registerKeybindToFleximenu"};

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


["e12Tools", "Self-Interaction", ["player", [], -100, [QPATHTO_F(fnc_menuDef_Self), "main"]], [DIK_F5,false,false,false]] call CBA_fnc_registerKeybindToFleximenu;
["e12Tools", "Interaction", ["player", [], -100, [QPATHTO_F(fnc_menuDef_Other), "main"]], [DIK_F6,false,false,false]] call CBA_fnc_registerKeybindToFleximenu;

