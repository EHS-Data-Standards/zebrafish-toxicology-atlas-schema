-- # Abstract Class: Entity Description: The base class for all entities in the Zebrafish Toxicology Atlas Schema.
--     * Slot: uuid Description: UUID identifier.
-- # Class: Study Description: A toxicology study containing experiments.
--     * Slot: publication Description: The publication identifier (e.g., PMID, DOI) for the study, or "not published".
--     * Slot: lab Description: The lab where the experiment originated.
--     * Slot: uuid Description: UUID identifier.
-- # Class: Experiment Description: An experiment within a study.
--     * Slot: control Description: Whether this is a control observation.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: Study_uuid Description: Autocreated FK slot
-- # Class: PhenotypeObservation Description: An observation of phenotypes resulting from exposure experiments.
--     * Slot: control Description: Whether this is a control observation.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: Experiment_uuid Description: Autocreated FK slot
--     * Slot: exposure_experiment_uuid Description: The exposure experiments for this observation.
-- # Class: Phenotype Description: A phenotype observed in the fish as a result of exposure.
--     * Slot: stage Description: The developmental stage.
--     * Slot: severity Description: The severity of the phenotype.
--     * Slot: phenotype_term_id Description: The phenotype ontology term identifier.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: PhenotypeObservation_uuid Description: Autocreated FK slot
--     * Slot: prevalence_id Description: The prevalence of the phenotype.
-- # Class: ExposureExperiment Description: An experiment exposing fish to chemical stressors.
--     * Slot: standard_rearing_conditions Description: Whether standard rearing conditions were used.
--     * Slot: rearing_condition_comments Description: Comments about rearing conditions.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: subject_uuid Description: The fish subject of the exposure experiment.
-- # Class: ExposureEvent Description: An instance of a toxicological exposure event in the study.
--     * Slot: route Description: The route of exposure.
--     * Slot: exposure_start_stage Description: The developmental stage at exposure start.
--     * Slot: exposure_end_stage Description: The developmental stage at exposure end.
--     * Slot: comments Description: Additional comments.
--     * Slot: exposure_type Description: The exposure type.
--     * Slot: additional_exposure_conditions Description: Additional exposure conditions.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: ExposureExperiment_uuid Description: Autocreated FK slot
--     * Slot: regimen_uuid Description: The regimen for the exposure.
-- # Class: Regimen Description: The regimen of exposure events.
--     * Slot: exposure_regimen_type Description: The type of exposure regimen (e.g., continuous or repeated).
--     * Slot: number_of_repeats Description: Number of repeats in the regimen.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: interval_between_exposures_id Description: Interval between individual exposures.
--     * Slot: time_between_first_and_last_exposure_id Description: Time between first and last individual exposure.
--     * Slot: individual_exposure_duration_id Description: Individual exposure duration.
-- # Class: Stressor Description: A chemical stressor used in exposure experiments.
--     * Slot: manufacturer Description: The manufacturer of the chemical.
--     * Slot: comments Description: Additional comments.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: ExposureEvent_uuid Description: Autocreated FK slot
--     * Slot: chemical_uuid Description: Chemical identifier (CHEBI, CAS, or UUID).
--     * Slot: dose_id Description: The dose of the chemical.
-- # Class: ChemicalEntity Description: A chemical compound used as a toxicant in the study.
--     * Slot: chebi_id Description: CHEBI identifier for the chemical.
--     * Slot: cas_id Description: CAS identifier for the chemical.
--     * Slot: chemical_name Description: Name of the chemical.
--     * Slot: uuid Description: UUID identifier.
-- # Class: Image Description: An image associated with a phenotype observation.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: magnification Description: The magnification of the image.
--     * Slot: resolution Description: The resolution of the image.
--     * Slot: scale_bar Description: Scale bar information.
--     * Slot: PhenotypeObservation_uuid Description: Autocreated FK slot
-- # Class: Fish Description: A representation of the zebrafish used in the toxicology study.
--     * Slot: name Description: Name or label of an entity.
--     * Slot: id
--     * Slot: uuid Description: UUID identifier.
-- # Class: QuantityValue Description: A value of an attribute that is quantitative and measurable, expressed as a combination of a unit and a numeric value
--     * Slot: id
--     * Slot: unit Description: The unit of the quantity value.
--     * Slot: numeric_value Description: The numeric value of the quantity value.
-- # Class: Study_contributor
--     * Slot: Study_uuid Description: Autocreated FK slot
--     * Slot: contributor Description: The contributors of the study.
-- # Class: ExposureEvent_vehicle
--     * Slot: ExposureEvent_uuid Description: Autocreated FK slot
--     * Slot: vehicle Description: The vehicles used in the exposure.
-- # Class: ChemicalEntity_synonym
--     * Slot: ChemicalEntity_uuid Description: Autocreated FK slot
--     * Slot: synonym

