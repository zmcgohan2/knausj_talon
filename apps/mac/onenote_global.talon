os: mac
-
# not standard OneNote; approximate equivalent of AutoHotKey
now (<phrase> | <user.number_string>):
	user.onenote_focus()
	key(ctrl-e enter)
	# custom shortcut for "Remove Tag"
	key(cmd-alt-0)
	key(cmd-/ cmd-.)
	key(shift-tab:5 tab:2)
	user.insert_time_ampm()
	insert(" - {phrase or number_string}")