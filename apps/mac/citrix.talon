os: mac
app: com.citrix.XenAppViewer
-

start:
	key(ctrl-esc)

workspace setup:
	key(ctrl-esc)
	sleep(50ms)
	insert("h:m")
	key(return)

chart search <user.text>:
	key(ctrl-space)
	insert(text)
