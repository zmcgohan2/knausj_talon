os: mac
app: com.citrix.XenAppViewer
-

start [<user.text>]:
	key(ctrl-esc)
	insert(text or "")

workspace setup:
	key(ctrl-esc)
	sleep(500ms)
	insert("h:m")
	sleep(100ms)
	key(return)

hyperspace nonproduction:
	key(ctrl-esc)
	sleep(100ms)
	insert("H:\\Hyperspace nonproduction.RDP")
	key(return)

chart search [<user.text>]:
	key(ctrl-space)
	insert(text or "")

alt menu:
	key(cmd)

home drive:
	key(ctrl-esc)
	insert("h:")
	sleep(100ms)
	key(return)

# Chronicles navigation
exit: key(shift-f7)
previous: key(pageup)
next: key(pagedown)
chronicles item:
	key(home f9 i enter)