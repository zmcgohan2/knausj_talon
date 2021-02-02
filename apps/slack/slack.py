from talon import Module

mod = Module()
apps = mod.apps
apps.slack = "app.name: Slack"
apps.slack = """
os: windows
and app.name: slack.exe
"""
apps.slack = """
os: mac
and app.bundle: com.tinyspeck.slackmacgap
"""
