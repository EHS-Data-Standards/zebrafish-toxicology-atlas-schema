# Validation and testing recipes

# Check URLs in schema
check_urls:
    uv run check_urls

# Run spell checking
spell:
    uv run codespell

# Run schema linting
lint:
    uv run linkml-lint {{source_schema_path}}