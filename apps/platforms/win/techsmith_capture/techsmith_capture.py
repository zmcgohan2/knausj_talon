from talon import Module, actions, Context

mod = Module()
mod.apps.tech_smith_capture = """
os: windows
and app.name: TechSmith Capture
os: windows
and app.exe: RelayRecorder.exe
"""

ctx_techsmith = Context()
ctx_techsmith.matches = r"""
os: windows
user.running: TechSmith Capture
user.running: RelayRecorder.exe
"""
@ctx_techsmith.action_class("user")
class UserActionsLinux:
    def screenshot_selection():
        actions.key("shift-f11")