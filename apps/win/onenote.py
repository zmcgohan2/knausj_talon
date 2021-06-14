from talon import Module, Context, actions

mod = Module()
ctx = Context()

ctx.matches = r"""
os: windows
"""

@ctx.action_class("user")
class Actions:
	def onenote_now():
		# not standard OneNote; triggers an AutoHotKey macro I wrote
		actions.key("super-alt-i")
		actions.sleep("300ms")