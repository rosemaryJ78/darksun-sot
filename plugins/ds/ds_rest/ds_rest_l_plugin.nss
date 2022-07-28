// -----------------------------------------------------------------------------
//    File: ds_rest_l_plugin.nss
//  System: Rest (library)
// -----------------------------------------------------------------------------
// Description:
//  Library functions for PW Subsystem
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------

#include "util_i_library"
#include "core_i_framework"
#include "ds_rest_i_events"

// -----------------------------------------------------------------------------
//                               Library Dispatch
// -----------------------------------------------------------------------------

void OnLibraryLoad()
{
    if (!H2_USE_DS_REST_SYSTEM)
        return;

    object oPlugin = GetPlugin("ds");

    /*
    // ----- Module Events -----
    RegisterEventScript(oPlugin, MODULE_EVENT_ON_PLAYER_REST_CANCELLED, "rest_OnPlayerRestCancelled", 4.0);
    RegisterEventScript(oPlugin, MODULE_EVENT_ON_PLAYER_REST_FINISHED,  "rest_OnPlayerRestFinished",  4.0);
    RegisterEventScript(oPlugin, MODULE_EVENT_ON_PLAYER_REST_STARTED,   "rest_OnPlayerRestStarted",   4.0);
    RegisterEventScript(oPlugin, MODULE_EVENT_ON_CLIENT_ENTER,          "rest_OnClientEnter",         4.0);

    // ----- Module Events -----
    RegisterLibraryScript("rest_OnPlayerRestCancelled", 1);
    RegisterLibraryScript("rest_OnPlayerRestFinished",  2);
    RegisterLibraryScript("rest_OnPlayerRestStarted",   3);
    RegisterLibraryScript("rest_OnClientEnter",         0);

    // ----- Custom Events -----
    if (H2_REQUIRE_REST_TRIGGER_OR_CAMPFIRE)
    {
        RegisterLibraryScript("rest_OnTriggerEnter",    4);
        RegisterLibraryScript("rest_OnTriggerExit",     5);
    }   

    // ----- Tag Based Scripting -----
    RegisterLibraryScript(H2_FIREWOOD,                  6);
    */
}

void OnLibraryScript(string sScript, int nEntry)
{
    switch (nEntry)
    {
        /*
        // ----- Module Events -----
        case 1: rest_OnPlayerRestCancelled(); break;
        case 2: rest_OnPlayerRestFinished();  break;
        case 3: rest_OnPlayerRestStarted();   break;
        case 0: rest_OnClientEnter();         break;

        // ----- Custom Events -----
        case 4: rest_OnTriggerEnter();        break;
        case 5: rest_OnTriggerExit();         break;

        // ----- Tag-based Scripting
        case 6: rest_firewood();              break;
        */
        default: CriticalError("Library function " + sScript + " not found");
    }
}
