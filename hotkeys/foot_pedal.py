from talon import ui, Module, Context, registry, actions, imgui, cron, track
import sys

mod = Module()
ctx_zoom_mouse_enabled_use_pedal = Context()
ctx_zoom_mouse_enabled_use_pedal.matches = r"""
mode: talon_plugins.eye_zoom_mouse.zoom_mouse_enabled
and not mode: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
and tag: talon_plugins.eye_zoom_mouse.zoom_mouse_use_pedal
"""


ctx_zoom_mouse_triggered_use_pedal = Context()
ctx_zoom_mouse_triggered_use_pedal.matches = r"""
mode: talon_plugins.eye_zoom_mouse.zoom_mouse_enabled
and mode: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
and tag: talon_plugins.eye_zoom_mouse.zoom_mouse_use_pedal
"""

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
        actions.key("pageup")

    def foot_pedal_right_middle():
        """document string goes here"""
        actions.key("pagedown")

    def foot_pedal_right_right():
        """document string goes here"""
        try:
            actions.user.wake_or_sleep()
        except track.tobii.EyeClosedErr as e:
            actions.app.notify("Failed to access eye tracker, restarting Talon")
            actions.sleep("500ms")
            actions.user.exec("talon-restart")
        except Exception as e:
            print(e)


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
