# Note: Dates are in US format (month/day[/year])

date <number_small> (o | zero) <number_small>$:
	insert("{number_small_1}/0{number_small_2}")

date <number_small> <number>$:
	insert("{number_small}/{number}")

date <number_small> twenty <digits>$:
	insert("{number_small}/2{digits}")

date <number_small> thirty <digits>$:
	insert("{number_small}/3{digits}")

date <number_small> <number_small> <number_small>:
	insert("{number_small_1}/{number_small_2}/{number_small_3}")

date <number_small> <number_small> nineteen <number_small>:
	insert("{number_small_1}/{number_small_2}/{1900 + number_small_3}")

date <number_small> <number_small> two thousand:
	insert("{number_small_1}/{number_small_2}/2000")

date <number_small> <number_small> (twenty | two thousand) <number_small>:
	insert("{number_small_1}/{number_small_2}/{2000 + number_small_3}")

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