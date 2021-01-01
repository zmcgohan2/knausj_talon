import time
from talon import Context, actions, clip

ctx = Context()

ctx.matches = r"""
app.bundle: com.microsoft.onenote.mac
"""

@ctx.action_class("edit")
class edit_actions:
	def copy():
		serial_start = clip.serial()
		for attempt in range(10):
			actions.key("cmd-c")
			actions.sleep("100ms")
			if clip.serial() != serial_start:
				return
