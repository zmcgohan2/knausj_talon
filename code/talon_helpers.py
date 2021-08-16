from talon import Context, actions, ui, Module, app, clip, scope
import os
import re
from itertools import islice


mod = Module()
pattern = re.compile(r"[A-Z][a-z]*|[a-z]+|\d")

# todo: should this be an action that lives elsewhere??
def create_name(text, max_len=20):
    return "_".join(list(islice(pattern.findall(text), max_len))).lower()


@mod.action_class
class Actions:
    def talon_add_context_clipboard_python():
        """Adds os-specific context info to the clipboard for the focused app for .py files. Assumes you've a Module named mod declared."""
        friendly_name = actions.app.name()
        # print(actions.app.executable())
        executable = actions.app.executable().split(os.path.sep)[-1]
        app_name = create_name(friendly_name.replace(".exe", ""))
        if app.platform == "mac":
            result = 'mod.apps.{} = """\nos: {}\nand app.bundle: {}\n"""'.format(
                app_name, app.platform, actions.app.bundle()
            )
        elif app.platform == "windows":
            result = 'mod.apps.{} = """\nos: windows\nand app.name: {}\nos: windows\nand app.exe: {}\n"""'.format(
                app_name, friendly_name, executable
            )
        else:
            result = 'mod.apps.{} = """\nos: {}\nand app.name: {}\n"""'.format(
                app_name, app.platform, friendly_name
            )

        clip.set_text(result)

    def talon_add_context_clipboard():
        """Adds os-specific context info to the clipboard for the focused app for .talon files"""
        friendly_name = actions.app.name()
        # print(actions.app.executable())
        executable = actions.app.executable().split(os.path.sep)[-1]
        if app.platform == "mac":
            result = "os: {}\nand app.bundle: {}\n".format(
                app.platform, actions.app.bundle()
            )
        elif app.platform == "windows":
            result = "os: windows\nand app.name: {}\nos: windows\nand app.exe: {}\n".format(
                friendly_name, executable
            )
        else:
            result = "os: {}\nand app.name: {}\n".format(app.platform, friendly_name)

        clip.set_text(result)

    def talon_get_scope(info: str) -> str:
        """Returns Talon scope information."""
        return scope.get(info, '')

    def talon_relaunch():
        """Quit and relaunch the Talon app"""
        from subprocess import Popen
        from shlex import quote

        talon_app = ui.apps(pid=os.getpid())[0]
        talon_app_path = quote(talon_app.path)
        if app.platform == "mac":
            Popen(['/bin/sh', '-c',
                f'/usr/bin/open -W {talon_app_path} ; /usr/bin/open {talon_app_path}'
            ], start_new_session=True)
            talon_app.appscript().quit(waitreply=False) # XXX temporary replacement
        # XXX talon_app.quit() nonfunctional?