os: mac
app: com.citrix.XenAppViewer
-

start:
	key(ctrl-esc)

workspace setup:
	key(ctrl-esc)
	sleep(200ms)
	insert("h:m")
	sleep(50ms)
	key(return)

chart search <user.text>:
	key(ctrl-space)
	insert(text)
