from talon import Module, Context, actions, app, ui
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
		# for "old Outlook" this uses the scripting dictionary
		# for "new Outlook" this currently uses the displayed folder name
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
		role = outlook.focused_element.AXRole


		if role == "":
			app.notify("Unable to determine focused element", "Try restarting Outlook")
			raise Exception('Unable to determined focused element (Outlook bug?)')

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
				if role == "AXButton": # message toolbar / "hide task pane" button
					actions.key("ctrl-shift-[")
					saw_button = True
					continue
			actions.sleep("50ms")

		raise Exception(f'Unable to focus Outlook message list, instead focused {focused_element}')

	def outlook_focus_folder_list():
		outlook = outlook_app()
		toolbar_split = outlook.active_window.children.find_one(AXRole='AXSplitGroup', max_depth=0)
		sidebar_split = toolbar_split.children.find_one(AXRole='AXSplitGroup', max_depth=0)
		scroll_area_or_button = sidebar_split.children[0]
		if scroll_area_or_button.AXRole == 'AXButton':
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

	def outlook_download_images():
		outlook = outlook_app()
		toolbar_split = outlook.active_window.children.find_one(AXRole='AXSplitGroup', max_depth=0)
		sidebar_split = toolbar_split.children.find_one(AXRole='AXSplitGroup', max_depth=0)
		list_split = sidebar_split.children.find_one(AXRole='AXSplitGroup', max_depth=0)
		infobar = list_split.children.find_one(AXRole='AXScrollArea', AXTitle='Infobar View', max_depth=0)
		download_button = infobar.children.find_one(AXRole='AXButton', max_depth=0)
		download_button.perform('AXPress')

	def outlook_focus_message_body():
		outlook = outlook_app()
		role = outlook.focused_element.AXRole
		message_roles = ("AXGroup", "AXTextArea", "AXWebArea")

		print("Before:", outlook.focused_element, outlook.focused_element.attrs)

		if role in message_roles:
			return

		if role in ("AXOutline", "AXWindow"): # folder list in new Outlook
			actions.key("ctrl-shift-[") # wrap around
		else:
			actions.key("ctrl-shift-]")

		saw_button = False
		for attempt in range(10):
			focused_element = outlook.focused_element
			role = focused_element.AXRole
			if role in message_roles:
				return
			if not saw_button:
				if role == "AXButton": # message toolbar / "hide task pane" button
					actions.key("ctrl-shift-]") # not a pane - work around bug
					saw_button = True
					continue
			actions.sleep("50ms")

		print("After:", focused_element, focused_element.attrs)

		raise Exception("Unable to focus Outlook message body")

@mod.action_class
class Actions:
	def outlook_set_selected_folder(folder: str):
		"""Open the specified folder in Outlook"""

	def outlook_archive():
		"""Archive the selected messages in Outlook"""

	def outlook_unflag():
		"""Remove flag from selected messages in Outlook"""

	def outlook_focus_message_body():
		"""Focus the message body in Outlook"""

	def outlook_focus_message_list():		
		"""Focus the message list in Outlook"""

	def outlook_focus_folder_list():
		"""Focus the folder list in Outlook"""

	def outlook_download_images():
		"""Download images in Outlook"""