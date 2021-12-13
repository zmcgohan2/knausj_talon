app: citrix_hyperspace
app: citrix_viewer
-
chart search [<user.text>]:
	key(ctrl-space ctrl-a)
	insert(text or "")

master navigation:
	key(ctrl-space ctrl-home)

# XXX handle repeating - alt:down/press/alt:up doesn't work
section up: key(alt-up)
section down: key(alt-down)
tab up: key(ctrl-up)
tab down: key(ctrl-down)

mine: ".njr"