from talon import Context, actions
from talon.mac import applescript

ctx = Context()
ctx.matches = r"""
os: mac
"""

ctx.lists["self.launch_command"] = {
    "sound": "sound",
    "blue tooth": "bluetooth",
}


@ctx.action_class("user")
class UserActionsMac:
    def exec(command: str):
        actions.key("cmd-space")
        actions.sleep("150ms")
        actions.insert(command)
        actions.key("enter")

    def system_shutdown():
        applescript.run(
            r"""
        tell application "Finder"
            shut down
        end tell"""
        )

    def system_restart():
        applescript.run(
            r"""
        tell application "Finder"
            restart
        end tell"""
        )

    def system_hibernate():
        applescript.run(
            r"""
        tell application "Finder"
            sleep
        end tell"""
        )

    def system_lock():
        actions.key("ctrl-cmd-q")

    def system_show_desktop():
        actions.key("shift-f13")

    def system_task_manager():
        actions.user.exec("Activity Monitor")

    def system_task_view():
        actions.key("shift-f11")

    def system_switcher():
        actions.key("shift-f11")


def shutdown(flag: str):
    actions.key("super-r")
    actions.sleep("650ms")
    actions.insert(f"shutdown /{flag}")
