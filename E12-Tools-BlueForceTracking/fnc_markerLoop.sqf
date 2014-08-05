#include "script_component.hpp"
private["_markerCount","_createMarkerName","_handleGroup","_markers","_markersRun"];
LOG('Marker loop init');
_markerCount = 0;

_createMarkerName = {
    _marker = format["e12_amf_tracking_marker_%1", _markerCount];
    _markerCount=_markerCount + 1;
    _marker
};

_handleGroup = {
    if(side player != side _x) exitWith{};
    private ["_marker", "_pos", "_leader", "_data"];
    //[format ["Handle Group %1",_x], "com"] call CBA_fnc_debug;
    LOG('Handle Group');
    if(count (units _x) > 0  && (count (_x getVariable [QGVAR(data),[]]) > 0)) then {
        _leader = leader _x;
        _pos = getPosASL _leader;
        _marker = _x getVariable QGVAR(marker);
        TRACE_3('Group should be tracked',_x,_pos,_marker);

        //missing Marker workaround
        if(!isNil "_marker") then {
            if((markerColor _marker) == "") then {
                    _marker = nil;
            };
        };

        if(isNil "_marker") then {
            
            _marker = call _createMarkerName;
            TRACE_2('Create Marker',_marker,_group);
            createMarkerLocal [_marker, _pos];
            _x setVariable[QGVAR(marker), _marker]; 
            _marker setMarkerShapeLocal "ICON";   

            //Set Marker details
            _data = _x getVariable QGVAR(data);
            TRACE_2('Create marker with data',_x,_data);
            _marker setMarkerTextLocal (_data select 0);

            //symbol and size
            switch(_data select 1) do {
                case "cy":{
                    _marker setMarkerTypeLocal "b_hq";
                    _marker setMarkerSizeLocal [0.9, 0.9];  
                };
                case "pl":{
                    _marker setMarkerTypeLocal "b_hq";
                    _marker setMarkerSizeLocal [0.9, 0.9];  
                };
                case "ft":{
                    _marker setMarkerTypeLocal "b_inf";
                    _marker setMarkerSizeLocal [0.6, 0.6];
                };
                case "sl":{
                    _marker setMarkerTypeLocal "b_hq";
                    _marker setMarkerSizeLocal [0.6, 0.6];  
                };
                case "mo":{
                    _marker setMarkerTypeLocal "b_motor_inf";
                    _marker setMarkerSizeLocal [0.6, 0.6];  
                };
                case "me":{
                    _marker setMarkerTypeLocal "b_mech_inf";
                    _marker setMarkerSizeLocal [0.8, 0.8];  
                };
                case "ma":{
                    _marker setMarkerTypeLocal "b_maint";
                    _marker setMarkerSizeLocal [0.8, 0.8]; 
                };
                case "ar":{
                    _marker setMarkerTypeLocal "b_armor";
                    _marker setMarkerSizeLocal [0.8, 0.8];  
                };
                case "ch":{
                    _marker setMarkerTypeLocal "b_air";
                    _marker setMarkerSizeLocal [0.8, 0.8];  
                };
                case "su":{
                    _marker setMarkerTypeLocal "b_support";
                    _marker setMarkerSizeLocal [0.8, 0.8];  
                };
                case "se":{
                    _marker setMarkerTypeLocal "b_service";
                    _marker setMarkerSizeLocal [0.8, 0.8];  
                };
                case "ay":{
                    _marker setMarkerTypeLocal "b_art";
                    _marker setMarkerSizeLocal [0.6, 0.6];  
                };
                case "fx":{
                    _marker setMarkerTypeLocal "b_plane";
                    _marker setMarkerSizeLocal [0.6, 0.6];  
                };
                default {
                    _marker setMarkerTypeLocal "b_inf";
                    _marker setMarkerSizeLocal [0.6, 0.6];
                };
            };
            //color
            _marker setMarkerColorLocal (_data select 2);
               
        }else{
            TRACE_2('Marker already exists, move',_marker,_pos);
            //player sideChat format["Move Marker %1",_marker]; 
            _marker setMarkerPosLocal _pos;
        };


        _markersRun = _markersRun + [_marker];
    };
};
LOG('Start marker loop');

_markers = [];
_markersRun = [];
while{true} do{
    _markersRun = [];
    {
         call _handleGroup; 
    } foreach allGroups;
    { deleteMarkerLocal _x } forEach (_markers - _markersRun);
    TRACE_2('Markers vs markersrun',_markers,_markersRun);
    _markers = _markersRun;
    sleep 1;
};
