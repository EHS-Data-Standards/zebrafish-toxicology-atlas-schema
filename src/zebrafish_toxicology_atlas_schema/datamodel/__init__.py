from pathlib import Path
from .zebrafish_toxicology_atlas_schema import *

THIS_PATH = Path(__file__).parent

SCHEMA_DIRECTORY = THIS_PATH.parent / "schema"
MAIN_SCHEMA_PATH = SCHEMA_DIRECTORY / "zebrafish_toxicology_atlas_schema.yaml"
