from talon import ui, Module, Context, registry, actions, imgui, cron
mod = Module()
ctx = Context()

mod.apps.beyond_compare = """
os: windows
and app.name: Beyond Compare
os: windows
and app.exe: BCompare.exe
"""
