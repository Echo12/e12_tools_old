/* ----------------------------------------------------------------------------
Header: Columns UI
Description:
	A set of default classes for quick/easy dialog construction.
Author:
	Rommel
---------------------------------------------------------------------------- */

#define E12UI_Colours_Darker				73/256, 73/256, 73/256
#define E12UI_Colours_Dark				39/256, 46/256, 38/256
#define E12UI_Colours_Normal				59/256, 79/256, 51/256
#define E12UI_Colours_Light				93/256, 117/256, 93/256
#define E12UI_Colours_Lighter				204/256, 255/256, 151/256

//-----------------------------------------------------------------------------
#define E12UI_Colours_DialogBackground	E12UI_Colours_Dark
#define E12UI_Colours_DialogText			E12UI_Colours_Normal

#define E12UI_Colours_WindowBackground	E12UI_Colours_Dark
#define E12UI_Colours_WindowText			E12UI_Colours_Lighter

#define E12UI_Colours_CaptionBackground	E12UI_Colours_Light
#define E12UI_Colours_CaptionText			E12UI_Colours_Lighter

//-----------------------------------------------------------------------------

#define safeX	(safeZoneX * 0.9)
#define safeY	(safeZoneY * 0.9)
#define safeH	(safeZoneH * 0.9)
#define safeW	(safeZoneW * 0.9)

#define safeCX	(safeX + safeW/2)
#define safeCY	(safeY + safeH/2)

//-----------------------------------------------------------------------------
//Rows

#ifndef E12UI_Rows
#define E12UI_Rows 42
#endif

#define E12UI_Row_H	((safeH / E12UI_Rows) / 0.8)
#define E12UI_Row_Y(integer)	(safeY + ((integer) * E12UI_Row_H))
#define E12UI_Row_DY(int1,int2)	(((int2) - (int1)) * E12UI_Row_H)

//-----------------------------------------------------------------------------
//Boxes

#ifndef E12UI_Boxes
#define E12UI_Boxes 4
#endif

#define E12UI_Box_H	(E12UI_Row_H * (E12UI_Rows / E12UI_Boxes))
#define E12UI_Box_W	(safeW / E12UI_Boxes)

#define E12UI_Box_X(integer)	(safeX + ((integer) * E12UI_Box_W))
#define E12UI_Box_Y(integer)	(safeY + ((integer) * E12UI_Box_H))

#define E12UI_Box_Row(int1,int2)	(E12UI_Box_Y(int1) + ((int2) * E12UI_Row_H))

#define E12UI_Box_Rows	(E12UI_Box_H / E12UI_Row_H)

//-----------------------------------------------------------------------------
//Dialogs

class E12UI_Frame	{
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Y(0);
	w = E12UI_Box_W; h = E12UI_Box_H;
	
	type = 0; style = 0x00;
	sizeEx = 0.032;	font = "TahomaB";
	
	colorBackground[] = {E12UI_Colours_DialogBackground, 3/4};
	colorText[] = {0,0,0,0};
	text = "";
};

class E12UI_Caption : E12UI_Frame {
	h = E12UI_Row_H;

	colorBackground[] = {E12UI_Colours_CaptionBackground, 4/5};
	colorText[] = {E12UI_Colours_CaptionText, 1};
};

class E12UI_List {
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Row(0,1);
	w = E12UI_Box_W; h = E12UI_Row_DY(0,5);
	
	type = 5; style = 0 + 0x10;
	sizeEx = 0.032;	font = "TahomaB";
	
	rowHeight = E12UI_Row_H;
	wholeHeight = 5 * E12UI_Row_H;
	
