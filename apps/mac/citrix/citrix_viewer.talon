app: citrix_viewer
-

# keys get dropped frequently
settings():
	key_wait = 4.0

# Windows
start [<user.text>]:
	key(ctrl-esc)
	insert(text or "")

workspace setup:
	key(ctrl-esc)
	sleep(500ms)
	insert("run")
	sleep(500ms)
	key(return)
	sleep(1s)
	# if trying to insert "h:m" directly into search box, often : turns into ;
	insert("h:m")
	key(return)

hyperspace nonproduction:
	key(ctrl-esc)
	sleep(1s)
	# most commonly the colon gets dropped here
	insert("h:\\hyperspace nonproduction.rdp")
	sleep(500ms)
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

# XXX handle repeating
section up: key(alt-up)
section down: key(alt-down)
tab up: key(ctrl-up)
tab down: key(ctrl-down)

insert: key(ctrl-f2 d return k return down:2 right i return)

# Chronicles
exit: key(shift-f7)
previous: key(pageup)
next: key(pagedown)
chronicles item: key(home f9 i enter)
chronicles screen: key(home f9 s enter)
chronicles restore: key(f3)
item delete: key(f1)
item clear: key(f2)
item insert: key(shift-f6 ctrl-f2 d return k return down:2 right i return)
item help: key(shift-f5)
item info: key(home f7)

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
