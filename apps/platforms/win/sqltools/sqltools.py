from talon import Context, Module, actions

mod = Module()
ctx = Context()

mod.apps.sqltools = """
os: windows
and app.exe: SQLToolsU.exe
"""

ctx.matches = """
os: windows
and app: sqltools
"""

@ctx.action_class('code')
class CodeActions:
    def language():
    	return 'sql'
