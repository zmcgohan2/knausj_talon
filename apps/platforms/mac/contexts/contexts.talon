os: mac
user.running: Contexts
-
^con [<user.text>]:
	key(fn-space)
	insert('{user.formatted_text(text or "", "ALL_LOWERCASE,NO_SPACES")}')