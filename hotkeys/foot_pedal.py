from talon import ui, Module, Context, registry, actions, imgui, cron, track
import sys

mod = Module()


@mod.action_class
class Actions:
    def foot_pedal_left_left():
        """document string goes here"""
        actions.mouse_click()

    def foot_pedal_left_middle():
        """document string goes here"""
        actions.mouse_click(1)

    def foot_pedal_left_right():
        """document string goes here"""
        actions.mouse_click()
        actions.mouse_click()

    def foot_pedal_right_left():
        """document string goes here"""
        actions.mouse_click()
        actions.mouse_click()
        actions.mouse_click()

    def foot_pedal_right_middle():
        """document string goes here"""
        actions.user.mouse_drag(0)

    def foot_pedal_right_right():
        """document string goes here"""
        if not actions.speech.enabled():
            actions.speech.enable()
            actions.user.microphone_preferred()
            actions.user.clickless_mouse_enable()
        else:
            actions.user.sleep_all()
            actions.speech.set_microphone("None")
            actions.user.clickless_mouse_disable()
