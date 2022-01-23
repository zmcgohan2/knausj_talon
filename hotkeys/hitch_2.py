from talon import ui, Module, Context, registry, actions, imgui, cron

mod = Module()
ctx_zoom_mouse_enabled_use_pedal = Context()
ctx_zoom_mouse_enabled_use_pedal.matches = r"""
mode: talon_plugins.eye_zoom_mouse.zoom_mouse_enabled
and not mode: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
and not tag: talon_plugins.eye_zoom_mouse.zoom_mouse_pedal
"""


ctx_zoom_mouse_triggered_use_pedal = Context()
ctx_zoom_mouse_triggered_use_pedal.matches = r"""
mode: talon_plugins.eye_zoom_mouse.zoom_mouse_enabled
and mode: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
and not tag: talon_plugins.eye_zoom_mouse.zoom_mouse_pedal
"""


@mod.action_class
class Actions:
    def hitch2_s1():
        """document string goes here"""

    def hitch2_s2():
        """document string goes here"""

    def hitch2_s3():
        """document string goes here"""
        actions.user.mouse_scroll_down()

    def hitch2_s4():
        """document string goes here"""
        actions.user.mouse_scroll_up()

    def hitch2_s5():
        """document string goes here"""
        actions.user.microphone_toggle()

    def hitch2_s6():
        """document"""
        actions.user.mouse_toggle_zoom_mouse()

@ctx_zoom_mouse_enabled_use_pedal.action_class("user")
class WindowsZoomMouseInactiveActions:
    def hitch2_s1():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_trigger()

    def hitch2_s2():
        """document string goes here"""
        actions.user.toggle_gaze_scroll()

    def hitch2_s3():
        """document string goes here"""
        actions.user.mouse_scroll_down()

    def hitch2_s4():
        """document string goes here"""
        actions.user.mouse_scroll_up()

    def hitch2_s5():
        """document string goes here"""
        actions.user.microphone_toggle()

    def hitch2_s6():
        """document"""
        actions.user.mouse_toggle_zoom_mouse()


@ctx_zoom_mouse_triggered_use_pedal.action_class("user")
class WindowsZoomMouseActiveActions:
    def hitch2_s1():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_trigger()

    def hitch2_s2():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.right_click()

    def hitch2_s3():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.double_click()

    def hitch2_s4():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.triple_click()

    def hitch2_s5():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_drag()


    def hitch2_s6():
        """document"""
        actions.talon_plugins.eye_zoom_mouse.mouse_move()
