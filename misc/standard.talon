#(jay son | jason ): "json"
#(http | htp): "http"
#tls: "tls"
#M D five: "md5"
#word (regex | rejex): "regex"
#word queue: "queue"
#word eye: "eye"
#word iter: "iter"
#word no: "NULL"
#word cmd: "cmd"
#word dup: "dup"
#word shell: "shell"
zoom in [<number>]: 
	numb  = number or 1	
	edit.zoom_in()
	repeat(numb - 1)	
zoom out [<number>]: 
	numb  = number or 1	
	edit.zoom_out()
	repeat(numb - 1)
# (page | scroll) up: key(pgup)
# (page | scroll) down: key(pgdown)
copy sell: edit.copy()
cut sell: edit.cut()
paste now: edit.paste()
undo that [<number>]: 
	numb  = number or 1
	edit.undo()
	repeat(numb - 1)
redo that [<number>]: 
	numb  = number or 1
	edit.redo()
	repeat(numb - 1)

paste match: edit.paste_match_style()
file save: edit.save()
# wipe: key(backspace)    
# (pad | padding): 
# 	insert("  ") 
# 	key(left)
slap:
	edit.line_end()
	key(enter)