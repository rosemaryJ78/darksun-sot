// -----------------------------------------------------------------------------
//    File: htf_l_plugin.nss
//  System: Hunger Thirst Fatigue (library)
// -----------------------------------------------------------------------------
// Description:
//  Library functions for PW Subsystem
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------

#include "util_i_library"
#include "core_i_framework"
#include "htf_i_const"
#include "htf_i_events"

// -----------------------------------------------------------------------------
//                               Library Dispatch
// -----------------------------------------------------------------------------

void OnLibraryLoad()
{
    if (!GetIfPluginExists("pw"))
        return;

    object oPlugin = GetPlugin("pw");

    if (!H2_USE_HUNGERTHIRST_SYSTEM && !H2_USE_FATIGUE_SYSTEM) 
        return;

    if (H2_USE_HUNGERTHIRST_SYSTEM)
    {
        // ----- Module Events -----
        RegisterEventScript(oPlugin, MODULE_EVENT_ON_CLIENT_ENTER,         "hungerthirst_OnClientEnter",        4.0);
        RegisterEventScript(oPlugin, MODULE_EVENT_ON_PLAYER_DEATH,         "hungerthirst_OnPlayerDeath",        4.0);
        RegisterEventScript(oPlugin, MODULE_EVENT_ON_PLAYER_REST_FINISHED, "hungerthirst_OnPlayerRestFinished", 4.0);
        RegisterEventScript(oPlugin, TRIGGER_EVENT_ON_ENTER,               "hungerthirst_OnTriggerEnter",       4.0);
        RegisterEventScript(oPlugin, TRIGGER_EVENT_ON_EXIT,                "hungerthirst_OnTriggerExit",        4.0);
        
        // ----- Timer Events -----
        RegisterEventScript(oPlugin, H2_HT_ON_TIMER_EXPIRE,                "htf_ht_OnTimerExpire",              4.0);
    }

    if (H2_USE_FATIGUE_SYSTEM)
    {
        // ----- Module Events -----
        RegisterEventScript(oPlugin, MODULE_EVENT_ON_CLIENT_ENTER,         "fatigue_OnClientEnter",             4.0);
        RegisterEventScript(oPlugin, MODULE_EVENT_ON_PLAYER_REST_FINISHED, "fatigue_OnPlayerRestFinished",      4.0);
        
        // ----- Timer Events -----
        RegisterEventScript(oPlugin, H2_FATIGUE_ON_TIMER_EXPIRE,           "htf_f_OnTimerExpire",               4.0);
    }

    if (H2_USE_HUNGERTHIRST_SYSTEM)
    {
        // ----- Module Events -----
        RegisterLibraryScript("hungerthirst_OnClientEnter",         1);
        RegisterLibraryScript("hungerthirst_OnPlayerDeath",         2);
        RegisterLibraryScript("hungerthirst_OnPlayerRestFinished",  3);
        RegisterLibraryScript("hungerthirst_OnTriggerEnter",        11);
        RegisterLibraryScript("hungerthirst_OnTriggerExit",         12);
        
        // ----- Timer Events -----
        RegisterLibraryScript("htf_ht_OnTimerExpire",               8);
        RegisterLibraryScript("htf_drunk_OnTimerExpire",            10);
    }

    if (H2_USE_FATIGUE_SYSTEM)
    {
        // ----- Module Events -----
        RegisterLibraryScript("fatigue_OnClientEnter",              4);
        RegisterLibraryScript("fatigue_OnPlayerRestFinished",       5);

        // ----- Timer Events -----
        RegisterLibraryScript("htf_f_OnTimerExpire",                9);
    }

    // ----- Tag-based Scripting -----
    RegisterLibraryScript(H2_HT_CANTEEN,                            6);
    RegisterLibraryScript(H2_HT_FOODITEM,                           7);
}

void OnLibraryScript(string sScript, int nEntry)
{
    if (!H2_USE_HUNGERTHIRST_SYSTEM && !H2_USE_FATIGUE_SYSTEM) 
    {
        CriticalError("Library function called on inactive system (HTF).");
        return;
    }

    switch (nEntry)
    {
        // ----- Module Events -----
        case 1:  hungerthirst_OnClientEnter();        break;
        case 2:  hungerthirst_OnPlayerDeath();        break;
        case 3:  hungerthirst_OnPlayerRestFinished(); break;
        case 4:  fatigue_OnClientEnter();             break;
        case 5:  fatigue_OnPlayerRestFinished();      break;
        case 11: hungerthirst_OnTriggerEnter();       break;
        case 12: hungerthirst_OnTriggerExit();        break;

        // ----- Tag-based Scripting -----
        case 6:  htf_canteen();                       break;
        case 7:  htf_fooditem();                      break;

        // ----- Timer Events -----
        case 8:  htf_ht_OnTimerExpire();              break;
        case 9:  htf_f_OnTimerExpire();               break;
        case 10: htf_drunk_OnTimerExpire();           break;
        default: CriticalError("Library function " + sScript + " not found");
    }
}
