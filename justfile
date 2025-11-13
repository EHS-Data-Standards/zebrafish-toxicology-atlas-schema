# On Windows the bash shell that comes with Git for Windows should be used.
# If it is not on path, give the path to the executable in the following line.
#set windows-shell := ["C:/Program Files/Git/usr/bin/sh", "-cu"]

# Load environment variables from config.public.mk or specified file
set dotenv-load := true
# set dotenv-filename := env_var_or_default("LINKML_ENVIRONMENT_FILENAME", "config.public.mk")
set dotenv-filename := x'${LINKML_ENVIRONMENT_FILENAME:-config.public.mk}'


# List all commands as default command. The prefix "_" hides the command.
_default:
    @just --list
    @echo ""
    @echo "Main targets:"
    @echo "  install    -- install dependencies"
    @echo "  test       -- runs tests including spelling checks and linting checks"
    @echo "  lint       -- perform schema linting"
    @echo "  testdoc    -- builds docs and runs local test server"
    @echo ""

# Set cross-platform Python shebang line (assumes presence of launcher on Windows)
shebang := if os() == 'windows' {
  'py'
} else {
  '/usr/bin/env python3'
}

# Environment variables with defaults
schema_name := env_var_or_default("LINKML_SCHEMA_NAME", "zebrafish_toxicology_atlas_schema")
source_schema_path := env_var_or_default("LINKML_SCHEMA_SOURCE_PATH", "src/zebrafish_toxicology_atlas_schema/schema/zebrafish_toxicology_atlas_schema.yaml")

use_schemasheets := env_var_or_default("LINKML_USE_SCHEMASHEETS", "No")
sheet_module := env_var_or_default("LINKML_SCHEMA_GOOGLE_SHEET_MODULE", "")
sheet_ID := env_var_or_default("LINKML_SCHEMA_GOOGLE_SHEET_ID", "")
sheet_tabs := env_var_or_default("LINKML_SCHEMA_GOOGLE_SHEET_TABS", "")
sheet_module_path := source_schema_path / sheet_module + ".yaml"

config_yaml := if env_var_or_default("LINKML_GENERATORS_CONFIG_YAML", "") != "" {
  "--config-file " + env_var_or_default("LINKML_GENERATORS_CONFIG_YAML", "")
} else {
  ""
}
gen_doc_args := env_var_or_default("LINKML_GENERATORS_DOC_ARGS", "")
gen_owl_args := env_var_or_default("LINKML_GENERATORS_OWL_ARGS", "")
gen_java_args := env_var_or_default("LINKML_GENERATORS_JAVA_ARGS", "")
gen_ts_args := env_var_or_default("LINKML_GENERATORS_TYPESCRIPT_ARGS", "")

# Directory variables
src := "src"
dest := "project"
pymodel := src / schema_name / "datamodel"
docdir := "docs"
exampledir := "examples"
templatedir := "doc-templates"

# Show current project status
_status: _check-config
    @echo "Project: {{schema_name}}"
    @echo "Source: {{source_schema_path}}"

# Run initial setup (run this first)
setup: _check-config _git-init install gen-project _gen-examples gendoc _git-add _git-commit

# Install project dependencies
install:
    uv sync

# Check project configuration
_check-config:
    #!{{shebang}}
    import os
    schema_name = os.getenv('LINKML_SCHEMA_NAME')
    if not schema_name:
        print('**Project not configured**:\n - See \'.env.public\'')
        exit(1)
    print('Project-status: Ok')

# Updates project template and LinkML package
update: _update-template _update-linkml

# Update project template
_update-template:
    cruft update

# Update LinkML to latest version
_update-linkml:
    uv add --dev linkml

# Create data harmonizer
_create-data-harmonizer:
    npm init data-harmonizer {{source_schema_path}}

# Generate all project files
alias all := site

# Generate site locally
site: gen-project gendoc

# Deploy site
deploy: site mkd-gh-deploy

_compile_sheets:
    @if [ "{{use_schemasheets}}" != "No" ]; then \
        uv run sheets2linkml --gsheet-id {{sheet_ID}} {{sheet_tabs}} > {{sheet_module_path}}.tmp && \
        mv {{sheet_module_path}}.tmp {{sheet_module_path}}; \
    fi

# Generate examples
_gen-examples:
    mkdir -p {{exampledir}}
    cp -r tests/data/examples/* {{exampledir}}

# Run all tests
test: _test-schema _test-python _test-examples

# Run PR tests (pytest, codespell, yamllint)
test_pr:
    uv run pytest
    uv run codespell
    uv run yamllint -c .yamllint-config src/zebrafish_toxicology_atlas_schema/schema/*.yaml

# Test schema generation
_test-schema:
    uv run gen-project {{config_yaml}} -d tmp {{source_schema_path}}

# Run Python unit tests with pytest
_test-python:
    uv run pytest

# Run example tests
_test-examples: _ensure_examples_output
    uv run linkml-run-examples \
        --output-formats json \
        --output-formats yaml \
        --counter-example-input-directory tests/data/examples/invalid \
        --input-directory tests/data/examples/valid \
        --output-directory examples/output \
        --schema {{source_schema_path}} > examples/output/README.md




# Initialize and add everything to git
_git-init-add: _git-init _git-add _git-commit

# Initialize git repository
_git-init:
    git init

# Add files to git
_git-add:
    touch .cruft.json
    git add .

# Commit files to git
_git-commit:
    git commit -m 'chore: make setup was run' -a

# Clean all generated files
clean:
    rm -rf {{dest}}
    rm -rf tmp
    rm -rf {{docdir}}/*
    rm -rf {{pymodel}}

# Private recipes
_ensure_pymodel_dir:
    -mkdir -p {{pymodel}}

_ensure_docdir:
    -mkdir -p {{docdir}}

_ensure_examples_output:
    -mkdir -p examples/output

# Import modular justfiles
import "linkml.justfile"
import "documentation.justfile"
import "validation.justfile"
import "project.justfile"
