#include "script_component.hpp"


PREP(setSafeReconnect);
PREP(removeSafeReconnect);
PREP(applySafeReconnect);
PREP(hasSafeReconnect);
PREP(isInvulnerable);
PREP(toggleInvulnerability);
PREP(fullHeal);

GVAR(teleport_oldpos) = [0,0,0];

//perf_mon
GVAR(perfLogServer)=[0, 0, 0, 0];
GVAR(perfLogHC)=[0, 0, 0, 0];

PREP(perfLogHC);
PREP(perfLogServer);

//Keybelegung
ace_sys_interaction_key_self=63; //Taste F5
ace_sys_interaction_key=64; //Taste F6

//Config - Defaults has to be preinit
//Overwrite in init.sqf using e12_tools_settings_perm_*
GVAR(settings_perm_sthud) = true; //Show STHUD Settings: true, false
GVAR(settings_perm_sthud_ui_default_all) = 3; //What is shown to all users by default: None 0, Map 1, Names 2, Both 3
GVAR(settings_perm_sthud_ui_default_leader) = 3; //What is shown to leaders by default: None 0, Map 1, Names 2, Both 3
GVAR(settings_perm_sthud_compass_default_all) = true; //Is the compass shown to all by default: true, false
GVAR(settings_perm_sthud_compass_default_leader) = true; //Is the compass shown to the leaders by default: true, false
GVAR(settings_perm_sthud_compass_toggle_all) = true; //Can all toggle the compass: true, false 
GVAR(settings_perm_sthud_compass_toggle_leader) = true; //Can leaders toggle the compass: true, false
GVAR(settings_perm_sthud_ui_max_all) = 3; //What is max shown to all users by setting: None 0, Map 1, Names 2, Both 3 
GVAR(settings_perm_sthud_ui_max_leader) = 3; //What is max shown to leaders by setting: None 0, Map 1, Names 2, Both 3 
GVAR(settings_admins) = []; //Array of Admin _USERNAMES_

GVAR(custom_self1) = {false};
GVAR(custom_self1_text) = "Custom Action 1";
GVAR(custom_self1_code) = {};

GVAR(custom_self2) = {false};
GVAR(custom_self2_text) = "Custom Action 2";
GVAR(custom_self2_code) = {};

GVAR(custom_self3) =  {false};
GVAR(custom_self3_text) = "Custom Action 3";
GVAR(custom_self3_code) = {};

GVAR(custom_self4) =  {false};
GVAR(custom_self4_text) = "Custom Action 4";
GVAR(custom_self4_code) = {};

GVAR(custom_self5) =  {false};
GVAR(custom_self5_text) = "Custom Action 5";
GVAR(custom_self5_code) = {};

GVAR(custom_self6) = {false};
GVAR(custom_self6_text) = "Custom Action 6";
GVAR(custom_self6_code) = {};
//Added 1.6
GVAR(custom_self7) = {false};
GVAR(custom_self7_text) = "Custom Action 7";
GVAR(custom_self7_code) = {};

GVAR(custom_self8) = {false};
GVAR(custom_self8_text) = "Custom Action 8";
GVAR(custom_self8_code) = {};

GVAR(custom_self9) = {false};
GVAR(custom_self9_text) = "Custom Action 9";
GVAR(custom_self9_code) = {};

GVAR(custom_self10) = {false};
GVAR(custom_self10_text) = "Custom Action 10";
GVAR(custom_self10_code) = {};

GVAR(custom_self11) = {false};
GVAR(custom_self11_text) = "Custom Action 11";
GVAR(custom_self11_code) = {};

GVAR(custom_self12) = {false};
GVAR(custom_self12_text) = "Custom Action 12";
GVAR(custom_self12_code) = {};

GVAR(custom_self13) = {false};
GVAR(custom_self13_text) = "Custom Action 13";
GVAR(custom_self13_code) = {};

GVAR(custom_self14) = {false};
GVAR(custom_self14_text) = "Custom Action 14";
GVAR(custom_self14_code) = {};

GVAR(custom_self15) = {false};
GVAR(custom_self15_text) = "Custom Action 15";
GVAR(custom_self15_code) = {};

FUNC(isAdmin) = {
    (__isAdmin);  
};


