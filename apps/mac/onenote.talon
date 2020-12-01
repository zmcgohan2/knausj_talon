app: com.microsoft.onenote.mac
-
bold: key(cmd-b)
italic: key(cmd-i)
strike through: key(ctrl-cmd--)
highlight: key(ctrl-cmd-h)

bullet: key(cmd-.)
check: key(cmd-1)

insert date: key(cmd-d)

heading one: key(cmd-alt-1)
heading two: key(cmd-alt-2)
normal: key(cmd-shift-n)
code: key(shift-k)

move up: key(cmd-alt-up)
move down: key(cmd-alt-down)
move right: key(cmd-])
move left: key(cmd-[)

collapse: key(ctrl-shift--)
expand: key(ctrl-shift-+)

go title: key(cmd-shift-t)

go (notebook | notebooks): key(ctrl-g)

go (section | sections): key(ctrl-shift-g)
section previous: key(cmd-{)
section next: key(cmd-})

go (page | pages): key(ctrl-cmd-g)
page new: key(cmd-n)
page previous: key(ctrl-cmd-g up)
page next: key(ctrl-cmd-g down)

forward: key(cmd-ctrl-right)
go back[ward]: key(cmd-ctrl-left)

edit link: key(cmd-k)
copy link: key(cmd-ctrl-c)

paste link:
	key(cmd-k)
	sleep(100ms)
	key(cmd-v)
	sleep(100ms)
	key(enter)