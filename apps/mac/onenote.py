import time
from talon import Module, Context, actions, app, clip, ui

mod = Module()
ctx = Context()

ctx.matches = r"""
app.bundle: com.microsoft.onenote.mac
"""

@ctx.action_class("edit")
class edit_actions:
	def copy():
		serial_start = clip.serial()
		for attempt in range(10):
			actions.key("cmd-c")
			actions.sleep("100ms")
			if clip.serial() != serial_start:
				return

@mod.action_class
class Actions:
	def onenote_focus():
		"""Bring OneNote to the front."""
		actions.user.launch_or_focus_bundle('com.microsoft.onenote.mac')

	def onenote_now():
		"""Insert timestamped bullet list item into OneNote."""

	def onenote_checkbox():
		"""Insert indented checkbox into OneNote."""

	def onenote_heading_1():
		"""Insert a first-level heading into OneNote."""

	def onenote_hide_navigation():
		"""Hide the navigation panes."""

	def onenote_copy_link():
		"""Copy a link to the current paragraph in OneNote."""

@ctx.action_class("user")
class user_actions:
	def find(text: str):
		actions.key("ctrl-g cmd-f")
		actions.sleep("100ms")
		actions.insert(text)

	def find_everywhere(text: str):
		actions.key("ctrl-g cmd-alt-f")
		actions.sleep("200ms")
		actions.insert(text)
	
	def onenote_hide_navigation():
		onenote = ui.apps(bundle="com.microsoft.onenote.mac")[0]
		window = next(window for window in onenote.windows() if window.doc)
		# un-check the "books" at the top left if necessary
		splitgroup = next(child for child in window.children if child.AXRole == 'AXSplitGroup')
		group = next(child for child in splitgroup.children if child.AXRole == 'AXGroup')
		checkbox = next(child for child in group.children if child.AXRole == 'AXCheckBox')
		if checkbox.AXValue == 1:
			checkbox.perform('AXPress')
		# focus the note body if necessary
		for attempt in range(5):
			focused = onenote.focused_element
			if focused.AXRole == 'AXWindow' and focused.get('AXDocument'):
				actions.key("tab")
				actions.sleep("100ms")
			else:
				return
	
	def onenote_copy_link():
		# despite the name of this menu item, the link takes you directly to the selected paragraph
		onenote = ui.apps(bundle="com.microsoft.onenote.mac")[0]
		(onenote.children.find_one(AXRole='AXMenuBar')
				.children.find_one(AXRole='AXMenuBarItem', AXTitle='Notebooks')
				.children[0].children.find_one(AXRole='AXMenuItem', AXTitle='Pages')
				.children[0].children.find_one(AXRole='AXMenuItem', AXTitle='Copy Link to Page')
		).perform('AXPress')
		app.notify(body='Copied link to paragraph', title='OneNote')