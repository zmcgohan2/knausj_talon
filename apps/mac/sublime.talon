app: com.sublimetext.4
-
# tag(): user.find_and_replace
# tag(): user.line_commands
# tag(): user.multiple_cursors
# tag(): user.snippets
# tag(): user.splits
tag(): user.tabs

file:
	key(cmd-p)

file name <user.text>:
	key(cmd-p)
	insert(user.text)

do [<user.text>]:
	key(cmd-shift-p)
	insert(user.text or "")

project switch [<user.text>]:
	key(cmd-ctrl-p)
	insert(user.text or "")

project symbol [<user.text>]:
	key(cmd-shift-r)
	insert(user.text or "")
