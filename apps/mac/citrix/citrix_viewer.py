from talon import actions, app, Context, keychain, Module, ui

mod = Module()

mod.apps.citrix_viewer = """
os: mac
and app.bundle: com.citrix.receiver.icaviewer.mac
"""