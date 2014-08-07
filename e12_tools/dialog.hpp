class e12_RMM_ui_settings {
	idd = 80508;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "[] spawn {if (isnil ""terraindetail"") then {terraindetail = 2}; ctrlSetText [1,format['%1/%2 m', viewdistance, e12_settings_maxvd]]; ctrlSetText [3,format['%1/%2', terraindetail, 5]]; sliderSetRange [2, 500, e12_settings_maxvd];sliderSetRange [4, 1, 5];sliderSetSpeed [2, 50, 100];sliderSetSpeed [4, 1, 1];sliderSetPosition [2, viewdistance];sliderSetPosition [4, terraindetail];};";
	
	class controls {
		class Background : E12UI_Frame {
			h = E12UI_Row_DY(0,8);
		};
		class WindowCaption : E12UI_Caption {
			text = "Settings";
		};
		class VDText : E12UI_Text {
			text = "View distance:";
		};
		class VDStatus : VDText {
			idc = 1;
			x = E12UI_Box_X(0.5);
			text = "0 m / 0 m";
		};
		class VDSlider : E12UI_Slider {
			idc = 2;
			y = E12UI_Box_Row(0,2.5);
			onSliderPosChanged = "setviewdistance round(_this select 1); ctrlSetText [1,format['%1/%2 m', viewdistance, e12_settings_maxvd]]; player setvariable ['pviewdistance', viewdistance, true];";
		};
		class TDText : E12UI_Text {
			y = E12UI_Box_Row(0,4);
			text = "Terrain detail:";
		};
		class TDStatus : TDText {
			idc = 3;
			x = E12UI_Box_X(0.5);
			text = "0 / 0";
		};
		class TDSlider : E12UI_Slider {
			idc = 4;
			y = E12UI_Box_Row(0,5.5);
			onSliderPosChanged = "_this spawn {private ""_terraindetail""; _terraindetail = round(_this select 1); terraindetail = _terraindetail;  ctrlSetText [3,format['%1/%2', terraindetail, 5]]; sleep 3/4; if (terraindetail == _terraindetail) then {setterraingrid ([50, 25, 12.5, 6.25, 3.125] select (terrainDetail - 1));}}; player setvariable ['pterraindetail', terraindetail, true];";
		};
	};
};