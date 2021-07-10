from talon import Context, Module, app, actions, speech_system
from talon import canvas, ui
from talon.types import Rect

mod = Module()

modes = {
    "admin": "enable extra administration commands terminal (docker, etc)",
    "debug": "a way to force debugger commands to be loaded",
    "gdb": "a way to force gdb commands to be loaded",
    "ida": "a way to force ida commands to be loaded",
    "presentation": "a more strict form of sleep where only a more strict wake up command works",
    "windbg": "a way to force windbg commands to be loaded",
}

for key, value in modes.items():
    mod.mode(key, value)


@mod.action_class
class Actions:
    def talon_mode():
        """For windows and Mac with Dragon, enables Talon commands and Dragon's command mode."""
        actions.speech.enable()

        engine = speech_system.engine.name
        # app.notify(engine)
        if "dragon" in engine:
            if app.platform == "mac":
                actions.user.engine_sleep()
            elif app.platform == "windows":
                actions.user.engine_wake()
                # note: this may not do anything for all versions of Dragon. Requires Pro.
                actions.user.engine_mimic("switch to command mode")

    def dragon_mode():
        """For windows and Mac with Dragon, disables Talon commands and exits Dragon's command mode"""
        engine = speech_system.engine.name
        # app.notify(engine)

        if "dragon" in engine:
            # app.notify("dragon mode")
            actions.speech.disable()
            if app.platform == "mac":
                actions.user.engine_wake()
            elif app.platform == "windows":
                actions.user.engine_wake()
                # note: this may not do anything for all versions of Dragon. Requires Pro.
                actions.user.engine_mimic("start normal mode")

    def dictation_mode():
        """Switch to dictation mode."""
        actions.mode.disable("sleep")
        actions.mode.disable("command")
        actions.mode.enable("dictation")
        actions.user.code_clear_language_mode()
        actions.mode.disable("user.gdb")
        show_mode()

    def command_mode():
        """Switch to command mode."""
        actions.mode.disable("sleep")
        actions.mode.disable("dictation")
        actions.mode.enable("command")
        hide_mode()

    def toggle_dictation_mode():
        """Switch from dictation to command mode or vice versa."""
        # XXX uses private API
        from talon import registry
        if 'dictation' in registry._modes.modes:
            actions.user.command_mode()
        else:
            actions.user.dictation_mode()

mode_canvas = None

def show_mode():
    global mode_canvas

    if mode_canvas is not None:
        return

    mode_canvas = canvas.Canvas.from_screen(ui.screens()[0])
    mode_canvas.register('draw', draw_mode)
    mode_canvas.freeze()

def hide_mode():
    global mode_canvas

    if mode_canvas is None:
        return

    mode_canvas.unregister('draw', draw_mode)
    mode_canvas.close()
    mode_canvas = None

def draw_mode(canvas):
    paint = canvas.paint
    paint.textsize = 12
    text = 'Dictation Mode'
    _, text_rect = canvas.paint.measure_text(text)

    screen_rect = ui.screens()[0].visible_rect
    padding_x = 5
    padding_y = 5

    bg_rect = Rect(
        screen_rect.width - text_rect.width - (padding_x * 2),
        screen_rect.y,
        text_rect.width + (padding_x * 2),
        text_rect.height + (padding_y * 2)
    )    
    canvas.draw_rect(bg_rect)
    paint.color = "ffffffff"
    canvas.draw_text(
        text,
        bg_rect.x + padding_x,
        bg_rect.y + padding_y + text_rect.height)
