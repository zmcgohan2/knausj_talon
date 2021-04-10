import csv
import os
from pathlib import Path
from typing import Dict, List, Tuple
from talon import resource
import shutil

# NOTE: This method requires this module to be one folder below the top-level
#   knausj folder.
SETTINGS_DIR = Path(__file__).parents[1] / "settings"
DATA_DIR = Path(__file__).parents[1] / "data"

if not SETTINGS_DIR.is_dir():
    os.mkdir(SETTINGS_DIR)

if not DATA_DIR.is_dir():
    os.mkdir(DATA_DIR)


def get_list_from_csv(filename: str, headers: Tuple[str, str] = None):
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

    # print(str(rows))
    mapping = {}
    if len(rows) >= 2:
        # the start row for the actual contents, excluding the header
        start_row_index = 0

        if headers is not None:
            start_row_index = 1
            actual_headers = rows[0]
            if not actual_headers == list(headers):
                print(
                    f'"{filename}": Malformed headers - {actual_headers}.'
                    + f" Should be {list(headers)}. Ignoring row."
                )

        for row in rows[start_row_index:]:
            if len(row) == 0:
                # Windows newlines are sometimes read as empty rows. :champagne:
                continue
            if len(row) == 1:
                output = spoken_form = row[0]
            else:
                output, spoken_form = row[:2]
                if len(row) > 2:
                    print(
                        f'"{filename}": More than two values in row: {row}.'
                        + " Ignoring the extras."
                    )
            # Leading/trailing whitespace in spoken form can prevent recognition.
            spoken_form = spoken_form.strip()
            mapping[spoken_form] = output

    return mapping
