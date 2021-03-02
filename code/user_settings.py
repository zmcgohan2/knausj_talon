from talon import Module, fs, Context, resource
import os
import csv
from pathlib import Path
from typing import Dict, List, Tuple
import threading


# NOTE: This method requires this module to be one folder below the top-level
#   knausj folder.
SETTINGS_DIR = Path(__file__).parents[1] / "settings"


def get_list_from_csv(
    filename: str, headers=Tuple[str, str], default: Dict[str, str] = {}
):
    assert filename.endswith(".csv")
    path = SETTINGS_DIR / filename

    if not SETTINGS_DIR.is_dir():
        os.mkdir(SETTINGS_DIR)

    if not path.is_file():
        with open(path, "w", encoding="utf-8") as file:
            writer = csv.writer(file)
            writer.writerow(headers)
            for key, value in default.items():
                writer.writerow([key] if key == value else [value, key])
    print("updating filename: " + filename)

    # Now read from disk
    with resource.open(path, "r") as file:
        rows = list(csv.reader(file))

    mapping = {}
    if len(rows) >= 2:
        actual_headers = rows[0]
        if not actual_headers == list(headers):
            print(
                f'"{filename}": Malformed headers - {actual_headers}.'
                + f" Should be {list(headers)}. Ignoring row."
            )
        for row in rows[1:]:
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

    print(str(mapping))
    return mapping
