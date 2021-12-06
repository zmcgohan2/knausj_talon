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
    def hitch2_s1():
        """document string goes here"""

    def hitch2_s2():
        """document string goes here"""

    def hitch2_s3():
        """document string goes here"""

    def hitch2_s4():
        """document string goes here"""

    def hitch2_s5():
        """document string goes here"""

@ctx_zoom_mouse_inactive.action_class("user")
class WindowsZoomMouseInactiveActions:
    def hitch2_s1():
        """document string goes here"""
        actions.talon_plugins.eye_zoom_mouse.mouse_trigger()

    def hitch2_s2():
        """document string goes here"""
        actions.user.toggle_gaze_scroll()

    def hitch2_s3():
        """document string goes here"""
        actions.user.system_switcher()

    def hitch2_s4():
        """document string goes here"""
        actions.user.mouse_toggle_zoom_mouse()

    def hitch2_s5():
        """document string goes here"""
        actions.user.microphone_toggle()

@ctx_zoom_mouse_active.action_class("user")
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