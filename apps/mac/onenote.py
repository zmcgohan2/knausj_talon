import time
from talon import Module, Context, actions, clip, ui

mod = Module()
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

@mod.action_class
class Actions:
	def onenote_focus():
		"""Bring OneNote to the front."""
		actions.user.launch_or_focus_bundle('com.microsoft.onenote.mac')

	def onenote_now():
		"""Insert timestamped bullet list item into OneNote."""

@ctx.action_class("user")
class user_actions:
	def find(text: str):
		actions.key("ctrl-g cmd-f")
		actions.sleep("100ms")
		actions.insert(text)

	def find_everywhere(text: str):
		actions.key("ctrl-g cmd-alt-f")
		actions.sleep("200ms")
		actions.insert(text)
