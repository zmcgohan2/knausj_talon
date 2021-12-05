from talon import Module, Context, actions, ui
from talon.mac import applescript

ctx = Context()
mod = Module()

ctx.matches = r"""
os: mac
app.bundle: com.microsoft.Outlook
"""

def outlook_app():
	return ui.apps(bundle="com.microsoft.Outlook")[0]

@ctx.action_class("user")
class UserActions:
	def outlook_set_selected_folder(folder: str):
		applescript.run(f'tell app id "com.microsoft.Outlook" to set selected folder to {folder}')

	def outlook_archive():
		# Work around bug in which the keyboard shortcut is dead if focus is not in an outline
		# (old Outlook only)
		role = outlook_app().focused_element.AXRole
		if role != "AXOutline":
			actions.key("ctrl-shift-[")
		actions.key("ctrl-e")

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

	def outlook_archive():
		"""Archive the selected messages in Outlook"""

	def outlook_unflag():
		"""Remove flag from selected messages in Outlook"""