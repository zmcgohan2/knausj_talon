os: windows
and app.name: Sublime Text
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
# tag(): user.snippets
tag(): user.tabs

file:
	key(ctrl-p)

file name <user.text>:
	key(ctrl-p)
	insert(user.text)

do [<user.text>]:
	key(ctrl-shift-p)
	insert(user.text or "")

project switch [<user.text>]:
	key(alt p s)
	insert(user.text or "")

project symbol [<user.text>]:
	key(ctrl-shift-r)
	insert(user.text or "")

slap: key(ctrl-enter)

# navigate through multifile search results
result next: key(f4 f3)
result previous: key(shift-f4 f3)

action(app.window_open): key(ctrl-shift-n)
action(app.window_close): key(ctrl-shift-w)

action(code.toggle_comment): key(ctrl-/)

# more direct word/line processing - actions are in core,
# but voice commands are enabled with tag(user.line_commands)
action(edit.delete_line): key(ctrl-shift-k)
action(edit.line_clone): key(ctrl-shift-d)
action(edit.line_swap_up): key(ctrl-shift-up)
action(edit.line_swap_down): key(ctrl-shift-down)
action(edit.select_word): key(ctrl-d)
action(edit.select_line): key(ctrl-l)

# user.find_and_replace
action(user.find_toggle_match_by_case): key(alt-c)
action(user.find_toggle_match_by_word): key(alt-w)
action(user.find_toggle_match_by_regex): key(alt-r)
action(user.find_next): key(f3)
action(user.find_previous): key(shift-f3)
action(user.replace_confirm): key(ctrl-shift-h)
action(user.replace_confirm_all): key(ctrl-alt-enter)

# user.line_commands
action(user.extend_camel_left): key(alt-shift-left)
action(user.extend_camel_right): key(alt-shift-right)
action(user.camel_left): key(alt-left)
action(user.camel_right): key(alt-right)

# user.multiple_cursors
action(user.multi_cursor_add_above): key(ctrl-alt-up)
action(user.multi_cursor_add_below): key(ctrl-alt-down)
action(user.multi_cursor_add_to_line_ends): key(ctrl-shift-l)
action(user.multi_cursor_disable): key(escape)
action(user.multi_cursor_enable): skip()
action(user.multi_cursor_select_all_occurrences): key(alt-f3)
action(user.multi_cursor_select_fewer_occurrences): key(ctrl-u)
action(user.multi_cursor_select_more_occurrences): key(ctrl-d)
