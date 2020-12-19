os: windows
and app.name: Outlook
-
archive: key(backspace)
flag: key(shift-f10 u a)
unflag:	key(shift-f10 u e)
junk: key(shift-f10 j enter)

move:
	key(ctrl-shift-v)

move to [<user.text>]:
	key(ctrl-shift-v)
	insert(user.text or "")

reply: key(ctrl-r)
reply all: key(ctrl-shift-r)