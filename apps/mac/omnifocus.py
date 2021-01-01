from typing import Optional

from talon import Context, actions, Module
from talon.mac import applescript

mod = Module()
ctx = Context()

ctx.matches = """
os: mac
and app.bundle: com.omnigroup.OmniFocus3.MacAppStore
"""

@ctx.action_class("user")
class user_actions:
	def postpone(days: Optional[int]):
		actions.key("ctrl-cmd-l")
		if days:
			actions.insert(str(days))

	def select_tree(tree: str):
		applescript.run(f'tell application id "com.omnigroup.OmniFocus3.MacAppStore" to tell window 1\'s content to set selected trees to {{{tree}}}')
		actions.key("alt-cmd-2")

@mod.action_class
class Action:
	def postpone(days: Optional[int]):
		"""Postpone by a number of days"""

	def select_tree(tree: str):
		"""Select a tree in the outline (specified as AppleScript scoped to window content)."""