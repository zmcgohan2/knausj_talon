from talon import Module, Context
from talon.mac import applescript

ctx = Context()
mod = Module()

ctx.matches = r"""
os: mac
app.bundle: com.microsoft.Outlook
"""

@ctx.action_class("user")
class UserActions:
	def outlook_set_selected_folder(folder: str):
		applescript.run(f'tell app id "com.microsoft.Outlook" to set selected folder to {folder}')

@mod.action_class
class Actions:
	def outlook_set_selected_folder(folder: str): """Opens the specified folder in Outlook."""
