grid:
    user.grid_activate()
    speech.disable()

grid <number>+$:
    user.grid_narrow_list(number_list)
    user.grid_activate()
    speech.disable()

grid screen <number>$:
    user.grid_select_screen(number)
    user.grid_activate()
    speech.disable()
