from talon import Module, Context, actions

mod = Module()
mod.list("ampm", desc="AM or PM")

@mod.capture
def ampm(m) -> str:
    "AM or PM"

ctx = Context()
ctx.lists["self.ampm"] = {
	"AM": " AM",
	"PM": " PM"
}

@mod.capture(rule="{self.ampm}")
def ampm(m) -> str:
    return m.ampm
