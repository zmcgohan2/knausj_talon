from talon import Module, ui

mod = Module()

@mod.action_class
class Actions:
	def launch_bundle(bundle: str):
		"""Launch an application by bundle ID."""
		ui.launch(bundle=bundle)