#include "script_component.hpp"
TRACE_1("Process","PreInitServer");

//perf_mon
GVAR(perfLogServer)=[0, 0, 0, 0];
GVAR(perfLogHC)=[0, 0, 0, 0];

PREP(perfLogHC);
PREP(perfLogServer);