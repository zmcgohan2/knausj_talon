from talon import speech_system, app
from talon.engines.w2l import W2lEngine

if app.platform == "windows":
    w2l = W2lEngine(model="en_US-conformer", debug=True)
else:
    w2l = W2lEngine(model='conformer-b108-pro', debug=True)

speech_system.add_engine(w2l)
