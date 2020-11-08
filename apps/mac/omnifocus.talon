os: mac
app.bundle: com.omnigroup.OmniFocus3.MacAppStore
-
open [<phrase>]:
	key(cmd-o)
	insert(user.formatted_text(phrase or "", "ALL_LOWERCASE,NO_SPACES"))

go in box:
	key(cmd-1)

go projects:
	key(cmd-2)

go tags:
	key(cmd-3)	

go forecast:
	key(cmd-4)

due today:
	key(ctrl-cmd-t)

due tomorrow:
	key(ctrl-cmd-m)

postpone [by] <number_small> days:
	user.postpone(number_small)

postpone:
	key(ctrl-cmd-l)

clear dates:
	key(ctrl-cmd-\)