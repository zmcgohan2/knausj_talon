from talon import Module, Context, actions, clip

ctx = Context()
mod = Module()

ctx.matches = r"""
os: mac
"""

@ctx.action_class("edit")
class Actions:
	def find(text: str = None):
		if text is not None:
			clip.set_text(text, mode='find')
		actions.key('cmd-f')
