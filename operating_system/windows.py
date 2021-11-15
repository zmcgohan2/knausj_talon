from talon import Context, actions


ctx = Context()
ctx.matches = r"""
os: windows
"""

ctx.lists["self.launch_command"] = {
    "sound": "control mmsys.cpl sounds",
    "blue tooth": "control bthprops.cpl",
}


@ctx.action_class("user")
class UserActionsWin:
    def exec(command: str):
        actions.key("super-r")
        actions.sleep("650ms")
        actions.insert(command)
        actions.key("enter")

    def system_shutdown():
        shutdown("s")

    def system_restart():
        shutdown("r")

    def system_hibernate():
        shutdown("h")

    def system_lock():
        actions.key("super-l")


def shutdown(flag: str):
    actions.key("super-r")
    actions.sleep("650ms")
    actions.insert(f"shutdown /{flag}")
