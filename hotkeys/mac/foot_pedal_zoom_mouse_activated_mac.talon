os: mac
and tag: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
and tag: talon_plugins.eye_zoom_mouse.zoom_mouse_use_pedal
-
#left pedal
#left 
key(keypad_2): talon_plugins.eye_zoom_mouse.right_click()
#middle
key(keypad_3): talon_plugins.eye_zoom_mouse.double_click()

#right pedal
#left
key(pageup): talon_plugins.eye_zoom_mouse.triple_click()
#middle
key(pagedown): 
    print("drag")
    talon_plugins.eye_zoom_mouse.mouse_drag()
key(ctrl-shift-f12): 
    print("attempting mouse move...")
    talon_plugins.eye_zoom_mouse.mouse_move()

#Blue2 
key(home): talon_plugins.eye_zoom_mouse.right_click()
key(insert): talon_plugins.eye_zoom_mouse.mouse_trigger()
