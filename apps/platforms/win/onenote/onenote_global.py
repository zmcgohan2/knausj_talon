from talon import Context, actions
from talon.grammar.vm import Phrase
from typing import List

ctx = Context()
ctx.matches = r"""
os: windows
"""

@ctx.action_class('user')
class UserActions:
	def onenote_now(word_list: List[Phrase]):
		# not standard OneNote; triggers an AutoHotKey macro I wrote
		actions.key("super-alt-i")
		actions.sleep("300ms")
		actions.mimic(word_list)