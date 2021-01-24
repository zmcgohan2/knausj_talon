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
		if ui.active_app().bundle == 'com.microsoft.onenote.mac':
			return
		next(a for a in ui.apps() if a.bundle == 'com.microsoft.onenote.mac').focus()
		for attempt in range(10):
			if ui.active_app().bundle == 'com.microsoft.onenote.mac':
				return
			actions.sleep("50ms")

