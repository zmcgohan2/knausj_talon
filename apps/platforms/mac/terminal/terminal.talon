app: apple_terminal
-
#comment or remove tags for command sets you don't want
tag(): user.file_manager
tag(): user.generic_terminal
tag(): user.git
tag(): user.kubectl
tag(): user.tabs
tag(): terminal
rerun search:
    key(ctrl-r)
suspend:
    key(ctrl-z)
resume:
    insert("fg")
    key(enter)
clear:
    key(cmd-k)
clear (word (left | previous) | west):
    key(alt-backspace)
clear (word (right | next) | east):
    key(alt-d)
