app.bundle: com.microsoft.onenote.mac
-
action(edit.select_line): key(cmd-a)

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
code: key(cmd-shift-k)

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

go forward: key(cmd-ctrl-right)
go back[ward]: key(cmd-ctrl-left)

[open] link: key(enter)
edit link: key(cmd-k)
copy link: key(cmd-ctrl-c)

paste link:
	key(cmd-k)
	sleep(100ms)
	key(cmd-v)
	sleep(100ms)
	key(enter)

# not standard OneNote; approximate equivalents of AutoHotKey
now:
	key(ctrl-e enter)
	# custom shortcut for "Remove Tag"
	key(cmd-alt-0)
	key(cmd-/ cmd-.)
	key(shift-tab:5 tab:2)
	user.insert_time_ampm()
	insert(" - ")

today:
	key(ctrl-e enter)
	# custom shortcut for "Remove Tag"
	key(cmd-alt-0)
	# neither bullets nor numbering
	key(cmd-/ cmd-. cmd-.)
	key(shift-tab:5)
	key(cmd-alt-1)
	key(cmd-d)
	insert('- ')
	key(enter tab cmd-1 up ctrl-e)