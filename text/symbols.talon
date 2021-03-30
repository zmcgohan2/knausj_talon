# question [mark]: "?"
# (downscore | underscore): "_"
# double dash: "--"
# (bracket | brack | left bracket): "{"
# (rbrack | are bracket | right bracket): "}"
#ellipses: "…"
# ellipses: "..."
spamma: ", " 
# plus: "+"
# arrow: "->"
# dub arrow: "=>"
new row: "\\n"
# carriage return: "\\r"
# line feed: "\\r\\n"
empty dubstring:
    '""'
    key(left)
empty escaped dubstring:
    '\\"\\"'
    key(left)
    key(left)
empty string:
    "''"
    key(left)
empty escaped string:
    "\\'\\'"
    key(left)
    key(left)
[inside] args:
	insert("()")
	key(left)
inside squares: 
	insert("[]") 
	key(left)
inside bracket: 
	insert("{}") 
	key(left)
inside percy: 
	insert("%%") 
	key(left)
inside quotes:
	insert('""')
    key(left)
inside ticks:
	insert('``')
    key(left)
inside angle:
    insert('<>')
    key(left)
inside pad:
    insert('   ')
    key(left)
angle take: 
    text = edit.selected_text()
    user.paste("<{text}>")
pad take: 
    text = edit.selected_text()
    user.paste(" {text} ")    
bracket take: 
    text = edit.selected_text()
    user.paste("{{{text}}}")
args take: 
    text = edit.selected_text()
    user.paste("({text})")
percy take: 
    text = edit.selected_text()
    user.paste("%{text}%")
quote take:
    text = edit.selected_text()
    user.paste("'{text}'")
dubquote take:
    text = edit.selected_text()
    user.paste('"{text}"')
tick take:
    text = edit.selected_text()
    user.paste('`{text}`')
square take:
    text = edit.selected_text()
    user.paste('[{text}]')