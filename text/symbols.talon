question: "?"
check mark: "✓"
dash: "-"
splash: " - "
double dash: "--"
triple quote: "'''"
(triple grave | triple back tick | gravy):
    insert("```")
(dot dot | dotdot): ".."
ellipsis: "…"
em dash: "—"
(en | end) dash: "–"
comgap: ", "
colgap: ": "
point: "."
possessive: "’s"
plus: "+"
arrow: "->"
dub arrow: "=>"
new line: "\\n"
carriage return: "\\r"
line feed: "\\r\\n"
empty dubstring:
    '""'
    key(left)
empty escaped (dubstring|dub quotes):
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
inside angle brackets:
    insert("<>")
    key(left)
(inside parens | args):
	insert("()")
	key(left)
<<<<<<< variant A
inside (list | brackets):
	insert("[]") 
>>>>>>> variant B
inside (squares | list):
	insert("[]")
======= end
	key(left)
<<<<<<< variant A
inside braces:
	insert("{}") 
>>>>>>> variant B
inside (bracket | braces):
	insert("{}")
======= end
	key(left)
inside percent:
	insert("%%")
	key(left)
inside quotes:
	insert('""')
	key(left)
inside (graves | back ticks):
	insert("``")
	key(left)
angle that:
    text = edit.selected_text()
    user.paste("<{text}>")
<<<<<<< variant A
brace that: 
>>>>>>> variant B
(bracket | brace) that:
======= end
    text = edit.selected_text()
    user.paste("{{{text}}}")
<<<<<<< variant A
bracket that: 
    text = edit.selected_text()
    user.paste("[{text}]")
(parens | args) that: 
>>>>>>> variant B
(parens | args) that:
======= end
    text = edit.selected_text()
    user.paste("({text})")
percent that:
    text = edit.selected_text()
    user.paste("%{text}%")
quote that:
    text = edit.selected_text()
    user.paste('"{text}"')
(grave | back tick) that:
    text = edit.selected_text()
    user.paste('`{text}`')
