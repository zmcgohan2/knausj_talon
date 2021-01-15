app: com.apple.mail
-
archive: key(ctrl-cmd-a)
delete: key(backspace)
flag: key(cmd-shift-l)
junk: key(cmd-shift-j)
reply: key(cmd-r)
reply all: key(cmd-shift-r)

send [this] message: key(cmd-shift-d)

# MsgFiler
move:
	key(ctrl-s)

(move to | folder) [<user.text>]:
	key(ctrl-s)
	sleep(200ms)
	insert(user.text or "")