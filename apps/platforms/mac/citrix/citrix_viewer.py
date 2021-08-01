from talon import Context, Module, ui

ctx = Context()
mod = Module()

mod.apps.citrix_viewer = """
os: mac
and app.bundle: com.citrix.receiver.icaviewer.mac
"""

ctx.matches = """
app: citrix_viewer
"""

@ctx.action_class('user')
class UserActions:
	def window_toggle_full_screen():
		citrix_viewer = ui.apps(bundle='com.citrix.receiver.icaviewer.mac')[0]
		menu_bar = citrix_viewer.element.children.find_one(AXRole='AXMenuBar', max_depth=0)
		view_menu = menu_bar.children.find_one(AXRole='AXMenuBarItem', AXTitle='View', max_depth=0).children[0]
		full_screen_item = view_menu.children.find_one(AXRole='AXMenuItem', AXTitle='Enter Full Screen', max_depth=0)
		full_screen_item.perform('AXPress')

@mod.action_class
class Actions:
	def window_toggle_full_screen():
		"""Toggle full screen state of the frontmost window."""