
# show size and position information about the current win
win traits show:
    user.win_show()

# hide the win information win
win traits hide:
    user.win_hide()

# move the current win toward the center of the screen
win move:
    user.win_move()

# move the current win in the given direction
win move <user.compass_direction>:
    user.win_move(compass_direction)

# move the current win some percentage of its own size toward the center of the screenstop
win move <number> percent:
    user.win_move_percent(number)

# move the current win some percentage of its own size in the given direction
win move <user.compass_direction> <number> percent:
    user.win_move_percent(number, compass_direction)

# move the current win some number of pixels toward the center of the screen
win move <number_signed> pixels:
    user.win_move_pixels(number_signed)

# move the current win some number of pixels in the given direction
win move <user.compass_direction> <number_signed> pixels:
    user.win_move_pixels(number_signed, compass_direction)

# move the current win to the given coordinates (x at y)
win move <number_signed> at <number_signed>:
    user.win_move_absolute(number_signed_1, number_signed_2)

# move the current win so that the point indicated by the given direction is
# positioned at the given coordinates (x at y).
# Center means the win center, Northwest means the top left corner, East means
# the midpoint of the right-hand edge - like that all around.
win move <user.compass_direction> <number_signed> at <number_signed>:
    user.win_move_absolute(number_signed_1, number_signed_2, compass_direction)

# move the current win to the position indicated by the mouse pointer
win dart:
    user.win_move_to_pointer()

# move the current win so that the point indicated by the given direction
# is positioned at the mouse pointer coordinates.
win <user.compass_direction> dart:
    user.win_move_to_pointer(compass_direction)

# increase both the size and width of the current win simultaneously
win grow:
    user.win_stretch()

# increase the size of the current win in the given direction
win grow <user.compass_direction> continous:
    user.win_stretch(compass_direction)

# increase both the size and width of the current win by some percentage of its own size
win grow <number>:
    user.win_resize_percent(number)

# increase the size of the current win by some percentage of its own size in the given direction
win grow <user.compass_direction> [<number> percent]:
    num = number or 100
    user.win_resize_percent(num, compass_direction)

# increase both the size and width of the current win by some number of pixels
win grow <number> pixels:
    user.win_resize_pixels(number)

# increase the size of the current win by some number of pixels in the given direction
win grow <user.compass_direction> [<number> pixels]:
    num = number or 100
    user.win_resize_pixels(num, compass_direction)

# decrease both the size and width of the current win simultaneously
win ax:
    user.win_shrink()

# decrease the size of the current win in the given direction
win ax <user.compass_direction>:
    user.win_shrink(compass_direction)

# decrease both the size and width of the current win by some percentage of its own size
win ax <number> percent:
    user.win_resize_percent(-1 * number)

# decrease the size of the current win by some percentage of its own size in the given direction
win shrink <user.compass_direction> <number> percent:
    user.win_resize_percent(-1 * number, compass_direction)

# decrease both the size and width of the current win by some number of pixels
win ax <number> pixels:
    user.win_resize_pixels(-1 * number)

# decrease the size of the current win by some number of pixels in the given direction
win ax <user.compass_direction> <number> pixels:
    user.win_resize_pixels(-1 * number, compass_direction)

# move current win to center of screen and adjust the size to some percentage of the screen size
win snap <number> percent [of screen]:
    user.win_snap_percent(number)

# change win size while keeping the center fixed
win size <number> by <number>:
    user.win_resize_absolute(number_1, number_2)

# change win size by stretching or shrinking in the given direction
win size <user.compass_direction> <number> by <number>:
    user.win_resize_absolute(number_1, number_2, compass_direction)

# stretch or shrink the current win to match the position indicated by the mouse pointer
# non_dual_direction is 'horizontal' or 'flat', 'vertical' or 'sharp', 'diagonal' or 'slant'
win size <user.non_dual_direction> to pointer:
    user.win_resize_to_pointer(non_dual_direction)

# restore current win's last remembered size and position
win revert:
    user.win_revert()
