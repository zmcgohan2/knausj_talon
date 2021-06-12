app.bundle: com.microsoft.onenote.mac
-
tag(): user.find_and_replace

action(edit.select_line):
	key(cmd-a)
	sleep(100ms)

bold: key(cmd-b)
italic: key(cmd-i)
strike through: key(ctrl-cmd--)
highlight: key(ctrl-cmd-h)

bullet: key(cmd-.)
check | done: key(cmd-1)

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

go (notebook | notebooks): key(ctrl-g)

go (section | sections): key(ctrl-shift-g)
section new: key(cmd-t)
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

[page] name date [<user.prose>]$:
	key(cmd-shift-t cmd-d)
	sleep(200ms)
	insert(prose or "")

[page] name [<user.prose>]$:
	key(cmd-shift-t)
	sleep(100ms)
	user.insert_formatted(prose or "", "CAPITALIZE_FIRST_WORD")

# navigating in notebook/section/page lists
go top: key(alt-up)
go bottom: key(alt-down)

go forward: key(cmd-ctrl-right)
go back[ward]: key(cmd-ctrl-left)

[open] link: key(left right:2 enter)
edit link: key(cmd-k)
copy link: user.onenote_copy_link()
key(cmd-ctrl-c): user.onenote_copy_link()

paste link:
	key(cmd-k)
	sleep(100ms)
	key(cmd-v)
	sleep(100ms)
	key(enter cmd-shift-n)

# user.find_and_replace
action(user.find_next): key(cmd-g)
action(user.find_previous): key(cmd-shift-g)

# missing shortcut for hiding navigation
(navigation hide | escape): user.onenote_hide_navigation()
key(esc): user.onenote_hide_navigation()

# not standard OneNote; approximate equivalents of AutoHotKey
action(user.onenote_heading_1):
	key(ctrl-e enter)
	# custom shortcut for "Remove Tag"
	key(cmd-alt-0)
	key(shift-tab:5)
	# neither bullets nor numbering
	key(cmd-. cmd-/ cmd-/)
	# outdent one more time as the above may indent
	key(shift-tab)
	key(cmd-alt-1)

action(user.onenote_checkbox): key(ctrl-e enter tab cmd-1 up ctrl-e)

today:
	user.onenote_heading_1()
	key(cmd-d)
	insert('- ')
	key(up ctrl-shift--)
	sleep(500ms)
	key(down)
	user.onenote_checkbox()

key(ctrl-cmd-t):
	mimic('today')

tomorrow:
	user.onenote_heading_1()
	user.insert_date(1, '%-m/%-d/%Y')
	insert(' - ')
	key(up ctrl-shift--)
	sleep(500ms)
	key(down)
	user.onenote_checkbox()

# back to progress (first notebook, first section)
go progress:
	key(ctrl-g alt-up enter)
	sleep(300ms)
	key(alt-up)
	user.onenote_hide_navigation()
