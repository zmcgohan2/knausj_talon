tag: user.line_commands
-
#this defines some common line commands. More may be defined that are ide-specific.
# lend: edit.line_end()
# bend: edit.line_start()
line <number>: edit.jump_line(number)
line <number> end: 
    edit.jump_line(number)
    edit.line_end()
note [line] <number>:
    user.select_range(number, number)
    code.toggle_comment()
note <number> by <number>: 
    user.select_range(number_1, number_2)
    code.toggle_comment()
wipe [line] <number>:
    edit.jump_line(number)
    user.select_range(number, number)
    edit.delete()
wipe <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.delete()
copy [line] <number>: 
    user.select_range(number, number)
    edit.copy()
copy <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.copy()
snip [line] <number>: 
    user.select_range(number, number)
    edit.cut()
snip [line] <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.cut()
paste <number> by <number>:
  user.select_range(number_1, number_2)
  edit.paste()
replace <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.paste()
take [line] <number>: user.select_range(number, number)
take <number> by <number>: user.select_range(number_1, number_2)
# tap that: edit.indent_more()
tap [line] <number>:
    edit.jump_line(number)
    edit.indent_more() 
tap <number> by <number>:
    user.select_range(number_1, number_2)
    edit.indent_more()
# retap that: edit.indent_less()
retap [line] <number>:
    user.select_range(number, number)
    edit.indent_less()
retap <number> by <number>:
    user.select_range(number_1, number_2)
    edit.indent_less()
drag [line] down: edit.line_swap_down()
drag [line] up: edit.line_swap_up()
drag up [line] <number>:
    user.select_range(number, number)
    edit.line_swap_up()
drag up <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.line_swap_up()
drag down [line] <number>: 
    user.select_range(number, number)
    edit.line_swap_down()
drag down <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.line_swap_down()
clone line: edit.line_clone()
