system shutdown:    user.system_shutdown()
system restart:     user.system_restart()
system hibernate:   user.system_hibernate()
#system lock:        user.system_lock()
task manager:       user.system_task_manager()
desktop show:       key(super-d)

open {user.launch_command}:
     user.exec(launch_command)