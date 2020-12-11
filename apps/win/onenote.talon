os: windows
and app.name: ONENOTE.EXE
-
bold: key(ctrl-b)
italic: key(ctrl-i)
strike through: key(ctrl--)
highlight: key(ctrl-alt-h)

bullet: key(ctrl-.)
check: key(ctrl-1)
tag clear: key(ctrl-0)

insert date: key(alt-shift-d)

heading one: key(ctrl-alt-1)
heading two: key(ctrl-alt-2)
normal: key(ctrl-shift-n)
code: key(ctrl-shift-n alt-h l up enter)

move up: key(alt-shift-up)
move down: key(alt-shift-down)
move right: key(alt-shift-right)
move left: key(alt-shift-left)

collapse: key(alt-shift--)
expand: key(alt-shift-+)

go title: key(ctrl-shift-t)

go (notebook | notebooks): key(ctrl-g)

go (section | sections): key(ctrl-shift-g)
section previous: key(ctrl-shift-tab)
section next: key(ctrl-tab)

go (page | pages): key(ctrl-alt-g)
page new: key(ctrl-n)
page previous: key(ctrl-pageup)
page next: key(ctrl-pagedown)

forward: key(alt-right)
go back[ward]: key(alt-left)

edit link: key(ctrl-k)
copy link: key(shift-f10 p)
paste link: key(ctrl-k alt-e ctrl-v enter)
remove link: key(shift-f10 r)

# in window_management.talon on Mac
full screen: key(f11)

# not standard OneNote; triggers AutoHotKey macros I wrote
now: key(super-alt-i)
today: key(super-alt-d)

tomorrow:
	key(super-alt-shift-d)
	sleep(300ms)
	key(1)

<digit_string> days:
	key(super-alt-shift-d)
	sleep(300ms)
	insert(digit_string)
