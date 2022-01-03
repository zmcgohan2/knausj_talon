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
		# (old Outlook) or table (new Outlook)
		role = outlook_app().focused_element.AXRole
		if role not in ("AXOutline", "AXTable"):
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

	def outlook_focus_message_list():
		outlook = outlook_app()
		focused_element = outlook.focused_element
		role = focused_element.AXRole

		if role == "AXOutline":
			# Folder list in new Outlook
			actions.key("ctrl-shift-]")
		elif role != "AXTable":
			actions.key("ctrl-shift-[")

		saw_button = False		
		for attempt in range(10):
			focused_element = outlook.focused_element
			role = focused_element.AXRole
			if role == "AXTable" and focused_element.get("AXDescription") == "Message List":
				return
			if not saw_button:
				if role == "AXButton" and focused_element.get("AXHelp") == "Hide Task Pane":
					actions.key("ctrl-shift-[") # not a pane - work around bug
					saw_button = True
					continue
			actions.sleep("50ms")

		raise Exception("Unable to focus Outlook message list")

@mod.action_class
class Actions:
	def outlook_set_selected_folder(folder: str):
		"""Open the specified folder in Outlook"""

	def outlook_archive():
		"""Archive the selected messages in Outlook"""

	def outlook_unflag():
		"""Remove flag from selected messages in Outlook"""

	def outlook_focus_message_list():		
		"""Focus the message list in Outlook"""
