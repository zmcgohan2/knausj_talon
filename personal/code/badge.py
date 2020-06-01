from talon import canvas, ui, registry, imgui, Module, actions
from talon.ui import Rect

# This should use a "frozen canvas" not imgui

badge_color = "555555"

class Box(Rect):
    def draw(self, canvas, color='000000'):
        with canvas.saved():
            paint = canvas.paint
            paint.color = color
            paint.style = paint.Style.FILL
            canvas.draw_rect(self)

def update_badge():
    if actions.speech.enabled():
        badge_color = "00ff00"
    else:
        badge_color = "ff0000"

class config:
    color = '666666'
    canvas = None

class Badge:
    def __init__(self):
        self.color = config.color
        self.running = False
        self.canvas = None

    def start(self):
        if self.canvas:
            self.canvas.close()
            self.canvas = None

        self.color = get_state_color()
        self.canvas = canvas.Canvas.from_screen(main_screen)
        self.canvas.register('draw', self.draw)
        self.running = True
        threading.Thread(target=self.thread).start()

    def stop(self):
        self.running = False
        self.canvas.unregister('draw', self.draw)
        self.canvas.close()
        self.canvas = None

    def thread(self):
        while self.running:
            try:
                self.canvas.allows_capture = False
                self.canvas.freeze()
            except AttributeError:
                pass
            finally:
                try:
                    self.canvas.allows_capture = True
                except AttributeError:
                    pass

    def draw(self, C):
        print("draw canvas")
        self.canvas = canvas.Canvas.from_screen(ui.main_screen())
        output = Box((self.canvas.width / 2 - 5), 10, 10, 10)
        output.draw(self.canvas, color=self.color)
        self.canvas.freeze()

badge = Badge()

def update_badge(modes):
    print("updating badge")
    print(modes)
    badge.draw(None)

def toggle_badge(state, color):
    config.color = color
    if state:
        canvas.register('overlay', badge.draw)
        registry._modes.register('mode_change', update_badge)
    else:
        registry._modes.register('mode_change', update_badge)
        canvas.unregister('overlay', badge.draw)


def get_state_color():
    if actions.speech.enabled():
        return "00ff00"
    else:
        return "ff0000"

mod = Module()
@mod.action_class
class Actions:
    def badge_hide():
        """Shows the status badge"""
        toggle_badge(False, get_state_color())

    def badge_show():
        """Hides the status badge"""
        toggle_badge(True, get_state_color())

# -- OLD
badge_template = """
<style type="text/css">
body {
    width: 5px;
    height: 5px;
    padding: 0;
    margin: 0;
    background-color: {{ color }};
}
</style>
"""
