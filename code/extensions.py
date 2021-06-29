from .user_settings import get_list_from_csv
from talon import Module, Context, actions, app

from .user_settings import get_list_from_csv


mod = Module()
mod.list("file_extension", desc="A file extension, such as .py")
ctx = Context()

ctx.lists["self.file_extension"] = get_list_from_csv(
    "file_extensions.csv", headers=None, spoken_form_first=True
)

file_extensions = ctx.lists["self.file_extension"]