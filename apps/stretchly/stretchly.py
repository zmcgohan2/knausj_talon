from talon import Context, Module, actions, app, imgui, resource, ui


def win_event_handler(window):
    # print("event handler")
    if (
        ui.active_window().title == ""
        and ui.active_app().bundle == "net.hovancik.stretchly"
    ):
        # print("stretch is sleeping everything")
        actions.mimic("sleep all")


ui.register("win_focus", win_event_handler)
ui.register("win_title", win_event_handler)

