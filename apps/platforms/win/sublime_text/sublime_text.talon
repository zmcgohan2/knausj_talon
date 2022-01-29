os: windows
and app.exe: sublime_text.exe
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
# tag(): user.snippets
tag(): user.tabs

# NOTE: for Talon's context-sensitive dictation to work properly in Sublime Text,
# you need to set "copy_with_empty_selection": false in your settings.

file:
    key(ctrl-p)
    
file name <user.text>:
    key(ctrl-p)
    insert(user.text)
    
please [<user.text>]:
    key(ctrl-shift-p)
    insert(user.text or "")
    
project switch [<user.text>]:
    key(alt p s)
    insert(user.text or "")
    
project symbol [<user.text>]:
    key(ctrl-shift-r)
    insert(user.text or "")
    
slap: key(ctrl-enter)

definition show: key(f12)

# navigate through multifile search results
result next: key(f4 f3)
result previous: key(shift-f4 f3)

repository:
    key(ctrl-shift-p)
    insert("Sublime Merge: Open Repository")
    key(enter)

# Search through Talon or Python files when editing Talon configuration
hunt pie [<user.text>]$:
    text = text or ""
    user.sublime_text_find_in_project_files(text, "*.py,*.pyi")

hunt talon [<user.text>]$:
    text = text or ""
    user.sublime_text_find_in_project_files(text, "*.talon")
