from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: windows
"""

@ctx.action_class('user')
class UserActions:
	def onenote_now(text: str):
		# not standard OneNote; triggers an AutoHotKey macro I wrote
		actions.key("super-alt-i")
		actions.sleep("300ms")
		actions.insert(text)