	color[] = {0,0.5,0,1};
	colorText[] = {E12UI_Colours_WindowText, 1};
	colorBackground[] = {E12UI_Colours_WindowBackground, 3/4};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {E12UI_Colours_DialogText, 1/2};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0,1,0,1};
	colorSelectBackground2[] = {0.6, 0.8392, 0.4706, 1.0};

	period = 0;
	
	soundSelect[] = {"", 0.0, 1};
	
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 1.0;

	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	
	class ScrollBar	{
		color[] = {E12UI_Colours_WindowText, 3/4};
		colorActive[] = {E12UI_Colours_WindowText, 1};
		colorDisabled[] = {E12UI_Colours_WindowText, 1/2};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class E12UI_Button {
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Row(0,1);
	w = E12UI_Box_W; h = E12UI_Row_H;
	
	type = 1; style = 0x02;
	sizeEx = 0.032;	font = "TahomaB";
	
	colorText[] = {E12UI_Colours_WindowText, 1};
	colorFocused[] = {E12UI_Colours_DialogBackground, 3/5};
	colorDisabled[] = {E12UI_Colours_DialogBackground, 2/5};
	colorBackground[] = {E12UI_Colours_DialogBackground, 4/5};
	colorBackgroundDisabled[] = {E12UI_Colours_DialogBackground, 4/5};
	colorBackgroundActive[] = {E12UI_Colours_DialogBackground, 5/5};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0 };
	colorBorder[] = { 0, 0, 0, 0 };
	borderSize = 0;
	soundEnter[] = {"", 0, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0, 1};
	soundEscape[] = {"", 0, 1};
};

class E12UI_Combo {
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Row(0,1);
	w = E12UI_Box_W; h = E12UI_Row_H;
	
	type = 4; style = 0x00;
	sizeEx = 0.032;	font = "TahomaB";
	
	rowHeight = E12UI_Row_H;
	wholeHeight = 5 * E12UI_Row_H;

	color[] = {1,1,1,3/4};
	colorText[] = {E12UI_Colours_WindowText, 3/5};
	colorBackground[] = {E12UI_Colours_DialogBackground, 2/4};
	colorSelect[] = {E12UI_Colours_WindowText, 1};
	colorSelectBackground[] = {E12UI_Colours_DialogBackground, 3/4};
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
	
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 1.0;
	
	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	
	class ScrollBar	{
		color[] = {E12UI_Colours_WindowText, 3/4};
		colorActive[] = {E12UI_Colours_WindowText, 1};
		colorDisabled[] = {E12UI_Colours_WindowText, 1/2};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class E12UI_Edit {
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Row(0,1);
	w = E12UI_Box_W; h = E12UI_Row_H;
	
	htmlControl = true;
	type = 2; style = 16;
	sizeEx = 0.028;	font = "BitStream";

	colorBackground[] = {E12UI_Colours_DialogBackground, 4/5};
	colorText[] = {E12UI_Colours_WindowText, 4/5};
	colorSelection[] = {0,0,0,1};

	autocomplete = false;
	text = "";
};

class E12UI_Slider {
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Row(0,1);
	w = E12UI_Box_W; h = E12UI_Row_H;
	
	type = 3; style = 0x400;
	
	color[] = {E12UI_Colours_WindowText, 4/5};
	coloractive[] = {E12UI_Colours_WindowText, 1};
	onSliderPosChanged = "";
};

class E12UI_Text {
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Row(0,1);
	w = E12UI_Box_W; h = E12UI_Row_H;
	
	type = 0; style = 0x00;
	sizeEx = 0.032;	font = "TahomaB";

	colorBackground[] = {0,0,0,0};
	colorText[] = {E12UI_Colours_WindowText, 1};
};

class E12UI_StructText {
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Row(0,1);
	w = E12UI_Box_W; h = E12UI_Row_H;
	
	type = 13; style = 0x00;
	size = 0.032;	font = "TahomaB";

	colorBackground[] = {0,0,0,0};
	colorText[] = {E12UI_Colours_WindowText, 1};
};

class E12UI_ControlGroup {
	idc = -1;
	x = E12UI_Box_X(0); y = E12UI_Box_Row(0,1);
	w = E12UI_Box_W; h = E12UI_Row_H;
	
	type = 15; style = 0x00;

	class VScrollbar {
		color[] = {1, 1, 1, 1};
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
	class HScrollbar {
		color[] = {1, 1, 1, 1};
		height = 0.028;
	};
	class ScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
	};
	class controls {};
};
