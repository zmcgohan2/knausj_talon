os: windows
user.running: PowerToys.Runner
-
^spy win[<user.text>]:
	txt = text or ""   
    user.system_search()
    sleep(100ms)
    insert("<{txt}")