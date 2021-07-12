from talon import Module, Context, actions, ui, imgui, clip, settings, registry

mod = Module()
ctx = Context()
mod.list("talon_actions")
mod.list("talon_lists")
mod.list("talon_captures")
mod.list("talon_apps")
mod.list("talon_tags")
mod.list("talon_modes")

ctx.matches = r"""
mode: user.talon
mode: user.auto_lang 
and code.language: talon
"""
ctx.lists["user.code_functions"] = {
    "insert": "insert",
    "key": "key",
    "print": "print",
    "repeat": "repeat",
}

# todo: evaluate whether we need replacement functionality
# REPLACEMENTS = {
#     "str": "string",
#     "vscode": "VS code",
#     "url": "URL",
#     "10": "ten",
#     "20": "twenty",
#     "r": "are",
#     "sys": "sis",
#     "py": "pie",
#     "cd": "CD",
# }


def update_lists(decls):
    for thing in ["actions", "lists", "captures", "tags", "apps", "modes"]:
        l = getattr(decls, thing)
        names = l.keys()
        spoken = [
            actions.user.create_spoken_forms(s, generate_subsequences=False)[-1]
            for s in names
        ]
        ctx.lists[f"user.talon_{thing}"] = dict(zip(spoken, names))
        # print(dict(zip(spoken, names)))


registry.register("update_decls", update_lists)


@ctx.action_class("user")
class UserActions:
    def code_operator_and():
        actions.auto_insert(" and ")

    def code_operator_or():
        actions.auto_insert(" or ")

    def code_operator_subtraction():
        actions.auto_insert(" - ")

    def code_operator_addition():
        actions.auto_insert(" + ")

    def code_operator_multiplication():
        actions.auto_insert(" * ")

    def code_operator_division():
        actions.auto_insert(" / ")

    def code_operator_assignment():
        actions.auto_insert(" = ")

    def code_comment():
        actions.auto_insert("#")

    def code_insert_function(text: str, selection: str):
        if selection:
            text = text + "({})".format(selection)
        else:
            text = text + "()"

        actions.user.paste(text)
        actions.edit.left()
