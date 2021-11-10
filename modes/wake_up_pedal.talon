#defines the commands that sleep/wake Talon
mode: all
and not tag: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
-
key(ctrl-shift-f12): 
    user.wake_or_sleep()


