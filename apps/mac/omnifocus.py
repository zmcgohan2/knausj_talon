from typing import Optional

from talon import Context, actions, Module

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

@mod.action_class
class Action:
	def postpone(days: Optional[int]):
		"""Postpone by a number of days"""
