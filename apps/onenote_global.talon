os: mac
os: windows
-
^now (<phrase> | <user.number_string>):
	user.onenote_now()
	number = number_string or ""
	insert("{phrase or number}")

key(ctrl-alt-i):
	user.onenote_now()
