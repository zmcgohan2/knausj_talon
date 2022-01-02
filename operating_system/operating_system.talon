system shutdown:    user.system_shutdown()
system restart:     user.system_restart()
system rest:        user.system_hibernate()
system lock:        user.system_lock()
task manager:       user.system_task_manager()
desktop show:       user.system_show_desktop()
task view:          user.system_task_view()
switcher:           user.system_switcher()
spy:                user.system_search()
spy app [<user.text>]:     
     txt = text or ""
     user.system_search()
     insert(".{txt}")

spy file [<user.text>]:  
     txt = text or ""   
     user.system_search()
     insert("?{txt}")

spy service [<user.text>]:  
     txt = text or ""   
     user.system_search()
     insert("!{txt}")

spy process [<user.text>]:  
     txt = text or ""   
     user.system_search()
     insert("<{txt}")

spy setting [<user.text>]:  
     txt = text or ""   
     user.system_search()
     insert("${txt}")

spy code [<user.text>]:
     txt = text or ""   
     user.system_search()
     insert("{{{txt}")

open {user.launch_command}:
     user.exec(launch_command)
 