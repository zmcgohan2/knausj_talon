os: mac
app.bundle: com.sublimetext.4
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
# tag(): user.snippets
tag(): user.tabs

# NOTE: for Talon's context-sensitive dictation to work properly in Sublime Text,
# you need to set "copy_with_empty_selection": false in your settings.

file:
    key(cmd-p)
    
file name <user.text>:
    key(cmd-p)
    insert(user.text)
    
do [<user.text>]:
    key(cmd-shift-p)
    insert(user.text or "")
    
project switch [<user.text>]:
    key(cmd-ctrl-p)
    insert(user.text or "")
    
project symbol [<user.text>]:
    key(cmd-shift-r)
    insert(user.text or "")
    
slap: key(cmd-enter)

# navigate through multifile search results
result next: key(f4 cmd-g)
result previous: key(shift-f4 cmd-g)

# history navigation
go back: key(ctrl--)
go forward: key(ctrl-shift--)

[do] repository:
    key(cmd-shift-p)
    insert("Sublime Merge: Open Repository")
    key(enter)
