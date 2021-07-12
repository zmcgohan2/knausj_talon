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

insert: key(ctrl-f2 d return k return down:2 right i return)
