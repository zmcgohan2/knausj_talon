os: mac
-

# Intent is to simulate interactive use of LaunchBar, so if you have different
# keyboard shortcuts configured you will need to replace them here.  Mine are:

# Search in LaunchBar: Command-Space
# Instant Send: Double Control (which I have mapped to caps lock)
# Show clipboard history: Control-Option-Command-V

launch <user.text>:
	key(cmd-space)
	insert('{user.formatted_text(text, "ALL_LOWERCASE,NO_SPACES")}')

launch brief {user.abbreviation}: 
	key(cmd-space)
	insert('{user.formatted_text(abbreviation, "ALL_LOWERCASE,NO_SPACES")}')

launch bar:
	key(cmd-space)

launch running:
	user.launchbar_action('Running Applications')

launch paste:
	key(ctrl-cmd-alt-v)

launch send:
	key(ctrl:down)
	sleep(10ms)
	key(ctrl:up ctrl:down)
	sleep(10ms)
	key(ctrl:up)

web search <phrase>:
	user.launchbar_action('Google')
	key(backspace)
	insert("{phrase}")
