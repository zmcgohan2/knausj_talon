from talon import Context, actions, Module, ui

mod = Module()
ctx = Context()

ctx.matches = """
os: mac
and app.bundle: com.apple.mail
"""

@ctx.action_class("user")
class user_actions:
	def mail_select_last_message():
		mail = ui.apps(bundle='com.apple.mail')[0]
		focused = mail.focused_element
		if focused['AXIdentifier'] == 'MessagesTableView':
			messages_table = focused
		else:
			try:
				messages_table = ui.active_window().children.find_one(AXIdentifier='MessagesTableView')
			except ui.UIErr:
				return # no messages table view found
		last_row = [child for child in messages_table.children if child.AXRole == 'AXRow'][-1]
		last_row['AXSelected'] = True

@mod.action_class
class Action:
	def mail_select_last_message():
		"""Select the last message in the currently focused Apple Mail message viewer."""
