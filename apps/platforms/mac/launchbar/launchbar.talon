os: mac
-

launch <phrase>:
	key(cmd-space)
	insert('{user.formatted_text(phrase, "ALL_LOWERCASE,NO_SPACES")}')

launch brief {user.abbreviation}: 
	key(cmd-space)
	insert('{user.formatted_text(abbreviation, "ALL_LOWERCASE,NO_SPACES")}')

launch bar:
	key(cmd-space)

launch running:
	user.launchbar_action('Running Applications')

launch paste:
	key(ctrl-cmd-alt-v)

web search <phrase>:
	user.launchbar_action('Google')
	key(backspace)
	insert("{phrase}")
