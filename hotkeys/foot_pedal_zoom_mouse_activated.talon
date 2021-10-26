tag: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
-
#left pedal
key(f11): talon_plugins.eye_zoom_mouse.right_click()
key(alt-`): talon_plugins.eye_zoom_mouse.double_click()

#right pedal
key(ctrl-shift-f7): talon_plugins.eye_zoom_mouse.triple_click()
key(ctrl-shift-f8): 
    print("hit")
    talon_plugins.eye_zoom_mouse.mouse_drag()   
# parrot(shush):
# 	print("shush") 
# 	talon_plugins.eye_zoom_mouse.triple_click()
# parrot(tut):
# 	print("tut") 
# 	talon_plugins.eye_zoom_mouse.double_click()