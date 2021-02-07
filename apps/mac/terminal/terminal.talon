app: apple_terminal
-
#comment or remove tags for command sets you don't want
tag(): user.file_manager
tag(): user.generic_terminal
tag(): user.git
tag(): user.kubectl
tag(): user.tabs
tag(): terminal

action(user.file_manager_open_parent):
    insert("cd ..")
    key(enter)
action(app.tab_open):
  key(cmd-t)
action(app.tab_close):
  key(cmd-w)
action(app.tab_next):
  key(ctrl-tab)
action(app.tab_previous):
  key(ctrl-shift-tab)
action(user.tab_overview):
  key(cmd-shift-\)
action(app.window_open):
  key(cmd-n)
<<<<<<< variant A
kill all:
  key(ctrl-c)
rerun search:
  key(ctrl-r)
run last:
  key(up)
  key(enter)
action(edit.delete):
  key(ctrl-w)
action(edit.extend_word_left):
  key(ctrl-space)
  key(alt-b)
action(edit.extend_word_right):
  key(ctrl-space)
  key(alt-f)
action(edit.delete_line): 
  key(ctrl-u)
action(edit.delete_word):
  key(alt-d)
action(edit.word_left):
  key(alt-b)
action(edit.word_right):
  key(alt-f)
action(edit.line_start):
  key(ctrl-a)
action(edit.line_end):
  key(ctrl-e)
>>>>>>> variant B
======= end
action(edit.page_down):
  key(command-pagedown)
action(edit.page_up):
  key(command-pageup)
rerun search:
  key(ctrl-r)
suspend:
  key(ctrl-z)
resume:
  insert("fg")
  key(enter)
clear:
  key(cmd-k)
clear word (left | previous):
  key(alt-backspace)
clear word (right | next):
  key(alt-d)
