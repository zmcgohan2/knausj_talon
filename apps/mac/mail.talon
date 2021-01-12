app: com.apple.mail
-
archive: key(ctrl-cmd-a)
delete: key(backspace)
flag: key(cmd-shift-l)
junk: key(cmd-shift-j)
reply: key(cmd-r)
reply all: key(cmd-shift-r)

# MsgFiler
move:
	key(ctrl-s)

move to [<user.text>]:
	key(ctrl-s)
	insert(user.text or "")