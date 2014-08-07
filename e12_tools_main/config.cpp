
class CfgPatches {

	class e12_amf_main {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.000000;
		requiredAddons[] = {"CBA_MAIN"};
		author[] = {"Coati - Echo12 Development Team"};
		version = "0.90";
		authorUrl = "http://www.echo12.de";
	};
};

class CfgMods {

	class e12_amf_main {
		dir = "@e12_amf";
		name = "E12 Advanced Mission Framework";
		hidePicture = "true";
		hideName = "true";
		actionName = "Website";
		action = "http://www.echo12.de";
		description = "Echo12";
	};
};
/*extern*/ class Logic;

class CfgVehicles {

	class E12_AMF_Logic: Logic {
		displayname = "E12 AMF Logic";
	};

	class E12_AMF_Required_Logic: E12_AMF_Logic {
		author = "Echo12 Development Team";
		displayName = "$STR_E12AMF_MOD_REQUIRE";
		vehicleClass = "Modules";
		icon = "\x\e12\addons\amf_main\UI\AMF.paa";
	};
};

class Extended_PreInit_EventHandlers {

	class e12_amf {
		clientInit = "call compile preprocessFileLineNumbers 'x\e12\addons\amf_main\XEH_PreClientInit.sqf'";
		serverInit = "call compile preprocessFileLineNumbers 'x\e12\addons\amf_main\XEH_PreServerInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {

	class e12_amf {
		clientInit = "e12retnull = [] spawn compile preprocessFileLineNumbers 'x\e12\addons\amf_main\XEH_PostClientInit.sqf'";
		serverInit = "e12retnull = [] spawn compile preprocessFileLineNumbers 'x\e12\addons\amf_main\XEH_PostServerInit.sqf'";
	};
};
