zoom in [<number>]: 
	numb  = number or 1	
	edit.zoom_in()
	repeat(numb - 1)	
zoom out [<number>]: 
	numb  = number or 1	
	edit.zoom_out()
	repeat(numb - 1)
copy take: edit.copy()
cut take: edit.cut()
paste now: edit.paste()
undo [<number>]: 
	numb  = number or 1
	edit.undo()
	repeat(numb - 1)
redo [<number>]: 
	numb  = number or 1
	edit.redo()
	repeat(numb - 1)
paste match: edit.paste_match_style()
file save: edit.save()
slap:
	edit.line_end()
	key(enter)
