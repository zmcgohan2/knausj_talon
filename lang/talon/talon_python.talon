# this tag is meant to be asserted in a user-specific fashion as appropriate
# to enable the talon-specific support for python
tag: user.talon_python
-
# uncomment user.talon_populate_lists tag to activate talon-specific lists of actions, scopes, modes etcetera. 
# Do not enable this tag with dragon, as it will be unusable.
# with conformer, the latency increase may also be unacceptable depending on your cpu
# see https://github.com/knausj85/knausj_talon/issues/600
tag(): user.talon_populate_lists

talent imports:
    "from talon import ui, Module, Context, registry, actions, imgui, cron\n"
(context and module | module and context):
    """mod = Module()
    ctx = Context()
    """
action class:
    """@mod.action_class
    class Actions:
    """
mod capture:
    '''@mod.capture(rule="")
    def (m):
        ""'''
context lists:
    'ctx.lists["user."] = '
    key(left:5)
context matches:
    'ctx.matches = r""""""'
    key(left:3 enter:2 up)
mod list: user.code_insert_function("mod.list", edit.selected_text())
mod tag: user.code_insert_function("mod.tag", edit.selected_text())
application [require] [{user.talon_apps}]: 
    app = talon_apps or ""
    user.paste("app: {app}")
mode require [{user.talon_modes}]: 
    mode = talon_modes or ""
    user.paste("mode: {mode}")
tag require [{user.talon_tags}]: 
    tag = talon_tags or ""
    user.paste("tag: {tag}")
mod setting: 'mod.setting("",type=,default=,desc="",)'
# requires user.talon_populate_lists tag. do not use with dragon
(action | fun) {user.talon_actions}:
    user.code_insert_function("actions.{talon_actions}", edit.selected_text())
# requires user.talon_populate_lists tag. do not use with dragon
context list {user.talon_lists}: 'ctx.lists["{talon_lists}"] = '
#commands for dictating key combos
key <user.keys> over: "{keys}"
key <user.modifiers> over: "{modifiers}"