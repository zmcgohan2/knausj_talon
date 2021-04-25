from talon import Context, Module, actions
from talon import speech_system

mod = Module()


@mod.action_class
class Actions:
    def engine_sleep():
        """Sleep the engine"""
        engine = speech_system.engine.name
        if 'dragon' in engine:
            speech_system.engine_mimic("go to sleep"),
        else:
            actions.speech.disable()


    def engine_wake():
        """Wake the engine"""
        engine = speech_system.engine.name
        if 'dragon' in engine:
            speech_system.engine_mimic("wake up"),
        else:
            actions.speech.enable()        
        

    def engine_mimic(cmd: str):
        """Sends phrase to engine"""
        speech_system.engine_mimic(cmd)
