from talon import Module, actions, app, imgui
from talon.lib import cubeb

ctx = cubeb.Context()
mod = Module()


microphone_device_list = []


@imgui.open()
def gui(gui: imgui.GUI):
    gui.text("Select a Microphone")
    gui.line()
    for index, item in enumerate(microphone_device_list, 1):
        if gui.button("{}. {}".format(index, item)):
            actions.user.microphone_select(index)


@mod.action_class
class Actions:
    def microphone_selection_toggle():
        """"""
        if gui.showing:
            gui.hide()
        else:
            global microphone_device_list
            microphone_device_list = [
                dev.name
                for dev in ctx.inputs()
                if str(dev.state) == "DeviceState.ENABLED"
            ]
            microphone_device_list.append("None")
            microphone_device_list.append("System Default")

            gui.show()

    def microphone_select(index: int):
        """Selects a micropohone"""
        if 1 <= index and index <= len(microphone_device_list):
            actions.speech.set_microphone(microphone_device_list[index - 1])
            app.notify(
                "Activating microphone: {}".format(microphone_device_list[index - 1])
            )
            gui.hide()
