# Note: Dates are in US format (month[/day][/year])

# mm/0x
date <number_small> (o | zero) <digits>$:
	insert("{number_small}/0{digits}")

# mm/dd or mm/yy
date <number_small> <number_small>$:
	insert("{number_small_1}/{number_small_2}")

# mm/dd/0x
date <number_small> <user.day> (o | zero) <digits>$:
	insert("{number_small}/{day}/0{digits}")

# mm/dd/yy[yy]
date <number_small> <user.day> <user.year>:
	insert("{number_small}/{day}/{year}")

time <number_small> <user.ampm>:
	insert("{number_small}{ampm}")

time <number_small> <number> [<user.ampm>]:
	insert("{number_small}:{number}")
	insert(ampm or "")

time <number_small> [o] <digits> [<user.ampm>]:
	insert("{number_small}:0{digits}")
	insert(ampm or "")

time <number_small> o clock [<user.ampm>]:
	insert("{number_small}:00")
	insert(ampm or "")

time <number_small> hundred:
	insert("{number_small}:00")

time one thousand:
	insert("10:00")

time two thousand:
	insert("20:00")

insert date:
	user.insert_date()

insert time:
	user.insert_time_ampm()

time stamp:
	user.insert_time_ampm()
	insert(" - ")