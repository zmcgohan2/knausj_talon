control mouse: user.mouse_toggle_control_mouse()
zoom mouse: user.mouse_toggle_zoom_mouse()
camera overlay: user.mouse_toggle_camera_overlay()
run calibration: user.mouse_calibrate()	
touch: 
	mouse_click(0)
	# close the mouse grid if open
	user.grid_close()
    	# End any open drags
	# Touch automatically ends left drags so this is for right drags specifically
	user.mouse_drag_end()

righty:
	mouse_click(1)
	# close the mouse grid if open
	user.grid_close()

midclick: 
	mouse_click(2)
	# close the mouse grid
	user.grid_close()

#see keys.py for modifiers.
#defaults
#command
#control
#option = alt
#shift
#super = windows key
<user.modifiers> touch: 
	key("{modifiers}:down")
	mouse_click(0)
	key("{modifiers}:up")
	# close the mouse grid
	user.grid_close()
<user.modifiers> righty: 
	key("{modifiers}:down")
	mouse_click(1)
	key("{modifiers}:up")
	# close the mouse grid
	user.grid_close()
dubclick: 
	mouse_click()
	mouse_click()
	# close the mouse grid
	user.grid_close()
tripclick:
	mouse_click()
	mouse_click()
	mouse_click()
	# close the mouse grid
	user.grid_close()
# <user.modifiers> stupid test: 
# 	key("{modifiers}:down")
# 	user.mouse_drag()
# <user.modifiers> drag release: 
# 	user.mouse_drag()
# 	key("{modifiers}:up")
drag:
	user.mouse_drag(0)
wheel down [<number_small>]: 
	num = number_small or 1
	num = num - 1
	user.mouse_scroll_down()
	repeat(num)
wheel down here [<number_small>]:
	num = number_small or 1
	num = num - 1
    user.mouse_move_center_active_window()
    user.mouse_scroll_down()
	repeat(num)
wheel tiny [down] [<number_small>]: 
	num = number_small or 1
	num = num - 1
	mouse_scroll(20)
	repeat(num)
wheel tiny [down] here [<number_small>]:
	num = number_small or 1
	num = num - 1
    user.mouse_move_center_active_window()
    mouse_scroll(20)
	repeat(num)
wheel downer [<number_small>]: 
	num = number_small or 1
	num = num - 1
	user.mouse_scroll_down_continuous()
	repeat(num)
wheel downer here [<number_small>]:
	num = number_small or 1
	num = num - 1
    user.mouse_move_center_active_window()
    user.mouse_scroll_down_continuous()
	repeat(num)
wheel up [<number_small>]:
	num = number_small or 1
	num = num - 1
	user.mouse_scroll_up()
	repeat(num)
wheel up here [<number_small>]:
	num = number_small or 1
	num = num - 1
	user.mouse_scroll_up()
	repeat(num)
wheel tiny up [<number_small>]: 
	num = number_small or 1
	num = num - 1
	mouse_scroll(-20)
	repeat(num)
wheel tiny up here [<number_small>]:
	num = number_small or 1
	num = num - 1
    user.mouse_move_center_active_window()
    mouse_scroll(-20)
	repeat(num)
wheel upper [<number_small>]: 
	num = number_small or 1
	num = num - 1
	user.mouse_scroll_up_continuous()
	repeat(num)
wheel upper here [<number_small>]:
	num = number_small or 1
	num = num - 1
	user.mouse_move_center_active_window()
    user.mouse_scroll_up_continuous()
	repeat(num)
wheel gaze: user.mouse_gaze_scroll()
wheel gaze cursor: user.mouse_gaze_scroll_cursor()
wheel gaze cursor here: 
    user.mouse_move_center_active_window()
	user.mouse_gaze_scroll_cursor()
wheel gaze here:
    user.mouse_move_center_active_window()
    user.mouse_gaze_scroll()
wheel stop: user.mouse_scroll_stop()
wheel stop here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_stop()
wheel left [<number_small>]: 
	num = number_small or 1
	num = num - 1
	mouse_scroll(0, -40)
	repeat(num)
wheel left here [<number_small>]:
	num = number_small or 1
	num = num - 1
    user.mouse_move_center_active_window()
    mouse_scroll(0, -40)
	repeat(num)
wheel tiny left [<number_small>]: 
	num = number_small or 1
	num = num - 1
	mouse_scroll(0, -20)
	repeat(num)
wheel tiny left here [<number_small>]:
	num = number_small or 1
	num = num - 1
    user.mouse_move_center_active_window()
    mouse_scroll(0, -20)
	repeat(num)
wheel right [<number_small>]: 
	num = number_small or 1
	num = num - 1
	mouse_scroll(0, 40)
	repeat(num)
wheel right here [<number_small>]:
	num = number_small or 1
	num = num - 1
    user.mouse_move_center_active_window()
    mouse_scroll(0, 40)
	repeat(num)
wheel tiny right [<number_small>]: 
	num = number_small or 1
	num = num - 1
	mouse_scroll(0, 20)
	repeat(num)
wheel tiny right here [<number_small>]:
	num = number_small or 1
	num = num - 1
    user.mouse_move_center_active_window()
    mouse_scroll(0, 20)
	repeat(num)
mouse copy position: user.copy_mouse_position()

