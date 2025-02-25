-- # Class: "NamedThing" Description: "A named entity."
--     * Slot: id Description: Unique identifier for the entity.
--     * Slot: name Description: Name or label of the entity.
-- # Class: "Fish" Description: "A representation of the zebrafish used in the toxicology study."
--     * Slot: background Description: The genetic background of the fish.
--     * Slot: allele Description: The allele present in a fish.
--     * Slot: zygosity Description: The zygosity of the fish.
--     * Slot: id Description: Unique identifier for the zebrafish.
--     * Slot: name Description: Name or label of the entity.
-- # Class: "Allele" Description: "A representation of the genetic background of the fish."
--     * Slot: name Description: Name of the allele.
--     * Slot: gene Description: The gene associated with the allele.
--     * Slot: variation_type Description: The variation_type of the allele.
--     * Slot: id Description: ZFIN identifier for the allele.
-- # Class: "Gene" Description: "A representation of a gene."
--     * Slot: name Description: Name of the gene.
--     * Slot: symbol Description: The symbol of the NamedThing.
--     * Slot: id Description: ZFIN identifier for the gene.
-- # Class: "ExposureEvent" Description: "An instance of a toxicological exposure event in the study.  According to ECTO,  an exposure"
--     * Slot: exposure_substance Description: The chemical substance used in the exposure.
--     * Slot: exposure_type Description: The exposure type.
--     * Slot: start_stage Description: The stage at which exposure starts.
--     * Slot: end_stage Description: The stage at which exposure ends.
--     * Slot: id Description: Unique identifier for the entity.
--     * Slot: name Description: Name or label of the entity.
--     * Slot: concentration_id Description: The concentration of the chemical used.
--     * Slot: duration_id Description: The duration of the exposure.
--     * Slot: frequency_id Description: The frequency of the exposure.
-- # Class: "ChemicalEntity" Description: "A chemical compound used as a toxicant in the study."
--     * Slot: name Description: Name of the chemical.
--     * Slot: id Description: CHEBI identifier for the chemical.
-- # Class: "Phenotype" Description: "A phenotype observed in the fish as a result of exposure."
--     * Slot: id Description: ZP identifier for the phenotype.
--     * Slot: name Description: Name of the phenotype.
-- # Class: "Annotation" Description: "Root class for entity annotations."
--     * Slot: id Description: 
-- # Class: "QuantityValue" Description: "A value of an attribute that is quantitative and measurable, expressed as a combination of a unit and a numeric value"
--     * Slot: id Description: 
--     * Slot: has_unit Description: The unit of the quantity value.
--     * Slot: has_numeric_value Description: The numeric value of the quantity value.
-- # Class: "Concentration" Description: "The concentration of a chemical."
--     * Slot: id Description: 
--     * Slot: has_unit Description: The unit of the concentration value.
--     * Slot: has_numeric_value Description: The numeric value of the concentration.
-- # Class: "DevelopmentalStage" Description: "A zebrafish developmental stage."
--     * Slot: name Description: Name of the developmental stage.
--     * Slot: id Description: ZFS identifier for the developmental stage.
-- # Class: "FishExposureOutcome" Description: "A representation of the phenotype observed in the fish as a result of exposure."
--     * Slot: id Description: 
--     * Slot: fish Description: The fish exposed to the toxicant.
--     * Slot: exposure_event Description: The exposure event.
-- # Class: "FishExposureOutcome_outcome" Description: ""
--     * Slot: FishExposureOutcome_id Description: Autocreated FK slot
--     * Slot: outcome_id Description: An outcome is a list of the observed phenotypes in the fish exposed to the toxicant.

CREATE TABLE "NamedThing" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "Gene" (
	name TEXT, 
	symbol TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE "ChemicalEntity" (
	name TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE "Phenotype" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "Annotation" (
	id INTEGER NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE "QuantityValue" (
	id INTEGER NOT NULL, 
	has_unit TEXT, 
	has_numeric_value TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "Concentration" (
	id INTEGER NOT NULL, 
	has_unit TEXT, 
	has_numeric_value TEXT, 
	PRIMARY KEY (id)
);
CREATE TABLE "DevelopmentalStage" (
	name TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE "Allele" (
	name TEXT, 
	gene TEXT, 
	variation_type TEXT, 
	id TEXT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(gene) REFERENCES "Gene" (id)
);
CREATE TABLE "ExposureEvent" (
	exposure_substance TEXT, 
	exposure_type VARCHAR, 
	start_stage TEXT, 
	end_stage TEXT, 
	id TEXT NOT NULL, 
	name TEXT, 
	concentration_id INTEGER, 
	duration_id INTEGER, 
	frequency_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(exposure_substance) REFERENCES "ChemicalEntity" (id), 
	FOREIGN KEY(start_stage) REFERENCES "DevelopmentalStage" (id), 
	FOREIGN KEY(end_stage) REFERENCES "DevelopmentalStage" (id), 
	FOREIGN KEY(concentration_id) REFERENCES "Concentration" (id), 
	FOREIGN KEY(duration_id) REFERENCES "QuantityValue" (id), 
	FOREIGN KEY(frequency_id) REFERENCES "QuantityValue" (id)
);
CREATE TABLE "Fish" (
	background TEXT, 
	allele TEXT, 
	zygosity TEXT, 
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(allele) REFERENCES "Allele" (id)
);
CREATE TABLE "FishExposureOutcome" (
	id INTEGER NOT NULL, 
	fish TEXT, 
	exposure_event TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(fish) REFERENCES "Fish" (id), 
	FOREIGN KEY(exposure_event) REFERENCES "ExposureEvent" (id)
);
CREATE TABLE "FishExposureOutcome_outcome" (
	"FishExposureOutcome_id" INTEGER, 
	outcome_id TEXT, 
	PRIMARY KEY ("FishExposureOutcome_id", outcome_id), 
	FOREIGN KEY("FishExposureOutcome_id") REFERENCES "FishExposureOutcome" (id), 
	FOREIGN KEY(outcome_id) REFERENCES "Phenotype" (id)
);