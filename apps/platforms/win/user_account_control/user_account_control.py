from talon import Module

mod = Module()
mod.apps.user_account_control = """
os: windows
and app.name: consent.exe
"""
