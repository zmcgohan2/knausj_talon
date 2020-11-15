app: com.sublimetext.4
-
tag(): user.find_and_replace
tag(): user.line_commands
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

# more direct word/line processing
action(edit.select_word):
	key(cmd-d)

action(edit.select_line):
	key(cmd-l)

action(edit.delete_line): 
	key(ctrl-shift-k)

# user.line_commands
action(edit.line_swap_up):
	key(cmd-ctrl-up)

action(edit.line_swap_down):
	key(cmd-ctrl-down)

action(edit.line_clone):
	key(cmd-shift-d)

# user.find_and_replace
action(user.find_toggle_match_by_case):
	key(cmd-alt-c)

action(user.find_toggle_match_by_word):
	key(cmd-alt-w)

action(user.find_toggle_match_by_regex):
	key(cmd-alt-r)

action(user.find_next):
	key(cmd-g)

action(user.find_previous):
	key(cmd-shift-g)

action(user.replace_confirm):
	key(cmd-alt-e)
