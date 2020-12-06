os: mac
-

launch <phrase>:
	key(cmd-space)
	insert(user.formatted_text(phrase, "ALL_LOWERCASE,NO_SPACES"))

launch bar:
	key(cmd-space)

launch bar running:
	key(cmd-space)
	sleep(50ms)
	key(cmd-r)

web search <phrase>:
	user.launchbar_action('Google')
	key(backspace)
	insert("{phrase}")
