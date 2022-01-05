app.bundle: com.microsoft.onenote.mac
-
tag(): user.find_and_replace
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

ribbon: key(cmd-alt-r)

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

# navigating in recent notes (pages)
page forward [<user.ordinals>]$:
    offset = ordinals or 1
    offset = -1 * offset
    user.onenote_go_recent(offset)

page back[ward] [<user.ordinals>]$:
    user.onenote_go_recent(ordinals or 1)

key(cmd-ctrl-down): user.onenote_go_recent(1)
key(cmd-ctrl-up): user.onenote_go_recent(-1)

# navigating by cursor position
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

# missing shortcut for hiding navigation
(navigation hide | escape): user.onenote_hide_navigation()
key(esc): user.onenote_hide_navigation()

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
    user.onenote_go_progress()
    user.onenote_hide_navigation()
