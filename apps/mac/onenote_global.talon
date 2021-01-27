os: mac
-
# not standard OneNote; approximate equivalent of AutoHotKey
action(user.onenote_now):
	user.onenote_focus()
	key(ctrl-e enter)
	# custom shortcut for "Remove Tag"
	key(cmd-alt-0)
	key(cmd-/ cmd-.)
	key(shift-tab:5 tab:2)
	user.insert_time_ampm()
	insert(" - ")

now (<phrase> | <user.number_string>):
	user.onenote_now()
	number = number_string or ""
	insert("{phrase or number}")

key(ctrl-alt-i):
	user.onenote_now()