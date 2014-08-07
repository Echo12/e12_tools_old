#include "script_component.hpp"
TRACE_1("Process","ClientPostInit");

if(isNil "e12_amf_tracking_enabled") exitWith {};

[] spawn FUNC(markerLoop);