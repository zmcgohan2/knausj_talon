mode: user.talon
mode: user.auto_lang
and code.language: talon
-
tag(): user.code_operators
tag(): user.code_comment

dot talon: insert(".talon")
#defintion blocks for the context
action block:
    insert("action():")
    edit.left()
    edit.left()
setting block:
    insert("settings():\n\t")
setting {user.talon_settings}: 
    user.paste("{talon_settings} = ")
#context requirements
win require:
    insert("os: windows\n")
mac require:
    insert("os: mac\n")
linux require:
    insert("os: linux\n")
title require:
    insert("win.title: ")
app require [{user.talon_apps}]: 
    app = talon_apps or ""
    user.paste("app: {app}")
mode require [{user.talon_modes}]: 
    tag = talon_modes or ""
    user.paste("mode: {talon_modes}")
tag require [{user.talon_tags}]: 
    tag = talon_tags or ""
    user.paste("tag: {tag}")
tag set [{user.talon_tags}]: 
    tag = talon_tags or ""
    user.paste("tag(): {tag}")
list {user.talon_lists}: "{{{talon_lists}}}"
capture {user.talon_captures}: "<{talon_captures}>"

#commands for dictating key combos
key <user.keys> over: "{keys}"
key <user.modifiers> over: "{modifiers}"
funk [user] {user.talon_actions}: user.code_insert_function(talon_actions, edit.selected_text())

#funk commands, consistent with other languages
toggle funk: user.code_toggle_functions()
funk <user.code_functions>:
    user.code_insert_function(code_functions, "")
funk cell <number>:
    user.code_select_function(number - 1, "")
funk wrap <user.code_functions>:
    user.code_insert_function(code_functions, edit.selected_text())
funk wrap <number>:
    user.code_select_function(number - 1, edit.selected_text())
