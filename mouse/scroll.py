import time
import math

from talon import actions, cron, ctrl, Module, app
from talon.track.geom import Point2d
from talon_plugins import eye_mouse
from talon import noise, app
from talon_plugins import eye_mouse, eye_zoom_mouse, speech
from pynput import keyboard


# Interval in ms between scroll ticks
#
# TODO: Can this be less than 16? Does it reset to 16?
TICK_INTERVAL = 16
# Base speed to supply to the mouse wheel function per tick
if app.platform == "windows":
    BASE_SPEED = 8
elif app.platform == "linux":
    BASE_SPEED = 0.3
elif app.platform == "mac":
    # TODO: Untested. Need to establish the best speed for Mac.
    BASE_SPEED = 0.3

# Closer to 0 means more aggressive acceleration. 1 is linear acceleration.
# More than 1 is slow-starting exponential.
ACCELERATION_EXPONENT = 2
# Time to max speed, in secs
ACCELERATION_PERIOD = 2
# Minimum speed multiple, 0 to 1. Acceleration factor will start from here, and
# grow to 1.
MIN_SPEED_FACTOR = 0.4


_scroll_job = None
_start_mouse_pos = None
_current_direction = None
_scroll_progress = 0


def start():
    global _scroll_job, _start_mouse_pos, _current_direction, _start_time, _scroll_progress
    if _scroll_job:
        stop()
    _start_mouse_pos = ctrl.mouse_pos()
    relative_gaze, absolute_gaze = _grab_gaze()
    if absolute_gaze:
        _hover_mouse(absolute_gaze)
        _current_direction = _direction_from_gaze(relative_gaze)
        _scroll_progress = 0
        _start_time = time.monotonic()
        _scroll_job = cron.interval(f"{TICK_INTERVAL}ms", _scroll_tick)


def _hover_mouse(absolute_gaze):
    """Hover the mouse over the pane the user is looking at.

    The mouse has to be hovering over the scrollable pane to scroll.

    """
    screen_center = eye_mouse.config.size_px / 2
    distance_from_center = absolute_gaze - screen_center
    # Squash upwards slightly, so if the user is looking at the boundary of the
    # window, the mouse is always moved inside.
    y_pos = screen_center.y + (distance_from_center.y * 0.8)
    actions.mouse_move(absolute_gaze.x, y_pos)


def stop():
    global _scroll_job, _start_mouse_pos, _current_direction, _start_time
    if _scroll_job:
        cron.cancel(_scroll_job)
        _scroll_job = None
        _current_direction = None
        _start_time = 0
        if _start_mouse_pos:
            actions.mouse_move(*_start_mouse_pos)
            _start_mouse_pos = None


def _elapsed_secs():
    return time.monotonic() - _start_time


# TODO: Probably extract to an action
def _scroll_tick():
    global _scroll_progress
    # TODO: Acceleration
    relative_gaze, _ = _grab_gaze()
    if relative_gaze:
        if _current_direction == "up":
            magnitude = 1 - relative_gaze.y
            sign = -1
        elif _current_direction == "down":
            magnitude = relative_gaze.y
            sign = 1
        else:
            stop()
            return
            # raise ValueError("No `_current_direction`.")
        # Use an exponent to get finer control near the far edge of the screen.
        # Magnitude should be -0.02 to 1.02 (i.e. roughly between 0 and 1), so
        # this won't blow it out.
        #
        # We also shrink the curve inwards, so there's a "look zone" on either
        # side where the whole zone will give max/min movement. This means the
        # user doesn't have to look right at the edge of the screen.
        normalised = (
            # Base curve
            magnitude ** 3
            # Shrink the curve inwards
            / 0.6
            + 0.2 * magnitude
        )
        acceleration_factor = (
            # Get the base factor
            (
                min(_elapsed_secs(), ACCELERATION_PERIOD)
                # Normalize to between 0 & 1
                / ACCELERATION_PERIOD
            )
            # Apply exponential speedup
            ** ACCELERATION_EXPONENT
            # Start the curve from the minimum speed, not 0.
            / MIN_SPEED_FACTOR
            + MIN_SPEED_FACTOR
        )
        # We gradually fill up a kind of "tick bar" and only scroll when it
        # goes over a round number to cover platforms where "1 unit" is a large
        # scroll amount (e.g. Linux).
        abs_amount = normalised * acceleration_factor * BASE_SPEED * sign
        _scroll_progress += abs_amount
        if abs(_scroll_progress) >= 1:
            actions.mouse_scroll(math.floor(_scroll_progress))
            _scroll_progress = _scroll_progress % 1


