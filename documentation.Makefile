RUN = poetry run
DOCDIR = docs

$(DOCDIR):
	mkdir -p $@

gendoc: $(DOCDIR)
	$(RUN) gen-doc -d $(DOCDIR) $(SOURCE_SCHEMA_PATH)
	# DO NOT REMOVE: these cp statements are crucial to maintain the w3 ids for the model artifacts
	cp $(DEST)/owl/zebrafish_toxicology_atlas_schema.owl.ttl $(DOCDIR)/zebrafish_toxicology_atlas_schema.owl.ttl ; \
	cp $(DEST)/jsonld/zebrafish_toxicology_atlas_schema.context.jsonld $(DOCDIR)/zebrafish_toxicology_atlas_schema.context.jsonld ; \
	cp $(DEST)/jsonld/zebrafish_toxicology_atlas_schema.context.jsonld $(DOCDIR)/context.jsonld ; \
	cp $(DEST)/jsonld/zebrafish_toxicology_atlas_schema.jsonld $(DOCDIR)/zebrafish_toxicology_atlas_schema.jsonld ; \
	cp $(DEST)/jsonschema/zebrafish_toxicology_atlas_schema.schema.json $(DOCDIR)/zebrafish_toxicology_atlas_schema.json ; \
	cp $(DEST)/graphql/zebrafish_toxicology_atlas_schema.graphql $(DOCDIR)/zebrafish_toxicology_atlas_schema.graphql ; \
	cp $(DEST)/shex/zebrafish_toxicology_atlas_schema.shex $(DOCDIR)/zebrafish_toxicology_atlas_scheman.shex ; \
	cp $(DEST)/shacl/zebrafish_toxicology_atlas_schema.shacl.ttl $(DOCDIR)/zebrafish_toxicology_atlas_schema.shacl.ttl ; \
	cp $(SRC)/schema/zebrafish_toxicology_atlas_schema.yaml $(DOCDIR) ; \
	cp $(SRC)/zebrafish_toxicology_atlas_schema/schema/zebrafish_toxicology_atlas_schema.yaml $(DOCDIR) ; \
	cp -r $(SRC)/docs/* $(DOCDIR) ; \
	cp -r $(SRC)/docs/images $(DOCDIR)/images ; \
	# the .json cp here is the data required for the d3 visualizations
	# this supports the display of our d3 visualizations
	cp $(SRC)/docs/*.css $(DOCDIR) ; \
	$(RUN) gen-doc -d $(DOCDIR) --template-directory $(SRC)/$(TEMPLATEDIR) $(SOURCE_SCHEMA_PATH)

testdoc: gendoc serve

# Test documentation locally
serve: mkd-serve

MKDOCS = $(RUN) mkdocs
mkd-%:
	$(MKDOCS) $*