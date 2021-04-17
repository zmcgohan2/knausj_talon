from os.path import join
from subprocess import call
from talon import Context, actions, Module

mod = Module()
ctx = Context()

ctx.matches = r"""
os: mac
and app.bundle: com.apple.dt.Xcode
"""

@ctx.action_class("edit")
class edit_actions:
	def jump_line(n: int):
		actions.key("cmd-l")
		actions.insert(str(n))
		actions.key("enter")

@ctx.action_class("user")
class user_actions:
	def find(text: str):
		actions.key("cmd-f")
		actions.insert(text)

	def find_everywhere(text: str):
		actions.key("cmd-shift-f")
		actions.insert(text)

	def replace(text: str): 
		actions.key("cmd-alt-f")
		actions.insert(text)

	replace_everywhere = find_everywhere

@ctx.action_class("win")
class win_actions:
	def filename():
		return actions.win.title()
