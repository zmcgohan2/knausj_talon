from talon import ui, Module, Context, registry, actions, imgui, cron

mod = Module()
ctx_mac = Context()
ctx_windows = Context()


@mod.action_class
class Actions:
    def foot_pedal_left_left():
        """document string goes here"""

    def foot_pedal_left_middle():
        """document string goes here"""

    def foot_pedal_left_right():
        """document string goes here"""

    def foot_pedal_right_left():
        """document string goes here"""

    def foot_pedal_write_middle():
        """document string goes here"""

    def foot_pedal_right_right():
        """document string goes here"""
