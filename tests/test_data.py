"""Data test."""
import os
import glob
from pathlib import Path
import yaml
from linkml.generators.pythongen import PythonGenerator
ROOT = os.path.join(os.path.dirname(__file__), '..')
DATA_DIR = os.path.join(ROOT, "src", "data", "examples")

EXAMPLE_FILES = glob.glob(os.path.join(DATA_DIR, '*.yaml'))
schemal_yaml =  file_path = Path(__file__).parent.parent / 'src' / 'zebrafish_toxicology_atlas_schema' / 'schema' / 'zebrafish_toxicology_atlas_schema.yaml'

def test_make_python() -> str:
    """
    Generate python code from a schema

    :return: python code as string
    """
    pstr = str(PythonGenerator(schemal_yaml, mergeimports=True).serialize())
    return pstr


def test_catalog_schema_validation():
   pass