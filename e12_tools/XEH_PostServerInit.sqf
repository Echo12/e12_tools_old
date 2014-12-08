#include "script_component.hpp"
TRACE_1("Process","PostInitServer");

// Activate Server debug
if (isServer) then{
	if(isNil "e12_amf_perflog_disable") then {
		[] spawn FUNC(perfLogServer);    
	};
};