os: windows
and app.exe: sublime_merge.exe
-
do [<user.text>]:
	key(ctrl-shift-p)
	insert(user.text or "")

^message [<user.prose>]$:
	key(ctrl-9)
	sleep(100ms)
	user.insert_formatted(prose or "", "CAPITALIZE_FIRST_WORD")

commit: key(ctrl-enter)
push: key(ctrl-alt-up)
pull: key(ctrl-alt-down)
stage all:
	key(ctrl-shift-a)
	sleep(100ms)
stage untracked: key(ctrl-k ctrl-a)