from talon import actions
from talon.microphone import manager

def mic_changed_to(device):
    if device and device.name not in ('Jabra Link 370', ):
        actions.speech.disable()

manager.register('mic_change', mic_changed_to)