CREATE TABLE "Entity" (
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid)
);CREATE INDEX "ix_Entity_uuid" ON "Entity" (uuid);
CREATE TABLE "Study" (
	publication TEXT,
	lab TEXT,
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid)
);CREATE INDEX "ix_Study_uuid" ON "Study" (uuid);
CREATE TABLE "ChemicalEntity" (
	chebi_id TEXT,
	cas_id TEXT,
	chemical_name TEXT,
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid)
);CREATE INDEX "ix_ChemicalEntity_uuid" ON "ChemicalEntity" (uuid);
CREATE TABLE "Fish" (
	name TEXT NOT NULL,
	id TEXT NOT NULL,
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid)
);CREATE INDEX "ix_Fish_uuid" ON "Fish" (uuid);
CREATE TABLE "QuantityValue" (
	id INTEGER NOT NULL,
	unit TEXT,
	numeric_value TEXT,
	PRIMARY KEY (id)
);CREATE INDEX "ix_QuantityValue_id" ON "QuantityValue" (id);
CREATE TABLE "Experiment" (
	control BOOLEAN,
	uuid TEXT NOT NULL,
	"Study_uuid" TEXT,
	PRIMARY KEY (uuid),
	FOREIGN KEY("Study_uuid") REFERENCES "Study" (uuid)
);CREATE INDEX "ix_Experiment_uuid" ON "Experiment" (uuid);
CREATE TABLE "ExposureExperiment" (
	standard_rearing_conditions BOOLEAN,
	rearing_condition_comments TEXT,
	uuid TEXT NOT NULL,
	subject_uuid TEXT,
	PRIMARY KEY (uuid),
	FOREIGN KEY(subject_uuid) REFERENCES "Fish" (uuid)
);CREATE INDEX "ix_ExposureExperiment_uuid" ON "ExposureExperiment" (uuid);
CREATE TABLE "Regimen" (
	exposure_regimen_type VARCHAR(10),
	number_of_repeats INTEGER,
	uuid TEXT NOT NULL,
	interval_between_exposures_id INTEGER,
	time_between_first_and_last_exposure_id INTEGER,
	individual_exposure_duration_id INTEGER,
	PRIMARY KEY (uuid),
	FOREIGN KEY(interval_between_exposures_id) REFERENCES "QuantityValue" (id),
	FOREIGN KEY(time_between_first_and_last_exposure_id) REFERENCES "QuantityValue" (id),
	FOREIGN KEY(individual_exposure_duration_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Regimen_uuid" ON "Regimen" (uuid);
CREATE TABLE "Study_contributor" (
	"Study_uuid" TEXT,
	contributor TEXT,
	PRIMARY KEY ("Study_uuid", contributor),
	FOREIGN KEY("Study_uuid") REFERENCES "Study" (uuid)
);CREATE INDEX "ix_Study_contributor_Study_uuid" ON "Study_contributor" ("Study_uuid");CREATE INDEX "ix_Study_contributor_contributor" ON "Study_contributor" (contributor);
CREATE TABLE "ChemicalEntity_synonym" (
	"ChemicalEntity_uuid" TEXT,
	synonym TEXT,
	PRIMARY KEY ("ChemicalEntity_uuid", synonym),
	FOREIGN KEY("ChemicalEntity_uuid") REFERENCES "ChemicalEntity" (uuid)
);CREATE INDEX "ix_ChemicalEntity_synonym_ChemicalEntity_uuid" ON "ChemicalEntity_synonym" ("ChemicalEntity_uuid");CREATE INDEX "ix_ChemicalEntity_synonym_synonym" ON "ChemicalEntity_synonym" (synonym);
CREATE TABLE "PhenotypeObservation" (
	control BOOLEAN,
	uuid TEXT NOT NULL,
	"Experiment_uuid" TEXT,
	exposure_experiment_uuid TEXT,
	PRIMARY KEY (uuid),
	FOREIGN KEY("Experiment_uuid") REFERENCES "Experiment" (uuid),
	FOREIGN KEY(exposure_experiment_uuid) REFERENCES "ExposureExperiment" (uuid)
);CREATE INDEX "ix_PhenotypeObservation_uuid" ON "PhenotypeObservation" (uuid);
CREATE TABLE "ExposureEvent" (
	route VARCHAR,
	exposure_start_stage TEXT,
	exposure_end_stage TEXT,
	comments TEXT,
	exposure_type VARCHAR,
	additional_exposure_conditions TEXT,
	uuid TEXT NOT NULL,
	"ExposureExperiment_uuid" TEXT,
	regimen_uuid TEXT,
	PRIMARY KEY (uuid),
	FOREIGN KEY("ExposureExperiment_uuid") REFERENCES "ExposureExperiment" (uuid),
	FOREIGN KEY(regimen_uuid) REFERENCES "Regimen" (uuid)
);CREATE INDEX "ix_ExposureEvent_uuid" ON "ExposureEvent" (uuid);
CREATE TABLE "Phenotype" (
	stage TEXT,
	severity VARCHAR(8),
	phenotype_term_id TEXT,
	uuid TEXT NOT NULL,
	"PhenotypeObservation_uuid" TEXT,
	prevalence_id INTEGER,
	PRIMARY KEY (uuid),
	FOREIGN KEY("PhenotypeObservation_uuid") REFERENCES "PhenotypeObservation" (uuid),
	FOREIGN KEY(prevalence_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Phenotype_uuid" ON "Phenotype" (uuid);
CREATE TABLE "Stressor" (
	manufacturer TEXT,
	comments TEXT,
	uuid TEXT NOT NULL,
	"ExposureEvent_uuid" TEXT,
	chemical_uuid TEXT NOT NULL,
	dose_id INTEGER NOT NULL,
	PRIMARY KEY (uuid),
	FOREIGN KEY("ExposureEvent_uuid") REFERENCES "ExposureEvent" (uuid),
	FOREIGN KEY(chemical_uuid) REFERENCES "ChemicalEntity" (uuid),
	FOREIGN KEY(dose_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Stressor_uuid" ON "Stressor" (uuid);
CREATE TABLE "Image" (
	uuid TEXT NOT NULL,
	magnification TEXT,
	resolution TEXT,
	scale_bar TEXT,
	"PhenotypeObservation_uuid" TEXT,
	PRIMARY KEY (uuid),
	FOREIGN KEY("PhenotypeObservation_uuid") REFERENCES "PhenotypeObservation" (uuid)
);CREATE INDEX "ix_Image_uuid" ON "Image" (uuid);
CREATE TABLE "ExposureEvent_vehicle" (
	"ExposureEvent_uuid" TEXT,
	vehicle VARCHAR(10),
	PRIMARY KEY ("ExposureEvent_uuid", vehicle),
	FOREIGN KEY("ExposureEvent_uuid") REFERENCES "ExposureEvent" (uuid)
);CREATE INDEX "ix_ExposureEvent_vehicle_ExposureEvent_uuid" ON "ExposureEvent_vehicle" ("ExposureEvent_uuid");CREATE INDEX "ix_ExposureEvent_vehicle_vehicle" ON "ExposureEvent_vehicle" (vehicle);

