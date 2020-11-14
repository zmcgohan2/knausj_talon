os: mac
app: com.citrix.XenAppViewer
-

start:
	key(ctrl-esc)

workspace setup:
	key(ctrl-esc)
	sleep(500ms)
	insert("h:m")
	sleep(100ms)
	key(return)

chart search <user.text>:
	key(ctrl-space)
	insert(text)
