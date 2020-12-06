from talon import Module, Context

ctx = Context()
mod = Module()

ctx.matches = r"""
os: mac
"""

@ctx.action_class("user")
class launchbar_actions:
	def launchbar_action(action: str):
		from talon.mac import applescript
		action = action.replace('"', '\"')
		print(f'action: {action}')
		applescript.run(f'tell app id "at.obdev.LaunchBar" to perform action "{action}"')

@mod.action_class
class LaunchBarActions:
	def launchbar_action(action: str): """Performs the LaunchBar action."""
