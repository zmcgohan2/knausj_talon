from talon import ui, Module, Context, registry, actions, imgui, cron

mod = Module()
mod.apps.power_toys = """
os: windows
and app.name: PowerToys.Runner
os: windows
and app.exe: PowerToys.Runner.exe
"""
