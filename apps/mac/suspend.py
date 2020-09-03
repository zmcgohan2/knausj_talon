from talon import actions, ui
was_enabled = False
def fn(_):
    global was_enabled
    if ui.active_app().bundle in (
        'com.citrix.XenAppViewer',
        'com.webex.meetingmanager',
        'com.microsoft.teams'
        ) and actions.speech.enabled():
        was_enabled = True
        actions.user.switcher_hide_running()
        actions.user.history_disable()
        actions.user.homophones_hide()
        actions.user.help_hide()
        actions.user.mouse_sleep()
        actions.speech.disable()
    elif was_enabled:
        was_enabled = False
        actions.speech.enable()
ui.register('app_activate', fn)