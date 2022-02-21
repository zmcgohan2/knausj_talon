os: windows
user.running: PowerToys.Runner
-
^con [<user.text>]:
	txt = text or ""   
    user.system_search()
    sleep(100ms)
    insert("<{txt}")