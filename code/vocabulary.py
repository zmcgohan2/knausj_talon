from talon import Module, Context, resource, actions
import os
import csv
from pathlib import Path
from typing import Dict, List, Tuple

# NOTE: This method requires this module to be one folder below the top-level
#   knausj folder.
SETTINGS_DIR = Path(__file__).parents[1] / "settings"

mod = Module()
ctx = Context()

mod.list("vocabulary", desc="additional vocabulary words")


@mod.capture(rule="({user.vocabulary} | <word>)")
def word(m) -> str:
    try:
        return m.vocabulary
    except AttributeError:
        return " ".join(
            actions.dictate.replace_words(actions.dictate.parse_words(m.word))
        )


@mod.capture(rule="({user.vocabulary} | <phrase>)+")
def text(m) -> str:
    return format_phrase(m)


@mod.capture(rule="({user.vocabulary} | {user.punctuation} | <phrase>)+")
def prose(m) -> str:
    return format_phrase(m)


# TODO: unify this formatting code with the dictation formatting code, so that
# user.prose behaves the same way as dictation mode.
no_space_before = set("\n .,!?;:-/%)]}")
no_space_after = set("\n -/#([{$£€¥₩₽₹")


def format_phrase(m):
    words = capture_to_word_list(m)
    result = ""
    for i, word in enumerate(words):
        if (
            i > 0
            and word not in no_space_before
            and words[i - 1][-1] not in no_space_after
        ):
            result += " "
        result += word
    return result


def capture_to_word_list(m):
    words = []
    for item in m:
        words.extend(
            actions.dictate.replace_words(actions.dictate.parse_words(item))
            if isinstance(item, grammar.vm.Phrase)
            else item.split(" ")
        )
    return words


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

    return mapping


# ---------- LISTS (punctuation, additional/replacement words) ----------
# Default words that will need to be capitalized (particularly under w2l).
_capitalize_defaults = [
    "I",
    "I'm",
    "I've",
    "I'll",
    "I'd",
    "Monday",
    "Mondays",
    "Tuesday",
    "Tuesdays",
    "Wednesday",
    "Wednesdays",
    "Thursday",
    "Thursdays",
    "Friday",
    "Fridays",
    "Saturday",
    "Saturdays",
    "Sunday",
    "Sundays",
    "January",
    "February",
    # March omitted because it's a regular word too
    "April",
    # May omitted because it's a regular word too
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
]

# Default words that need to be remapped.
_word_map_defaults = {
    # E.g:
    # "cash": "cache",
}
_word_map_defaults.update({word.lower(): word for word in _capitalize_defaults})

# "dictate.word_map" is used by `actions.dictate.replace_words` to rewrite words
# Talon recognized. Entries in word_map don't change the priority with which
# Talon recognizes some words over others.
ctx.settings["dictate.word_map"] = get_list_from_csv(
    "words_to_replace.csv",
    headers=("Replacement", "Original"),
    default=_word_map_defaults,
)


# Default words that should be added to Talon's vocabulary.
_simple_vocab_default = ["nmap", "admin", "Cisco", "Citrix", "VPN", "DNS", "Minecraft"]

# Defaults for different pronounciations of words that need to be added to
# Talon's vocabulary.
_default_vocabulary = {
    "N map": "nmap",
    "under documented": "under-documented",
}

_default_vocabulary.update({word: word for word in _simple_vocab_default})

# "user.vocabulary" is used to explicitly add words/phrases that Talon doesn't
# recognize. Words in user.vocabulary (or other lists and captures) are
# "command-like" and their recognition is prioritized over ordinary words.
ctx.lists["user.vocabulary"] = get_list_from_csv(
    "additional_words.csv",
    headers=("Word(s)", "Spoken Form (If Different)"),
    default=_default_vocabulary,
)
