# Documentation generation recipes

# Generate documentation
gendoc:
    mkdir -p {{docdir}}
    uv run gen-doc -d {{docdir}} {{source_schema_path}}
    cp {{dest}}/owl/{{schema_name}}.owl.ttl {{docdir}}/{{schema_name}}.owl.ttl
    cp {{dest}}/jsonld/{{schema_name}}.context.jsonld {{docdir}}/{{schema_name}}.context.jsonld
    cp {{dest}}/jsonld/{{schema_name}}.context.jsonld {{docdir}}/context.jsonld
    cp {{dest}}/jsonld/{{schema_name}}.jsonld {{docdir}}/{{schema_name}}.jsonld
    cp {{dest}}/jsonschema/{{schema_name}}.schema.json {{docdir}}/{{schema_name}}.json
    cp {{dest}}/graphql/{{schema_name}}.graphql {{docdir}}/{{schema_name}}.graphql
    cp {{dest}}/shex/{{schema_name}}.shex {{docdir}}/{{schema_name}}.shex
    cp {{dest}}/shacl/{{schema_name}}.shacl.ttl {{docdir}}/{{schema_name}}.shacl.ttl
    cp {{src}}/{{schema_name}}/schema/{{schema_name}}.yaml {{docdir}}
    cp -r {{src}}/docs/* {{docdir}}
    cp -r {{src}}/docs/images {{docdir}}/images
    cp {{src}}/docs/*.css {{docdir}}
    uv run gen-plantuml {{source_schema_path}} > {{docdir}}/schema_diagram.puml
    uv run gen-erdiagram {{source_schema_path}} > {{docdir}}/schema_diagram.mmd
    echo "# Schema Entity-Relationship Diagram" > {{docdir}}/schema_diagram.md
    echo "" >> {{docdir}}/schema_diagram.md
    echo "This diagram shows the entity-relationship model of the Zebrafish Toxicology Atlas Schema." >> {{docdir}}/schema_diagram.md
    echo "" >> {{docdir}}/schema_diagram.md
    cat {{docdir}}/schema_diagram.mmd >> {{docdir}}/schema_diagram.md
    mkdir -p {{dest}}/sqlddl
    uv run gen-sqlddl {{source_schema_path}} > {{dest}}/sqlddl/{{schema_name}}.sql
    rm -f {{docdir}}/temp.db
    sqlite3 {{docdir}}/temp.db < {{dest}}/sqlddl/{{schema_name}}.sql
    uv run eralchemy2 -i "sqlite:///{{docdir}}/temp.db" -o {{docdir}}/sql_er_diagram.png
    echo "# SQL Entity-Relationship Diagram" > {{docdir}}/sql_er_diagram.md
    echo "" >> {{docdir}}/sql_er_diagram.md
    echo "This diagram shows the database table structure generated from the SQL DDL, including primary keys, foreign keys, and table relationships." >> {{docdir}}/sql_er_diagram.md
    echo "" >> {{docdir}}/sql_er_diagram.md
    echo "![SQL ER Diagram](sql_er_diagram.png)" >> {{docdir}}/sql_er_diagram.md
    cp {{dest}}/sqlddl/{{schema_name}}.sql {{docdir}}/{{schema_name}}.sql
    uv run gen-doc -d {{docdir}} --template-directory {{src}}/{{templatedir}} {{source_schema_path}}

# Build docs and run test server
testdoc: gendoc serve

# Run documentation server
serve:
    uv run mkdocs serve

# Deploy documentation to GitHub Pages
mkd-gh-deploy:
    uv run mkdocs gh-deploy