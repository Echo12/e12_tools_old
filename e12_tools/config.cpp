
class CfgPatches {

	class e12_tools {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.000000;
		requiredAddons[] = {
		"CBA_MAIN",
		"ace_main"
		};
		author[] = {"Coati - Echo12 Development Team"};
		version = "1.2.0";
		authorUrl = "http://www.echo12.de";
	};
};

class Extended_PreInit_EventHandlers {

	class e12_tools {
		clientInit = "call compile preprocessFileLineNumbers 'x\e12\addons\tools\XEH_preInit.sqf'";
		serverInit = "e12retnull = [] spawn compile preprocessFileLineNumbers 'x\e12\addons\tools\XEH_PreServerInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {

	class e12_tools {
		clientInit = "e12retnull = [] spawn compile preprocessFileLineNumbers 'x\e12\addons\tools\clientInit.sqf'";
		serverInit = "e12retnull = [] spawn compile preprocessFileLineNumbers 'x\e12\addons\tools\XEH_PostServerInit.sqf'";
	};
};

class E12UI_Frame {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))";
	type = 0;
	style = "0x00";
	sizeEx = 0.032000;
	font = "PuristaLight";
	colorBackground[] = {"39/256", "46/256", "38/256", "3/4"};
	colorText[] = {0, 0, 0, 0};
	text = "";
};

class E12UI_Caption: E12UI_Frame {
	h = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	colorBackground[] = {"93/256", "117/256", "93/256", "4/5"};
	colorText[] = {"204/256", "255/256", "151/256", 1};
};

