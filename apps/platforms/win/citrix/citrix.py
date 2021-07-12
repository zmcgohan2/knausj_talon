from talon import Module     

mod = Module()

mod.apps.citrix_hyperspace = """
os: windows
and app.exe: WFICA32.EXE
and title: /^Hyperspace - /
"""