FUNC(sthud_setdefault) = {
    //waitUntil{!isNil "ST_FTHud_Init" || !isNil "ST_FTHud_UpdateUI"; sleep 3;};
    waitUntil{sleep 2; !isNil "ST_FTHud_MapMarkerHandle"};
    sleep 2;
	ST_FTHud_ShowCompass =  GVAR(settings_perm_sthud_compass_default_all);
    if(player == leader group player) then {
      	ST_FTHud_ShowCompass =  GVAR(settings_perm_sthud_compass_default_leader);
    };  
    ST_FTHud_ShownUI = GVAR(settings_perm_sthud_ui_default_all);
    if(player == leader group player) then {
      	ST_FTHud_ShownUI =  GVAR(settings_perm_sthud_ui_default_leader);
    };  
    
};
GVAR(statsActive) = false;
GVAR(statsRunning) = false;
GVAR(stats) = [];
GVAR(shotsfired) = 0;

FUNC(showStats)={
	if(isNil QGVAR(stats) || !(count GVAR(stats) > 0)) then {
		//old playerposition, meter on foot, meter in vehicle, shots fired
		GVAR(stats)=[getPos (vehicle player), 0, 0, 0];				
	};	
	player globalChat format["Distanz zu Fuss: %1m, Per Fahrzeug: %2m, Schüsse abgegeben: %3", ceil (GVAR(stats) select 1), ceil(GVAR(stats) select 2), GVAR(stats) select 3];
};

FUNC(statsloop) = {
	private["_newStats"];
	GVAR(statsActive) = true;
	GVAR(statsRunning) = true;

	_EHkilledIdx = player addEventHandler ["fired", {INC(GVAR(shotsfired));}];
	LOG("Startup statsloop");
	//Set Defauls
	if(isNil QGVAR(stats) || !(count GVAR(stats) > 0)) then {
		//old playerposition, meter on foot, meter in vehicle, shots fired
		GVAR(stats)=[getPos (vehicle player), 0, 0, 0];				
	};	
	TRACE_1("Stats before loop",GVAR(stats));
	while {GVAR(statsActive)} do {
		_opos = GVAR(stats) select 0;
		_cpos = getPos (vehicle player);
		_tOnFoot = GVAR(stats) select 1;
		_tOnVeh = GVAR(stats) select 2;
		_onfoot = (player == vehicle player);
		TRACE_1("On foot",_onfoot);
		TRACE_1("Opos",_opos,_cpos);
		_traveled = 0;
		if(!((_opos distance _cpos) > (STATSMAXDIST*STATSSLEEP))) then {
			TRACE_1("Distance ok",_opos distance _cpos);
			_traveled = _opos distance _cpos;
		}else{
			_traveled = 0;
		};
		TRACE_1("Traveled distance",_traveled);
		if(_onfoot) then {
			_tOnFoot = _tOnFoot + _traveled; 
		}else{
			_tOnVeh = _tOnVeh + _traveled;
		};
		_newStats = [_cpos,_tOnFoot,_tOnVeh,GVAR(shotsfired)];
		
		GVAR(stats) = _newStats;
		TRACE_1("Loop end", GVAR(stats));
		sleep STATSSLEEP;
	};
	player removeEventHandler ["fired", _EHkilledIdx];
	GVAR(statsRunning) = false;
};

