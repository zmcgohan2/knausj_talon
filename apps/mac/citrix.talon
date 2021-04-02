os: mac
app: com.citrix.XenAppViewer
app: com.citrix.receiver.icaviewer.mac
-

# Windows
start [<user.text>]:
	key(ctrl-esc)
	insert(text or "")

workspace setup:
	key(ctrl-esc)
	sleep(500ms)
	insert("h:m")
	sleep(200ms)
	key(return)

hyperspace nonproduction:
	key(ctrl-esc)
	sleep(1s)
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
chronicles item: key(home f9 i enter)
chronicles screen: key(home f9 s enter)

# Lookitt
routine do: insert("d ^")
routine save: insert("d ^%ZeRSAVE")
routine load: insert("d ^%ZeRLOAD")
routine find: insert("d ^%ZRFIND")
clinical admin: insert(";l")
edit <user.letter> <user.letter> <user.letter>:
	insert("e {letter_1}{letter_2}{letter_3}")
	key(enter enter)
	insert("1;1")
	key(enter)
edit <user.letter> <number_small> <user.letter>:
	insert("e {letter_1}{number_small}{letter_2}")
	key(enter enter)
	insert("1;1")
	key(enter)
