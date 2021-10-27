tag: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
and tag: talon_plugins.eye_zoom_mouse.zoom_mouse_use_pedal
-
#left pedal
key(f11): talon_plugins.eye_zoom_mouse.right_click()
key(alt-`): talon_plugins.eye_zoom_mouse.double_click()
key(home): talon_plugins.eye_zoom_mouse.right_click()
key(insert): talon_plugins.eye_zoom_mouse.mouse_trigger()
#right pedal
key(ctrl-shift-f7): talon_plugins.eye_zoom_mouse.triple_click()
key(ctrl-shift-f8): 
    talon_plugins.eye_zoom_mouse.mouse_drag()