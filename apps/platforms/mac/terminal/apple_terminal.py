from talon import Context, actions, ui
import os

# TODO: fit this to generic_terminal

ctx = Context()
ctx.matches = r"""
app: apple_terminal
"""
directories_to_remap = {}
directories_to_exclude = {}

@ctx.action_class('app')
class AppActions:
    def tab_open():
        actions.key('cmd-t')
    def tab_close():
        actions.key('cmd-w')
    def tab_next():
        actions.key('ctrl-tab')
    def tab_previous():
        actions.key('ctrl-shift-tab')
    def window_open():
        actions.key('cmd-n')

@ctx.action_class('edit')
class EditActions:
    def delete(): actions.key('ctrl-w')
    def extend_word_left(): actions.key('ctrl-space alt-b')
    def extend_word_right(): actions.key('ctrl-space alt-f')
    def delete_line(): actions.key('ctrl-u')
    def word_left(): actions.key('alt-b')
    def word_right(): actions.key('alt-f')
    def line_start(): actions.key('ctrl-a')
    def line_end(): actions.key('ctrl-e')
    def page_down(): actions.key('command-pagedown')
    def page_up(): actions.key('command-pageup')
    def undo(): actions.key('ctrl-_')

@ctx.action_class('user')
class UserActions:
    def file_manager_current_path():
        return ui.active_window().doc or None

    def file_manager_show_properties():
        """Shows the properties for the file"""

    def file_manager_open_directory(path: str):
        """opens the directory that's already visible in the view"""
        actions.insert("cd ")
        path = '"{}"'.format(path)
        actions.insert(path)
        actions.key("enter")

        #jtk - refresh title isn't necessary since the apple terminal does it for us
        #actions.user.file_manager_refresh_title()

    def file_manager_open_parent():
        actions.insert('cd ..')
        actions.key('enter')

    def file_manager_select_directory(path: str):
        """selects the directory"""
        actions.insert(path)

    def file_manager_new_folder(name: str):
        """Creates a new folder in a gui filemanager or inserts the command to do so for terminals"""
        name = '"{}"'.format(name)

        actions.insert("mkdir " + name)

    def file_manager_open_file(path: str):
        """opens the file"""
        actions.insert(path)
        actions.key("enter")

    def file_manager_select_file(path: str):
        """selects the file"""
        actions.insert(path)

    def file_manager_refresh_title():
        return

    def tab_overview():
        actions.key('cmd-shift-\\')
