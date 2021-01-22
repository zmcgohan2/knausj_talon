os: windows
and app.exe: sublime_merge.exe
-
do [<user.text>]:
	key(ctrl-shift-p)
	insert(user.text or "")

message: key(ctrl-9)
commit: key(ctrl-enter)
push: key(ctrl-alt-up)
pull: key(ctrl-alt-down)
stage all:
	key(ctrl-shift-a)
	sleep(100ms)
stage untracked: key(ctrl-k ctrl-a)