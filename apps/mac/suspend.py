from talon import actions, ui

DEFAULT_DISABLE_BUNDLE_IDS = frozenset({
    'com.apple.FaceTime',
    'com.citrix.XenAppViewer',
    'com.webex.meetingmanager',
    'com.microsoft.teams'
})

was_enabled_globally = False
was_enabled_in_app = set()
last_active_app_bundle_id = None

def fn(_):
    global was_enabled_globally, last_active_app_bundle_id
    active_app_bundle_id = ui.active_app().bundle
    if actions.speech.enabled():
        if active_app_bundle_id in DEFAULT_DISABLE_BUNDLE_IDS:
            was_enabled_globally = True
            if active_app_bundle_id not in was_enabled_in_app:
                actions.user.switcher_hide_running()
                actions.user.history_disable()
                actions.user.homophones_hide()
                actions.user.help_hide()
                actions.user.mouse_sleep()
                actions.speech.disable()
        elif last_active_app_bundle_id in DEFAULT_DISABLE_BUNDLE_IDS:
            was_enabled_in_app.add(last_active_app_bundle_id)
    elif last_active_app_bundle_id in DEFAULT_DISABLE_BUNDLE_IDS:
        was_enabled_in_app.discard(last_active_app_bundle_id)
        was_enabled_globally = False
    elif was_enabled_globally:
        was_enabled_globally = False
        actions.speech.enable()
    last_active_app_bundle_id = active_app_bundle_id
    
ui.register('app_activate', fn)