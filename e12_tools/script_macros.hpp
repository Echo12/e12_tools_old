//#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros_common.hpp"

#define __isAdmin ((player getVariable[QGVAR(isadmin),false]) || ((name player) in GVAR(settings_admins)))
#define __ISPERFLOGON(A) (!((A) select 0 == 0 && (A) select 1 == 0 && (A) select 2 == 0 && (A) select 3 == 0))
#define STATSSLEEP 2
#define STATSMAXDIST 250
