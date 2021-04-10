# XXX - would be nice to be able pipe these through formatters
import csv
import shutil

from talon import Context, Module, resource

from .user_settings import get_list_from_csv

mod = Module()
mod.list("abbreviation", desc="Common abbreviation")

ctx = Context()

ctx.lists["user.abbreviation"] = get_list_from_csv(
    "abbreviations.csv", headers=None, spoken_form_first=True
)
