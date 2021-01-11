os: mac
app: com.citrix.XenAppViewer
-

# Windows
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

home drive:
	key(ctrl-esc)
	insert("h:")
	sleep(100ms)
	key(return)

# Hyperspace
alt menu:
	key(cmd)

chart search [<user.text>]:
	key(ctrl-space ctrl-a)
	insert(text or "")

master navigation:
	key(ctrl-space ctrl-home)

# Chronicles
exit: key(shift-f7)
previous: key(pageup)
next: key(pagedown)
chronicles item:
	key(home f9 i enter)