FUNC(admin_teleport) = {
	player globalChat "Teleport aktiviert, auf die Map klicken zum teleportieren"; 
	onMapSingleClick "vehicle player setPos _pos;onMapSingleClick """";true;";
};
FUNC(admin_perfmon) = {
	if((!isNil QGVAR(perfLogHC)) ) then {
		_perfHC = GVAR(perfLogHC);
		player globalChat format["HC: Current FPS: %1, Lowest FPS: %2, Local Units: %3, Remote Units: %4", _perfHC select 0, _perfHC select 1, _perfHC select 2, _perfHC select 3]; 
	}else{
		player globalChat "HC Performance not available"; 
	};
	if(!isNil QGVAR(perfLogServer) ) then {
		_perfServ = GVAR(perfLogServer);
		player globalChat format["Server: Current FPS: %1, Lowest FPS: %2, Local Units: %3, Remote Units: %4",_perfServ select 0, _perfServ select 1, _perfServ select 2, _perfServ select 3];
	}else{
		player globalChat "Server Performance not available";
	};
};

FUNC(admin_createitemcrate) = {
 	[0, 
	{
        private["_crate"];
    _crate = createVehicle ["Box_NATO_WpsSpecial_F", _this, [], 0, "NONE"]; 
	_crate allowdamage false;
    clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	_crate addItemCargoGlobal ["ItemMap", 5];
	_crate addItemCargoGlobal ["ItemWatch", 5];
	_crate addItemCargoGlobal ["ItemGPS", 5];
	_crate addWeaponCargoGlobal ["Binocular", 5];
	_crate addWeaponCargoGlobal ["ItemCompass", 5];
	_crate addWeaponCargoGlobal ["Laserdesignator", 5];
    _crate addMagazineCargoGlobal ["Laserbatteries", 5];
    _crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer", 10];
	_crate addMagazineCargoGlobal ["10Rnd_338_Mag", 10];
	_crate addMagazineCargoGlobal ["10Rnd_93x64_DMR_05_Mag", 10];
	_crate addMagazineCargoGlobal ["10Rnd_127x54_Mag", 10];
	_crate addMagazineCargoGlobal ["7Rnd_408_Mag", 10];
	_crate addMagazineCargoGlobal ["5Rnd_127x108_Mag", 10];
	_crate addMagazineCargoGlobal ["SmokeShellRed", 10];
	_crate addMagazineCargoGlobal ["SmokeShellGreen", 10];
	_crate addMagazineCargoGlobal ["SmokeShell", 10];
	_crate addMagazineCargoGlobal ["HandGrenade", 10];
	_crate addMagazineCargoGlobal ["150Rnd_762x51_Box_Tracer", 10];
	_crate addMagazineCargoGlobal ["130Rnd_338_Mag", 10];
	_crate addMagazineCargoGlobal ["150Rnd_93x64_Mag", 10];
	_crate addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 10];
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_Tracer", 10];
	_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 50];
	_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 50];
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 50];
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_green_mag_Tracer", 50];
	},
	_this] call CBA_fnc_globalExecute;  
};


FUNC(admin_createacrecrate) = {
 	[0, 
	{
        private["_crate"];
        //_crate = createVehicle ["ACRE_RadioBox", _this, [], 0, "NONE"]; 
        _crate = createVehicle ["Box_NATO_Support_F", _this, [], 0, "NONE"]; 
		_crate allowdamage false;
    	clearItemCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;
		_crate addItemCargoGlobal ["ACRE_PRC343", 20];
		_crate addItemCargoGlobal ["ACRE_PRC148", 20];
		_crate addItemCargoGlobal ["ACRE_PRC152", 20];
		_crate addItemCargoGlobal ["ACRE_PRC117F", 20];
		_crate addItemCargoGlobal ["ACRE_PRC77", 20];
	},
	_this] call CBA_fnc_globalExecute;  
};

FUNC(admin_createmediccrate) = {

 	[0, 
	{
        private["_crate"];
        _crate = createVehicle ["ACE_medicalSupplyCrate", _this, [], 0, "NONE"]; 
		_crate allowdamage false;
	},
	_this] call CBA_fnc_globalExecute;  

};

FUNC(admin_createacecrate) = {
 	[0, 
	{
        private["_crate"];
        _crate = createVehicle ["ACE_Box_Misc", _this, [], 0, "NONE"]; 
		_crate allowdamage false;
	},
	_this] call CBA_fnc_globalExecute;  
};

FUNC(admin_medic) = {
 	if(player == _this) then {
    	[QGVAR(event_groupmsg),[player, 3]] call CBA_fnc_globalEvent;

  		//player setvariable [QGVAR(medicClass), 1, true];
  		player setVariable ["ace_medical_medicClass", 1];
    }else{
        [QGVAR(event_groupmsg),[player, 4, _this]] call CBA_fnc_globalEvent;
  		//_this setvariable [QGVAR(medicClass), 1, true];
        _this call FUNC(admin_medic_other);
    };    
};

FUNC(admin_medic_other) ={
	[-1, 
	{
		if(local _this && player == _this) then {
        	//player setvariable [QGVAR(medicClass), 1, true];  
        	player setVariable ["ace_medical_medicClass", 1];
        };
	},
	_this] call CBA_fnc_globalExecute;    
};

FUNC(admin_martatoggle) = {
  	if(isNil QGVAR(marta_status)) then {
		GVAR(marta_status) = false;
    };
    
    if(GVAR(marta_status)) then {
        GVAR(marta_status) = false;
        setGroupIconsVisible [false,false];	
    }else{
        GVAR(marta_status) = true;
        setGroupIconsVisible [true,true];
    };
};


FUNC(admin_spectate) = {
    player setVariable [QGVAR(spectator), true];
	ace_sys_spectator_playable_only = true;
	ace_sys_spectator_no_butterfly_mode = false;
	ace_sys_spectator_RemoveDeadFilter = true;
	ace_sys_spectator_ShownSides=[playerside];
    ace_sys_spectator_can_exit_spectator = true;
	nul = [] spawn ace_fnc_startSpectator;
    waitUntil{!isNil "ace_sys_spectator_SPECTATINGON"};
    waitUntil{ace_sys_spectator_SPECTATINGON};
    player switchMove "CtsDoktor_Doktor_idleni1";
    player enableSimulation false;
    waitUntil{!ace_sys_spectator_SPECTATINGON};
    player switchMove "CtsDoktor_Doktor_idleni2";
    player enableSimulation true;
    player setVariable [QGVAR(spectator), true];
};

FUNC(interact_JoinGroup) =
{
	private ["_destination"];
	_destination = _this select 0;
	
	[player] join group _destination;
};

FUNC(interact_TakeGroupLead) =
{	
	[QGVAR(event_groupmsg),[player, 5]] call CBA_fnc_globalEvent;
    sleep 1;
	[-1, 
	{
		private "_promoted";
		{if (_x == _this) then {_promoted = _x}} forEach allUnits;
		(group _promoted) selectLeader _promoted;		
	},
	player] call CBA_fnc_globalExecute;
};

/* view settings */

FUNC(settings_create) = {
	if (isClass (configFile >> "CfgPatches" >> "viewDistance_TAW")) then {
		[] call TAWVD_fnc_openMenu;
	}
	else {
   		createDialog "e12_RMM_ui_settings"; 
  	}
};

/* sthud */

FUNC(sthud_compass_toggle) = {
	ST_FTHud_ShowCompass=!ST_FTHud_ShowCompass;
};
FUNC(sthud_ui_set) = {
	ST_FTHud_ShownUI=_this;
};

PREP(teleport);

FUNC(teleport_base) = {
    private["_telepos"];
    _telepos = [0,0,0];
    switch (side player) do {
		case (west): {
			 _telepos = getMarkerPos "e12_debug_west"; 
	 		if(_telepos distance  [0,0,0] == 0) then {
	         	_telepos = getMarkerPos "respawn_west";   
	        };   
		}; 
        case (east): {
        	_telepos = getMarkerPos "e12_debug_east"; 
	 		if(_telepos distance  [0,0,0] == 0) then {
	         	_telepos = getMarkerPos "respawn_east";   
	        };    
        };
        case (resistance): {
        	_telepos = getMarkerPos "e12_debug_guerrila"; 
	 		if(_telepos distance  [0,0,0] == 0) then {
	         	_telepos = getMarkerPos "respawn_guerrila";   
	        };    
        };
        default {
        	_telepos = getMarkerPos "e12_debug_civilian"; 
	 		if(_telepos distance  [0,0,0] == 0) then {
	         	_telepos = getMarkerPos "respawn_civilian";   
	        };    
        }; 
    };
     if(!(_telepos distance  [0,0,0] == 0)) then {
         [QGVAR(event_groupmsg),[player, 0]] call CBA_fnc_globalEvent;
    	 _telepos call FUNC(teleport);
    }else{
     	player groupChat "Teleport fehlgeschlagen, keine Base-Position bekannt";   
    };
    
   
};
FUNC(teleport_oldpos) = {
    if(!(GVAR(teleport_oldpos) distance  [0,0,0] == 0)) then {
    	GVAR(teleport_oldpos) call FUNC(teleport);
    }else{
        player groupChat "Teleport fehlgeschlagen, keine alte Position bekannt";
    };
};

PREP(teleport_leader);
PREP(teleport_missionleader);
