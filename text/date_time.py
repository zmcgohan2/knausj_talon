from talon import Module, Context, actions
import time

mod = Module()
mod.list("ampm", desc="AM or PM")

@mod.capture
def ampm(m) -> str:
	"AM or PM"

ctx = Context()
ctx.lists["self.ampm"] = {
	"AM": " AM",
	"PM": " PM",
	"A": " AM",
	"P": " PM"
}

@mod.capture(rule="{self.ampm}")
def ampm(m) -> str:
	return m.ampm

@mod.action_class
class Actions:
	def insert_time_ampm():
		"""Inserts the current time in 12-hour format"""
		actions.insert(time.strftime('%-I:%M %p'))