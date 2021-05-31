#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Print version to rpt log
private _version = getText (configFile >> "CfgPatches" >> "mts_markers" >> "versionStr");
INFO_1("Metis Marker version: %1.", _version);

//create namespace
if (isServer || (!isMultiplayer)) then {
    GVAR(namespace) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(namespace);
};

CHECK(!hasInterface);

#include "initKeybinds.hpp"
#include "init3denKeybinds.hpp"
#include "initSettings.hpp"
#include "initMarkerVariables.hpp"

GVAR(lastSelection) = [];

if (is3DEN) then {
    {
        _x call FUNC(createMarkerLocal);
    } forEach ("Scenario" get3DENMissionAttribute QGVAR(3denData));
};

GVAR(clipboard) = "";
