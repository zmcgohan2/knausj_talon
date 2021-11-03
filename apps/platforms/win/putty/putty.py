from talon import Module     

mod = Module()

mod.apps.putty_lookitt = """
os: windows
and app.name: putty.exe
and title: /^MetroHealth /
"""

@mod.capture(rule="<user.letter> (<user.letter> | <user.number_key>) (<user.letter> | <user.number_key>)")
def ini(m) -> str:
	return ''.join(m)