from talon import actions, app, Context, Module, ui

mod = Module()
ctx = Context()

ctx.matches = """
os: mac
and app.bundle: com.microsoft.Powerpoint
"""

def powerpoint_app():
	return ui.apps(bundle="com.microsoft.Powerpoint")[0]

def powerpoint_document_window():
	return powerpoint_app().children.find_one(
		AXRole='AXWindow', AXSubrole='AXStandardWindow', max_depth=0)

@ctx.action_class("user")
class UserActions:
	def office_tell_me():
		(powerpoint_document_window().children.find_one(AXRole='AXTabGroup', max_depth=0)
									 .children.find_one(AXRole='AXButton', max_depth=0)
		).perform('AXPress')

@mod.action_class
class Actions:
	def office_tell_me():
		"""Focus 'Tell me' in Microsoft Office apps"""
