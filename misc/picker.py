from talon import Context, Module, actions
import os


mod = Module()


@mod.action_class
class Actions:
    def pick(number: int):
        """Picks item X from the drop down"""


ctx_win = Context()
ctx_win.matches = r"""
os: windows
"""


@ctx_win.action_class("user")
class UserActionsWin:
    def pick(number: int):
        actions.key(f"down:{number - 1} enter")


ctx_mac = Context()
ctx_mac.matches = r"""
os: mac
"""


@ctx_mac.action_class("user")
class UserActionsMac:
    def pick(number: int):
        actions.key(f"down:{number} enter")
