from talon import ui, Module, Context, registry, actions, imgui, cron

mod = Module()
ctx = Context()
mod.apps.microsoft_word = """
os: windows
and app.name: Microsoft Word
os: windows
and app.exe: WINWORD.EXE
"""
