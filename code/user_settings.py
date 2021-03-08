from talon import resource, Module
import os
import csv
from pathlib import Path
from typing import Dict, List, Tuple

mod = Module()

# NOTE: This method requires this module to be one folder below the top-level
#   knausj folder.
SETTINGS_DIR = Path(__file__).parents[1] / "settings"

if not SETTINGS_DIR.is_dir():
    os.mkdir(SETTINGS_DIR)

@mod.action_class
class Actions:
    def get_user_settings_path():
        """Returns the user settings path for knausj_talon"""
        return SETTINGS_DIR
