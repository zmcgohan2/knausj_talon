# XXX - would be nice to be able pipe these through formatters
import csv
import shutil
from talon import Context, Module, resource
from .user_settings import SETTINGS_DIR, DATA_DIR

mod = Module()
mod.list("abbreviation", desc="Common abbreviation")

ctx = Context()


# todo: this exist only because the order of the spoken form and the output differs from the other files
def get_abbreviations_from_csv(filename: str):
    """Retrieves list from CSV"""
    path = SETTINGS_DIR / filename
    template_name = filename + ".template"
    template_path = DATA_DIR / template_name
    assert filename.endswith(".csv")
    assert template_path.is_file()

    if not path.is_file():
        shutil.copyfile(template_path, path)

    # Now read via resource to take advantage of talon's
    # ability to reload this script for us when the resource changes
    with resource.open(str(path), "r") as f:
        rows = list(csv.reader(f))
    mapping = {}
    for row in rows:
        spoken_form, output = row[:2]
        if len(row) > 2:
            print(
                f'"{filename}": More than two values in row: {row}.'
                + " Ignoring the extras."
            )
        # Leading/trailing whitespace in spoken form can prevent recognition.
        output = output.strip()
        spoken_form = spoken_form.strip()
        mapping[spoken_form] = output

    return mapping


ctx.lists["user.abbreviation"] = get_abbreviations_from_csv("abbreviations.csv")
