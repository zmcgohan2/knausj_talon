from talon import speech_system, app
from talon.engines.w2l import W2lEngine

if app.branch != "pro":
    w2l = W2lEngine(model="en_US-conformer", debug=True)
else:
    # w2l = W2lEngine(model="transformer-300m-a68-pro", debug=True)
    # w2l = W2lEngine(model="conformer-c50-pro", debug=True)
    w2l = W2lEngine(model="conformer-b108-pro", debug=True)

speech_system.add_engine(w2l)
#
