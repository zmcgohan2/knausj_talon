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
void [line] <number>:
    edit.jump_line(number)
    user.select_range(number, number)
    edit.delete()
void <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.delete()
copy [line] <number>: 
    user.select_range(number, number)
    edit.copy()
copy <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.copy()
cut [line] <number>: 
    user.select_range(number, number)
    edit.cut()
cut [line] <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.cut()
paste <number> by <number>:
  user.select_range(number_1, number_2)
  edit.paste()
replace <number> by <number>: 
    user.select_range(number_1, number_2)
    edit.paste()
sell [line] <number>: user.select_range(number, number)
sell <number> by <number>: user.select_range(number_1, number_2)
# tab that: edit.indent_more()
dent [line] <number>:
    edit.jump_line(number)
    edit.indent_more() 
dent <number> by <number>:
    user.select_range(number_1, number_2)
    edit.indent_more()
# retab that: edit.indent_less()
retab [line] <number>:
    user.select_range(number, number)
    edit.indent_less()
retab <number> by <number>:
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
