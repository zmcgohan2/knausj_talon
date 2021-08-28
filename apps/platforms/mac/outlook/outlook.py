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

	def outlook_unflag():
		applescript.run('''
			tell application id "com.microsoft.Outlook"
				get selected objects
				repeat with _object in result
					if _object's class is (incoming message) and _object's todo flag is not (not flagged) then
						set todo flag of _object to not flagged
					end if
				end repeat
			end tell''')

@mod.action_class
class Actions:
	def outlook_set_selected_folder(folder: str):
		"""Open the specified folder in Outlook"""

	def outlook_unflag():
		"""Remove flag from selected messages in Outlook"""