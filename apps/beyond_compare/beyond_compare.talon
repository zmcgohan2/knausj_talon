app: beyond_compare
-
tag(): user.tabs

diff [next]: key(ctrl-n)
diff prev: key(ctrl-p)
copy right: key(ctrl-r)
copy left: key(ctrl-l)
session save: key(ctrl-shift-s)
session clear: key(shift-ctrl-c)
refresh: key(f5)
refresh take: key(shift-f5)
refresh all: key(control-f5)
file grab all: key(shift-ctrl-a)

swap side:
    user.mouse_helper_position_save()
    user.mouse_helper_move_image_relative("2022-03-12_19.51.10.939194.png", 0)
    sleep(0.05)
    mouse_click(0)
    sleep(0.05)
    user.mouse_helper_position_restore()
show same:
    user.mouse_helper_position_save()
    user.mouse_helper_move_image_relative("2022-03-12_19.52.36.520398.png", 0)
    sleep(0.05)
    mouse_click(0)
    sleep(0.05)
    user.mouse_helper_position_restore()

show diffs:
    user.mouse_helper_position_save()
    user.mouse_helper_move_image_relative("2022-03-12_19.54.02.567912.png", 0)
    sleep(0.05)
    mouse_click(0)
    sleep(0.05)
    user.mouse_helper_position_restore()

show all:
    user.mouse_helper_position_save()
    user.mouse_helper_move_image_relative("2022-03-12_19.54.57.988520.png", 0)
    sleep(0.05)
    mouse_click(0)
    sleep(0.05)
    user.mouse_helper_position_restore()

expand:
    user.mouse_helper_position_save()
    user.mouse_helper_move_image_relative("2022-03-12_19.55.48.919363.png", 0)
    sleep(0.05)
    mouse_click(0)
    sleep(0.05)
    user.mouse_helper_position_restore()

collapse:
    user.mouse_helper_position_save()
    user.mouse_helper_move_image_relative("2022-03-12_19.56.21.447804.png", 0)
    sleep(0.05)
    mouse_click(0)
    sleep(0.05)
    user.mouse_helper_position_restore()