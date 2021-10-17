from talon import Module, Context
from talon.mac import applescript

ctx = Context()
mod = Module()

mod.apps.excel = """
os: mac
and app.bundle: com.microsoft.Excel
"""

ctx.matches = r"""
app: excel
"""

@ctx.action_class('edit')
class UserActions:
	def zoom_in():
		applescript.run(r"""
			tell application id "com.microsoft.Excel" to set front window's zoom to (front window's zoom) * 1.25
		""")

	def zoom_out():
		applescript.run(r"""
			tell application id "com.microsoft.Excel" to set front window's zoom to (front window's zoom) / 1.25
		""")

	def zoom_reset():
		applescript.run(r"""
			tell application id "com.microsoft.Excel" to set front window's zoom to 100
		""")
