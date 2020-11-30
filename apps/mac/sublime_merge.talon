app.bundle: com.sublimemerge
-
do [<user.text>]:
	key(cmd-shift-p)
	insert(user.text or "")

message: key(cmd-9)
commit: key(cmd-enter)
push: key(cmd-alt-up)
pull: key(cmd-alt-down)
stage all:
	key(cmd-shift-a)
	sleep(100ms)
stage untracked: key(cmd-k cmd-a)