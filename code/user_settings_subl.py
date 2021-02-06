from talon import actions, Module
from .user_settings import SETTINGS_DIR

mod = Module()

@mod.action_class
class Actions:
	def subl_user_settings():
		"""Edit Talon user settings with Sublime Text."""
		actions.user.subl(list(SETTINGS_DIR.glob('*.csv')))
