system shutdown:    user.system_shutdown()
system restart:     user.system_restart()
system rest:        user.system_hibernate()
system lock:        user.system_lock()
task manager:       user.system_task_manager()
desktop show:       user.system_show_desktop()
task view:          user.system_task_view()
switcher:           user.system_switcher()

open {user.launch_command}:
     user.exec(launch_command)
 