def _grab_gaze():
    if len(eye_mouse.mouse.eye_hist) < 2:
        return
    left_eye, right_eye = eye_mouse.mouse.eye_hist[-1]
    gaze = (left_eye.gaze + right_eye.gaze) / 2
    gaze_found = (
        -0.02 < gaze.x < 1.02
        and -0.02 < gaze.y < 1.02
        # TODO: Won't work if only picking up one eye
        and bool(left_eye or right_eye)
    )
    if gaze_found:
        absolute = eye_mouse.config.size_px * gaze
        return gaze, absolute
    else:
        return None, None


def _direction_from_gaze(relative_gaze: Point2d) -> str:
    if relative_gaze:
        if relative_gaze.y < 0.5:
            return "up"
        else:
            return "down"
    else:
        return None, 0


sleep = False


def on_pop(state):
    global sleep
    if eye_zoom_mouse.zoom_mouse.enabled:
        sleep = not sleep


def on_hiss(state):
    global sleep
    if (
        not eye_zoom_mouse.zoom_mouse.enabled
        or eye_zoom_mouse.zoom_mouse.state != eye_zoom_mouse.STATE_IDLE
    ):
        return

    if sleep:
        sleep = not sleep
        return

    if state:
        # print("started")
        start()
    else:
        stop()


noise.register("pop", on_pop)
noise.register("hiss", on_hiss)


def on_activate():
    print("on_activate")
    # if eye_zoom_mouse.zoom_mouse.enabled:
    #    start()


def on_release():
    print("on_release")
    if eye_zoom_mouse.zoom_mouse.enabled:
        if not _scroll_job:
            start()
        else:
            stop()


def for_canonical(f):
    return lambda k: f(l.canonical(k))


class HotKeyRelease(keyboard.HotKey):
    def __init__(self, keys, on_activate, on_release):
        super().__init__(keys, on_activate)
        self._just_activated = False
        self._on_release = on_release

    def release(self, key):
        super().release(key)
        if self._just_activated and self._state != self._keys:
            self._on_release()
            self._just_activated = False

    def press(self, key):
        if key in self._keys and key not in self._state:
            self._state.add(key)
            if self._state == self._keys:
                self._on_activate()
                self._just_activated = True


mod = Module()


@mod.action_class
class Actions:
    def toggle_gaze_scroll():
        """test"""
        on_release()

    def trigger_custom_zoom():
        """test"""
        on_release_zoom()


def on_activate():
    print("on_activate")
    # if eye_zoom_mouse.zoom_mouse.enabled:
    #    start()


def on_release():
    print("on_release")
    if (
        eye_zoom_mouse.zoom_mouse.enabled
        and eye_zoom_mouse.zoom_mouse.state == eye_zoom_mouse.STATE_IDLE
    ):
        if not _scroll_job:
            start()
        else:
            stop()


def on_release_zoom():
    print("on_release_zoom")
    if eye_zoom_mouse.zoom_mouse.enabled:
        if not _scroll_job:
            print("on_pop")
            actions.sleep("10ms")
            eye_zoom_mouse.zoom_mouse.on_pop(eye_zoom_mouse.zoom_mouse.state)


def for_canonical(f):
    return lambda k: f(l.canonical(k))


# if app.platform == "windows":
#     hotkey = HotKeyRelease(
#         keyboard.HotKey.parse("<cmd>+<shift>+<f11>"), on_activate, on_release
#     )
#     hotkey2 = HotKeyRelease(
#         keyboard.HotKey.parse("<cmd>+<shift>+<f12>"), on_activate, on_release_zoom
#     )

#     l = keyboard.Listener(
#         on_press=for_canonical(hotkey.press), on_release=for_canonical(hotkey.release)
#     )

#     m = keyboard.Listener(
#         on_press=for_canonical(hotkey2.press), on_release=for_canonical(hotkey2.release)
#     )

#     l.start()
#     m.start()
