app.bundle: com.sublimemerge
-
do [<user.text>]:
	key(cmd-shift-p)
	insert(user.text or "")

commit: key(cmd-enter)
push: key(cmd-alt-up)
pull: key(cmd-alt-down)
stage all: key(cmd-shift-a)
stage untracked: key(cmd-k cmd-a)