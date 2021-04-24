#defines the commands that sleep/wake Talon
mode: all
-
^welcome back$:
    user.mouse_wake()
    user.enable_hud()
    # user.history_enable()
    user.talon_mode()
^sleep all$:
    user.switcher_hide_running()
    user.disable_hud()
    # user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    user.engine_sleep()
^go to sleep$: speech.disable()
^wake up$: speech.enable()

