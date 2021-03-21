draw [<number>]:
    numb = number or 1
    edit.word_left()
    repeat(numb - 1)

spring [<number>]:
    numb = number or 1
    edit.word_right()
    repeat(numb - 1)

go left [<number>]:
    numb = number or 1
    edit.left()
    repeat(numb - 1)

go right [<number>]:
    numb = number or 1
    edit.right()
    repeat(numb - 1)

go up [<number>]:
    numb = number or 1
    edit.up()
    repeat(numb - 1)

go down [<number>]:
    numb = number or 1
    edit.down()
    repeat(numb - 1)

go line start:
    edit.line_start()

go line end:
    edit.line_end()

far left:
    edit.line_start()
    edit.line_start()

far right:
    edit.line_end()

far down:
    edit.file_end()

far up:
    edit.file_start()

# go page down:
#     edit.page_down()

# go page up:
#     edit.page_up()

# selecting
sell line:
    edit.select_line()

sell all:
    edit.select_all()

sell left [<number>]:
    numb = number or 1
    edit.extend_left()
    repeat(numb - 1)

sell right [<number>]:
    numb = number or 1
    edit.extend_right()
    repeat(numb - 1)

sell up [<number>]:
    numb = number or 1
    edit.extend_line_up()
    repeat(numb - 1)

sell down [<number>]:
    numb = number or 1
    edit.extend_line_down()
    repeat(numb - 1)

sell word [<number>]:
    numb = number or 1
    edit.select_word()
    repeat(numb - 1)    

sell draw [<number>]:
    numb = number or 1
    edit.extend_word_left()
    repeat(numb - 1)

sell spring [<number>]:
    numb = number or 1
    edit.extend_word_right()
    repeat(numb - 1)

sell far left:
    edit.extend_line_start()

sell far right:
    edit.extend_line_end()

sell far up:
    edit.extend_file_start()

sell far down:
    edit.extend_file_end()

# editing
tab [<number>]:
    numb = number or 1
    edit.indent_more()
    repeat(numb - 1)    

retab [<number>]:
    numb = number or 1
    edit.indent_less()
    repeat(numb - 1)

# deleting
bear line:
    edit.delete_line()
    
# bear left:
#     key(backspace)

# bear right:
#     key(delete)

bear up [<number>]:
    numb = number or 1
    edit.extend_line_up()
    repeat(numb - 1)    
    edit.delete()

bear down [<number>]:
    numb = number or 1
    edit.extend_line_down()
    repeat(numb - 1) 
    edit.delete()

bear word [<number>]:
    numb = number or 1
    edit.delete_word()
    repeat(numb - 1)

bear draw [<number>]:
    numb = number or 1
    edit.extend_word_left()
    repeat(numb - 1)    
    edit.delete()

bear spring [<number>]:
    edit.extend_word_right()
    numb = number or 1
    repeat(numb - 1)    
    edit.delete()


bear far left:
    edit.extend_line_start()
    edit.delete()

bear far right:
    edit.extend_line_end()
    edit.delete()

bear far up:
    edit.extend_file_start()
    edit.delete()

bear far down:
    edit.extend_file_end()
    edit.delete()

#copy commands
copy all:
    edit.select_all()
    edit.copy()
#to do: do we want these variants, seem to conflict
# copy left:
#      edit.extend_left()
#      edit.copy()
# copy right:
#     edit.extend_right()
#     edit.copy()
# copy up:
#     edit.extend_up()
#     edit.copy()
# copy down:
#     edit.extend_down()
#     edit.copy()

copy word [<number>]:
    numb = number or 1
    edit.select_word()
    repeat(numb - 1)    
    edit.copy()


copy draw [<number>]:
    numb = number or 1
    edit.extend_word_left()
    repeat(numb - 1)    
    edit.copy()


copy spring [<number>]:
    numb = number or 1
    edit.extend_word_right()
    repeat(numb - 1)    
    edit.copy()


copy line:
    edit.select_line()
    edit.copy()

copy far left:
    edit.extend_line_start()
    edit.delete()

copy far right:
    edit.extend_line_end()
    edit.copy()

copy far up:
    edit.extend_file_start()
    edit.copy()

copy far down:
    edit.extend_file_end()
    edit.copy()

#cut commands
cut all:
    edit.select_all()
    edit.cut()

#to do: do we want these variants
# cut left:
#      edit.select_all()
#      edit.cut()
# cut right:
#      edit.select_all()
#      edit.cut()
# cut up:
#      edit.select_all()
#     edit.cut()
# cut down:
#     edit.select_all()
#     edit.cut()

cut word:
    edit.select_word()   
    edit.cut()

cut draw [<number>]:
    numb = number or 1
    edit.extend_word_left()
    repeat(numb - 1)    
    edit.cut()

cut spring [<number>]:
    numb = number or 1
    edit.extend_word_right()
    repeat(numb - 1)
    edit.cut()

cut line:
    edit.select_line()
    edit.cut()

chuck <number>:
    edit.delete()
    repeat(number - 1)
