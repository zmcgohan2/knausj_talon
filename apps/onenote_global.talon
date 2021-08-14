os: mac
os: windows
-
^now (<phrase> | <user.number_string>):
	number = number_string or ""
	user.onenote_now("{phrase or number}")

key(ctrl-alt-i):
	user.onenote_now("")
