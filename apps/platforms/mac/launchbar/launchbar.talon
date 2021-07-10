os: mac
-

launch <phrase>:
	key(cmd-space)
	insert('{user.formatted_text(phrase, "ALL_LOWERCASE,NO_SPACES")}')

launch bar:
	key(cmd-space)

launch running:
	user.launchbar_action('Running Applications')

web search <phrase>:
	user.launchbar_action('Google')
	key(backspace)
	insert("{phrase}")
