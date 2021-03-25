draw [<number_small>]:
    numb = number_small or 1
    edit.word_left()
    repeat(numb - 1)

spring [<number_small>]:
    numb = number_small or 1
    edit.word_right()
    repeat(numb - 1)

go left [<number_small>]:
    numb = number_small or 1
    edit.left()
    repeat(numb - 1)

go right [<number_small>]:
    numb = number_small or 1
    edit.right()
    repeat(numb - 1)

go up [<number_small>]:
    numb = number_small or 1
    edit.up()
    repeat(numb - 1)

go down [<number_small>]:
    numb = number_small or 1
    edit.down()
    repeat(numb - 1)

head:
    edit.line_start()

tail:
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

sell left [<number_small>]:
    numb = number_small or 1
    edit.extend_left()
    repeat(numb - 1)

sell right [<number_small>]:
    numb = number_small or 1
    edit.extend_right()
    repeat(numb - 1)

sell up [<number_small>]:
    numb = number_small or 1
    edit.extend_line_up()
    repeat(numb - 1)

sell down [<number_small>]:
    numb = number_small or 1
    edit.extend_line_down()
    repeat(numb - 1)

sell word [<number_small>]:
    numb = number_small or 1
    edit.select_word()
    repeat(numb - 1)    

sell draw [<number_small>]:
    numb = number_small or 1
    edit.extend_word_left()
    repeat(numb - 1)

sell spring [<number_small>]:
    numb = number_small or 1
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
tap that [<number_small>]:
    numb = number_small or 1
    edit.indent_more()
    repeat(numb - 1)    

retap that [<number_small>]:
    numb = number_small or 1
    edit.indent_less()
    repeat(numb - 1)

# deleting
wipe line:
    edit.delete_line()
    
# wipe left:
#     key(backspace)

# wipe right:
#     key(delete)

wipe up [<number_small>]:
    numb = number_small or 1
    edit.extend_line_up()
    repeat(numb - 1)    
    edit.delete()

wipe down [<number_small>]:
    numb = number_small or 1
    edit.extend_line_down()
    repeat(numb - 1) 
    edit.delete()

wipe word [<number_small>]:
    numb = number_small or 1
    edit.delete_word()
    repeat(numb - 1)

(wipe draw | sweep) [<number_small>]:
    numb = number_small or 1
    edit.extend_word_left()
    repeat(numb - 1)    
    edit.delete()

(wipe spring | gobble) [<number_small>]:
    edit.extend_word_right()
    numb = number_small or 1
    repeat(numb - 1)    
    edit.delete()

wipe far left:
    edit.extend_line_start()
    edit.delete()

wipe far right:
    edit.extend_line_end()
    edit.delete()

wipe far up:
    edit.extend_file_start()
    edit.delete()

wipe far down:
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

copy word [<number_small>]:
    numb = number_small or 1
    edit.select_word()
    repeat(numb - 1)    
    edit.copy()


copy draw [<number_small>]:
    numb = number_small or 1
    edit.extend_word_left()
    repeat(numb - 1)    
    edit.copy()


copy spring [<number_small>]:
    numb = number_small or 1
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

#snip commands
snip all:
    edit.select_all()
    edit.cut()

#to do: do we want these variants
# snip left:
#      edit.select_all()
#      edit.cut()
# snip right:
#      edit.select_all()
#      edit.cut()
# snip up:
#      edit.select_all()
#     edit.cut()
# snip down:
#     edit.select_all()
#     edit.cut()

snip word:
    edit.select_word()   
    edit.cut()

snip draw [<number_small>]:
    numb = number_small or 1
    edit.extend_word_left()
    repeat(numb - 1)    
    edit.cut()

snip spring [<number_small>]:
    numb = number_small or 1
    edit.extend_word_right()
    repeat(numb - 1)
    edit.cut()

snip line:
    edit.select_line()
    edit.cut()

chuck <number_small>:
    edit.delete()
    repeat(number_small - 1)
