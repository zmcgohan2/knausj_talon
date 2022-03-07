from talon import Module, Context
from user.knausj_talon.code.user_settings import get_list_from_csv

# --- Tag definition ---
mod = Module()
mod.tag("emoji", desc="Emoji, ascii emoticons and kaomoji")

# Context matching
ctx = Context()
ctx.matches = """
#tag: user.emoji
"""


mod.list("emoticon", desc="Western emoticons (ascii)")
mod.list("emoji", desc="Emoji (unicode)")
mod.list("kaomoji", desc="Eastern kaomoji (unicode)")

emoticons = get_list_from_csv("emoticon.csv", headers=None, spoken_form_first=True)
emojis = get_list_from_csv("emoji.csv", headers=None, spoken_form_first=True)
kaomojis = get_list_from_csv("kaomoji.csv", headers=None, spoken_form_first=True)

ctx.lists["user.emoticon"] = emoticons
ctx.lists["user.emoji"] = emojis
ctx.lists["user.kaomoji"] = kaomojis