class E12UI_List {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((1) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "(((5) - (0)) * (((safeZoneH * 0.9)/ 42) / 0.8))";
	type = 5;
	style = "0 + 0x10";
	sizeEx = 0.032000;
	font = "PuristaLight";
	rowHeight = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	wholeHeight = "5 * (((safeZoneH * 0.9)/ 42) / 0.8)";
	color[] = {0, 0.500000, 0, 1};
	colorText[] = {"204/256", "255/256", "151/256", 1};
	colorBackground[] = {"39/256", "46/256", "38/256", "3/4"};
	colorScrollbar[] = {0.950000, 0.950000, 0.950000, 1};
	colorSelect[] = {"59/256", "79/256", "51/256", "1/2"};
	colorSelect2[] = {0.950000, 0.950000, 0.950000, 1};
	colorSelectBackground[] = {0, 1, 0, 1};
	colorSelectBackground2[] = {0.600000, 0.839200, 0.470600, 1.000000};
	period = 0;
	soundSelect[] = {"", 0.000000, 1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 1.000000;
	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	class ScrollBar {
		//color = {"204/256", "255/256", "151/256", "3/4"};
		colorActive[] = {"204/256", "255/256", "151/256", 1};
		colorDisabled[] = {"204/256", "255/256", "151/256", "1/2"};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		//arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		//arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class E12UI_Button {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((1) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	type = 1;
	style = "0x02";
	sizeEx = 0.032000;
	font = "PuristaLight";
	colorText[] = {"204/256", "255/256", "151/256", 1};
	colorFocused[] = {"39/256", "46/256", "38/256", "3/5"};
	colorDisabled[] = {"39/256", "46/256", "38/256", "2/5"};
	colorBackground[] = {"39/256", "46/256", "38/256", "4/5"};
	colorBackgroundDisabled[] = {"39/256", "46/256", "38/256", "4/5"};
	colorBackgroundActive[] = {"39/256", "46/256", "38/256", "5/5"};
	offsetX = 0.003000;
	offsetY = 0.003000;
	offsetPressedX = 0.002000;
	offsetPressedY = 0.002000;
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0;
	soundEnter[] = {"", 0, 1};
	soundPush[] = {"", 0.100000, 1};
	soundClick[] = {"", 0, 1};
	soundEscape[] = {"", 0, 1};
};

class E12UI_Combo {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((1) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	type = 4;
	style = "0x00";
	sizeEx = 0.032000;
	font = "PuristaLight";
	rowHeight = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	wholeHeight = "5 * (((safeZoneH * 0.9)/ 42) / 0.8)";
	color[] = {1, 1, 1, "3/4"};
	colorText[] = {"204/256", "255/256", "151/256", "3/5"};
	colorBackground[] = {"39/256", "46/256", "38/256", "2/4"};
	colorSelect[] = {"204/256", "255/256", "151/256", 1};
	colorSelectBackground[] = {"39/256", "46/256", "38/256", "3/4"};
	soundSelect[] = {"", 0.000000, 1};
	soundExpand[] = {"", 0.000000, 1};
	soundCollapse[] = {"", 0.000000, 1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 1.000000;
	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";

	class ScrollBar {
		color[] = {"204/256", "255/256", "151/256", "3/4"};
		colorActive[] = {"204/256", "255/256", "151/256", 1};
		colorDisabled[] = {"204/256", "255/256", "151/256", "1/2"};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class E12UI_Edit {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((1) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	htmlControl = "true";
	type = 2;
	style = 16;
	sizeEx = 0.028000;
	font = "BitStream";
	colorBackground[] = {"39/256", "46/256", "38/256", "4/5"};
	colorText[] = {"204/256", "255/256", "151/256", "4/5"};
	colorSelection[] = {0, 0, 0, 1};
	autocomplete = "false";
	text = "";
};

class E12UI_Slider {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((1) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	type = 3;
	style = "0x400";
	color[] = {"204/256", "255/256", "151/256", "4/5"};
	coloractive[] = {"204/256", "255/256", "151/256", 1};
	onSliderPosChanged = "";
};

class E12UI_Text {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((1) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	type = 0;
	style = "0x00";
	sizeEx = 0.032000;
	font = "PuristaLight";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {"204/256", "255/256", "151/256", 1};
};

class E12UI_StructText {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((1) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	type = 13;
	style = "0x00";
	size = 0.032000;
	font = "PuristaLight";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {"204/256", "255/256", "151/256", 1};
};

class E12UI_ControlGroup {
	idc = -1;
	x = "((safeZoneX * 0.9)+ ((0) * ((safeZoneW * 0.9)/ 4)))";
	y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((1) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
	w = "((safeZoneW * 0.9)/ 4)";
	h = "(((safeZoneH * 0.9)/ 42) / 0.8)";
	type = 15;
	style = "0x00";

	class VScrollbar {
		color[] = {1, 1, 1, 1};
		width = 0.021000;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};

	class HScrollbar {
		color[] = {1, 1, 1, 1};
		height = 0.028000;
	};

	class ScrollBar {
		color[] = {1, 1, 1, 0.600000};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.300000};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
	};

	class controls {
	};
};

class e12_RMM_ui_settings {
	idd = 80508;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "[] spawn {if (isnil 'terraindetail') then {terraindetail = 2}; ctrlSetText [1,format['%1/%2 m', viewdistance, e12_settings_maxvd]]; ctrlSetText [3,format['%1/%2', terraindetail, 5]]; sliderSetRange [2, 500, e12_settings_maxvd];sliderSetRange [4, 1, 5];sliderSetSpeed [2, 50, 100];sliderSetSpeed [4, 1, 1];sliderSetPosition [2, viewdistance];sliderSetPosition [4, terraindetail];};";

	class controls {

		class Background: E12UI_Frame {
			h = "(((8) - (0)) * (((safeZoneH * 0.9)/ 42) / 0.8))";
		};

		class WindowCaption: E12UI_Caption {
			text = "Settings";
		};

		class VDText: E12UI_Text {
			text = "View distance:";
		};

		class VDStatus: VDText {
			idc = 1;
			x = "((safeZoneX * 0.9)+ ((0.5) * ((safeZoneW * 0.9)/ 4)))";
			text = "0 m / 0 m";
		};

		class VDSlider: E12UI_Slider {
			idc = 2;
			y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((2.5) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
			onSliderPosChanged = "setviewdistance round(_this select 1); ctrlSetText [1,format['%1/%2 m', viewdistance, e12_settings_maxvd]]; player setvariable ['pviewdistance', viewdistance, true];";
		};

		class TDText: E12UI_Text {
			y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((4) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
			text = "Terrain detail:";
		};

		class TDStatus: TDText {
			idc = 3;
			x = "((safeZoneX * 0.9)+ ((0.5) * ((safeZoneW * 0.9)/ 4)))";
			text = "0 / 0";
		};

		class TDSlider: E12UI_Slider {
			idc = 4;
			y = "(((safeZoneY * 0.9)+ ((0) * ((((safeZoneH * 0.9)/ 42) / 0.8)* (42/ 4))))+ ((5.5) * (((safeZoneH * 0.9)/ 42) / 0.8)))";
			onSliderPosChanged = "_this spawn {private '_terraindetail'; _terraindetail = round(_this select 1); terraindetail = _terraindetail;  ctrlSetText [3,format['%1/%2', terraindetail, 5]]; sleep 3/4; if (terraindetail == _terraindetail) then {setterraingrid ([50, 25, 12.5, 6.25, 3.125] select (terrainDetail - 1));}}; player setvariable ['pterraindetail', terraindetail, true];";
		};
	};
};
