from talon import ui, Module, Context, registry, actions, imgui, cron, track
import sys

mod = Module()
ctx_zoom_mouse_enabled_use_pedal = Context()
ctx_zoom_mouse_enabled_use_pedal.matches = r"""
mode: talon_plugins.eye_zoom_mouse.zoom_mouse_enabled
and not mode: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
and tag: talon_plugins.eye_zoom_mouse.zoom_mouse_pedal
and not user.running: Optikey Mouse
"""


ctx_zoom_mouse_triggered_use_pedal = Context()
ctx_zoom_mouse_triggered_use_pedal.matches = r"""
mode: talon_plugins.eye_zoom_mouse.zoom_mouse_enabled
and mode: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
and tag: talon_plugins.eye_zoom_mouse.zoom_mouse_pedal
and not user.running: Optikey Mouse
"""


@ctx_zoom_mouse_enabled_use_pedal.action_class("user")
class WindowsZoomMouseInactiveActions:
    def foot_pedal_left_left():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_trigger()

    def foot_pedal_left_middle():
        """document string goes here"""
        actions.user.toggle_gaze_scroll()

    def foot_pedal_left_right():
        """document string goes here"""
        actions.user.system_switcher()

    def foot_pedal_right_left():
        """document string goes here"""
        actions.user.mouse_toggle_zoom_mouse()
        #actions.key("pageup")

    def foot_pedal_right_middle():
        """document string goes here"""
        actions.user.microphone_toggle()
        # actions.key("pagedown")

    def foot_pedal_right_right():
        """document string goes here"""
        actions.user.wake_or_sleep()


@ctx_zoom_mouse_triggered_use_pedal.action_class("user")
class WindowsZoomMouseActiveActions:
    def foot_pedal_left_left():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_trigger()

    def foot_pedal_left_middle():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.right_click()

    def foot_pedal_left_right():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.double_click()

    def foot_pedal_right_left():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.triple_click()

    def foot_pedal_right_middle():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_drag()

    def foot_pedal_right_right():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_move()
