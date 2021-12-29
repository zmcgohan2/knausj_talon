from talon import ui, Module, Context, registry, actions, imgui, cron

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
    def blue2_s1():
        """document string goes here"""
        actions.user.mouse_scroll_up()

    def blue2_s2():
        """document string goes here"""
        actions.user.mouse_scroll_down()


@ctx_zoom_mouse_enabled_use_pedal.action_class("user")
class WindowsZoomMouseInactiveActions:
    def blue2_s1():
        """document string goes here"""
        actions.user.mouse_scroll_up()

    def blue2_s2():
        """document string goes here"""
        actions.user.mouse_scroll_down()

@ctx_zoom_mouse_triggered_use_pedal.action_class("user")
class WindowsZoomMouseActiveActions:
    def blue2_s1():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_trigger()
        
    def blue2_s2():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.right_click()