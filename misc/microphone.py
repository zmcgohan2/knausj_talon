from talon import actions
from talon.microphone import manager

PREFERRED_MICROPHONES = ('Jabra Link 370', )

def mic_changed_to(device):
    if device and device.name not in PREFERRED_MICROPHONES:
        actions.speech.disable()

manager.register('mic_change', mic_changed_to)

# note: cubeb API may not be stable; don't rely on this
from talon.lib import cubeb
from talon import scripting

ctx = cubeb.Context()
def devices_changed(device_type):
    if device_type is cubeb.DeviceType.INPUT:
        for device in ctx.inputs():
            if device.name in PREFERRED_MICROPHONES:
                scripting.global_speech_system.set_microphone(device)
                return

ctx.register('devices_changed', devices_changed)
