app.bundle: com.microsoft.onenote.mac
-
action(edit.select_line):
	key(cmd-a)
	sleep(100ms)

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

title [<user.prose>]$:
	key(cmd-shift-t)
	sleep(100ms)
	user.insert_formatted(prose or "", "CAPITALIZE_FIRST_WORD")

go (notebook | notebooks): key(ctrl-g)

go (section | sections): key(ctrl-shift-g)
section previous: key(cmd-{)
section next: key(cmd-})

go (page | pages): key(ctrl-cmd-g)
page new:
	key(cmd-n)
	sleep(100ms)
page delete: key(ctrl-cmd-g cmd-delete)
page previous: key(ctrl-cmd-g up tab)
page next: key(ctrl-cmd-g down tab)
page move right: key(cmd-alt-])
page move left: key(cmd-alt-[)

# navigating in notebook/section/page lists
go top: key(alt-up)
go bottom: key(alt-down)

go forward: key(cmd-ctrl-right)
go back[ward]: key(cmd-ctrl-left)

[open] link: key(right left enter)
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

# back to progress (first notebook, first section)
go progress:
	key(ctrl-g alt-up enter)
	sleep(200ms)
	key(alt-up tab:2)
