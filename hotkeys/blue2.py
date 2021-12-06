from talon import ui, Module, Context, registry, actions, imgui, cron

mod = Module()
ctx_zoom_mouse_inactive = Context()
ctx_zoom_mouse_inactive.matches = r"""
tag: talon_plugins.eye_zoom_mouse.zoom_mouse_use_pedal
and not tag: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
"""

ctx_zoom_mouse_active = Context()
ctx_zoom_mouse_active.matches = r"""
tag: talon_plugins.eye_zoom_mouse.zoom_mouse_use_pedal
and tag: talon_plugins.eye_zoom_mouse.zoom_mouse_activated
"""

@mod.action_class
class Actions:
    def blue2_s1():
        """document string goes here"""

    def blue2_s2():
        """document string goes here"""


@ctx_zoom_mouse_inactive.action_class("user")
class WindowsZoomMouseInactiveActions:
    def blue2_s1():
        """document string goes here"""
        actions.user.mouse_scroll_up()

    def blue2_s2():
        """document string goes here"""
        actions.user.mouse_scroll_down()

@ctx_zoom_mouse_active.action_class("user")
class WindowsZoomMouseActiveActions:
    def blue2_s1():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_trigger()
        
    def blue2_s2():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.right_click()