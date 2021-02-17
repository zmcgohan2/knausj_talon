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
new line: "\\n"
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
[inside] +args:
	insert("()")
	key(left)
inside squares: 
	insert("[]") 
	key(left)
inside bracket: 
	insert("{}") 
	key(left)
inside percent: 
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
angle sell: 
    text = edit.selected_text()
    user.paste("<{text}>")
bracket sell: 
    text = edit.selected_text()
    user.paste("{{{text}}}")
args sell: 
    text = edit.selected_text()
    user.paste("({text})")
percent sell: 
    text = edit.selected_text()
    user.paste("%{text}%")
quote sell:
    text = edit.selected_text()
    user.paste('"{text}"')
tick sell:
    text = edit.selected_text()
    user.paste('`{text}`')
square sell:
    text = edit.selected_text()
    user.paste('[{text}]')