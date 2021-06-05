os: mac
-
fantastical <user.text>:
	user.fantastical_parse(user.formatted_text(user.text, 'CAPITALIZE_FIRST_WORD'))

fantastical <user.text> over:
	user.fantastical_parse("{user.formatted_text(user.text, 'CAPITALIZE_FIRST_WORD')} ")
	sleep(500ms)

calendar mini:
	user.fantastical_show_mini_calendar()

calendar open:
	user.fantastical_show_calendar()

# XXX eliminate duplication with date_time.talon

# mm/0x
date <user.month> (o | zero) <digits>$:
	key(cmd-shift-t)
	insert("{month}/0{digits}")
	key(enter)

# mm/dd or mm/yy
date <user.month> <number_small>$:
	key(cmd-shift-t)
	insert("{month}/{number_small}")
	key(enter)

# mm/dd/0x
date <user.month> <user.day> (o | zero) <digits>$:
	key(cmd-shift-t)
	insert("{month}/{day}/0{digits}")
	key(enter)

# mm/dd/yy[yy]
date <user.month> <user.day> <user.year>:
	key(cmd-shift-t)
	insert("{month}/{day}/{year}")
	key(enter)
