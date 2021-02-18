from talon import app
from talon.track.geom import Point2d
from talon_plugins import speech, eye_mouse, eye_zoom_mouse

if app.platform == "mac":
    eye_zoom_mouse.config.screen_area = Point2d(150, 125)
    eye_zoom_mouse.config.img_scale = 5
elif app.platform == "windows":
    eye_zoom_mouse.config.screen_area = Point2d(350, 350)
    eye_zoom_mouse.config.img_scale = 6
