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
		result = applescript.run(f'''
			tell application id "com.microsoft.Outlook"
				if (exists (selected folder)) then
					set selected folder to {folder}
					return true
				end if
				return false
			end tell''')
		if result == 'false':
			# new Outlook (at least until it gets OSA support)
			actions.user.outlook_focus_folder_list()
			actions.insert(folder)
			actions.user.outlook_focus_message_list()

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

		if role == "AXOutline": # folder list in new Outlook
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

	def outlook_focus_folder_list():
		outlook = outlook_app()
		menu_bar = outlook.children.find_one(AXRole='AXMenuBar', max_depth=0)
		view_menu = menu_bar.children.find_one(AXRole='AXMenuBarItem', AXTitle='View', max_depth=0).children[0]
		sidebar_item = view_menu.children.find_one(AXRole='AXMenuItem', AXTitle='Sidebar', max_depth=0)
		if not sidebar_item.AXSelected:
			actions.key("cmd-alt-s")

		last_focused_element = None
		for attempt in range(10):
			focused_element = outlook.focused_element
			role = focused_element.AXRole
			if focused_element != last_focused_element:
				if role == "AXOutline":
					return
				actions.key("ctrl-shift-[")
			actions.sleep("50ms")

		raise Exception("Unable to focus Outlook folder list")

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

	def outlook_focus_folder_list():
		"""Focus the folder list in Outlook"""