from talon import actions, registry
from talon.microphone import manager

PREFERRED_MICROPHONES = ('Jabra Link 370', )

def mic_changed_to(device):
    if device and device.name not in PREFERRED_MICROPHONES:
        actions.speech.disable()

manager.register('mic_change', mic_changed_to)

# note: cubeb API may not be stable; don't rely on this
from talon.lib import cubeb
from talon import speech_system

update_speech_registered = True

ctx = cubeb.Context()
def devices_changed(device_type):
    global update_speech_registered        
    if device_type is cubeb.DeviceType.INPUT:
        if update_speech_registered:
            registry.unregister('update_speech', speech_updated)
            update_speech_registered = False
        for device in ctx.inputs():
            if device.name in PREFERRED_MICROPHONES:
                speech_system.engine.set_microphone(device)
                actions.speech.enable()
                return
        try:
            # XXX can't figure out how to run this late enough that this works:
            #     1:              talon_plugins/speech.py:29 | return not 'sleep' in scope.get('mode')
            # TypeError: argument of type 'NoneType' is not iterable
            actions.speech.disable()
        except TypeError: # XXX hack! (copied from talon_plugins/speech.py)
            actions.mode.save()
            actions.mode.disable('command')
            actions.mode.disable('dictation')
            actions.mode.enable('sleep')

ctx.register('devices_changed', devices_changed)

# at startup, disable speech recognition if no preferred microphone connected
from talon import registry
def speech_updated():
    devices_changed(cubeb.DeviceType.INPUT)

registry.register('update_speech', speech_updated)
