from talon import app, ui
from talon.track.geom import Point2d
from talon_plugins import speech, eye_mouse, eye_zoom_mouse

if app.platform == "mac":
    width = (int)(ui.main_screen().width * 0.12)
    height = (int)(ui.main_screen().height * 0.10)
    eye_zoom_mouse.config.screen_area = Point2d(width, height)
    eye_zoom_mouse.config.img_scale = 6
elif app.platform == "windows":
    width = (int)(ui.main_screen().width * 0.12)
    height = (int)(ui.main_screen().height * 0.10)
    eye_zoom_mouse.config.screen_area = Point2d(width, height)
    eye_zoom_mouse.config.img_scale = 6
