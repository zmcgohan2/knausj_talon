numb <number>:
	insert("{number}")

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
