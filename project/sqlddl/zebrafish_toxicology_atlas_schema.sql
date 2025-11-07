-- # Abstract Class: Entity Description: The base class for all entities in the Zebrafish Toxicology Atlas Schema.
--     * Slot: uuid Description: UUID identifier.
-- # Class: Study Description: A toxicology study containing experiments.
--     * Slot: publication Description: The publication identifier (e.g., PMID, DOI) for the study, or "not published".
--     * Slot: lab Description: The lab where the experiment originated.
--     * Slot: uuid Description: UUID identifier.
-- # Class: Experiment Description: An experiment within a study.
--     * Slot: uuid Description: UUID identifier.
-- # Class: PhenotypeObservation Description: An observation of phenotypes resulting from exposure experiments.
--     * Slot: has_phenotype Description: The phenotype observed.
--     * Slot: is_control Description: Whether this is a control observation.
--     * Slot: uuid Description: UUID identifier.
-- # Class: Phenotype Description: A phenotype observed in the fish as a result of exposure.
--     * Slot: stage Description: The developmental stage.
--     * Slot: has_severity Description: The severity of the phenotype.
--     * Slot: phenotype_term_id Description: The phenotype ontology term identifier.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: has_prevalence_id Description: The prevalence of the phenotype.
-- # Class: ExposureExperiment Description: An experiment exposing fish to chemical stressors.
--     * Slot: has_subject Description: The fish subject of the exposure experiment.
--     * Slot: standard_rearing_conditions Description: Whether standard rearing conditions were used.
--     * Slot: rearing_condition_comments Description: Comments about rearing conditions.
--     * Slot: uuid Description: UUID identifier.
-- # Class: ExposureEvent Description: An instance of a toxicological exposure event in the study.
--     * Slot: has_route Description: The route of exposure.
--     * Slot: has_regimen Description: The regimen for the exposure.
--     * Slot: exposure_start_stage Description: The developmental stage at exposure start.
--     * Slot: exposure_end_stage Description: The developmental stage at exposure end.
--     * Slot: comments Description: Additional comments.
--     * Slot: exposure_type Description: The exposure type.
--     * Slot: has_additional_exposure_conditions Description: Additional exposure conditions.
--     * Slot: uuid Description: UUID identifier.
-- # Class: Regimen Description: The regimen of exposure events.
--     * Slot: repeats Description: Number of repeats in the regimen.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: interval_between_exposures_id Description: Interval between individual exposures.
--     * Slot: time_between_first_and_last_exposure_id Description: Time between first and last individual exposure.
--     * Slot: individual_exposure_duration_id Description: Individual exposure duration.
-- # Class: Stressor Description: A chemical stressor used in exposure experiments.
--     * Slot: chemical Description: Chemical identifier (CHEBI, CAS, or UUID).
--     * Slot: manufacturer Description: The manufacturer of the chemical.
--     * Slot: comments Description: Additional comments.
--     * Slot: uuid Description: UUID identifier.
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
-- # Class: Fish Description: A representation of the zebrafish used in the toxicology study.
--     * Slot: name Description: Name or label of an entity.
--     * Slot: uuid Description: UUID identifier.
-- # Class: QuantityValue Description: A value of an attribute that is quantitative and measurable, expressed as a combination of a unit and a numeric value
--     * Slot: id
--     * Slot: has_unit Description: The unit of the quantity value.
--     * Slot: has_numeric_value Description: The numeric value of the quantity value.
-- # Class: Study_has_experiments
--     * Slot: Study_uuid Description: Autocreated FK slot
--     * Slot: has_experiments_uuid Description: The experiments in this study.
-- # Class: Study_contributors
--     * Slot: Study_uuid Description: Autocreated FK slot
--     * Slot: contributors Description: The contributors of the study.
-- # Class: Experiment_has_phenotype_observations
--     * Slot: Experiment_uuid Description: Autocreated FK slot
--     * Slot: has_phenotype_observations_uuid Description: The phenotype observations from this experiment.
-- # Class: Experiment_has_controls
--     * Slot: Experiment_uuid Description: Autocreated FK slot
--     * Slot: has_controls_uuid Description: The control phenotype observations.
-- # Class: PhenotypeObservation_has_exposure_experiments
--     * Slot: PhenotypeObservation_uuid Description: Autocreated FK slot
--     * Slot: has_exposure_experiments_uuid Description: The exposure experiments for this observation.
-- # Class: PhenotypeObservation_has_images
--     * Slot: PhenotypeObservation_uuid Description: Autocreated FK slot
--     * Slot: has_images_uuid Description: Images associated with this observation.
-- # Class: ExposureExperiment_has_exposure_events
--     * Slot: ExposureExperiment_uuid Description: Autocreated FK slot
--     * Slot: has_exposure_events_uuid Description: The exposure events in this experiment.
-- # Class: ExposureEvent_has_stressor_chemicals
--     * Slot: ExposureEvent_uuid Description: Autocreated FK slot
--     * Slot: has_stressor_chemicals_uuid Description: The stressor chemicals used.
-- # Class: ExposureEvent_has_vehicles
--     * Slot: ExposureEvent_uuid Description: Autocreated FK slot
--     * Slot: has_vehicles Description: The vehicles used in the exposure.
-- # Class: ChemicalEntity_synonyms
--     * Slot: ChemicalEntity_uuid Description: Autocreated FK slot
--     * Slot: synonyms

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
CREATE TABLE "Experiment" (
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid)
);CREATE INDEX "ix_Experiment_uuid" ON "Experiment" (uuid);
CREATE TABLE "ChemicalEntity" (
	chebi_id TEXT,
	cas_id TEXT,
	chemical_name TEXT,
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid)
);CREATE INDEX "ix_ChemicalEntity_uuid" ON "ChemicalEntity" (uuid);
CREATE TABLE "Image" (
	uuid TEXT NOT NULL,
	magnification TEXT,
	resolution TEXT,
	scale_bar TEXT,
	PRIMARY KEY (uuid)
);CREATE INDEX "ix_Image_uuid" ON "Image" (uuid);
CREATE TABLE "Fish" (
	name TEXT,
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid)
);CREATE INDEX "ix_Fish_uuid" ON "Fish" (uuid);
CREATE TABLE "QuantityValue" (
	id INTEGER NOT NULL,
	has_unit TEXT,
	has_numeric_value TEXT,
	PRIMARY KEY (id)
);CREATE INDEX "ix_QuantityValue_id" ON "QuantityValue" (id);
CREATE TABLE "Phenotype" (
	stage TEXT,
	has_severity VARCHAR(8),
	phenotype_term_id TEXT,
	uuid TEXT NOT NULL,
	has_prevalence_id INTEGER,
	PRIMARY KEY (uuid),
	FOREIGN KEY(has_prevalence_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Phenotype_uuid" ON "Phenotype" (uuid);
CREATE TABLE "ExposureExperiment" (
	has_subject TEXT,
	standard_rearing_conditions BOOLEAN,
	rearing_condition_comments TEXT,
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid),
	FOREIGN KEY(has_subject) REFERENCES "Fish" (uuid)
);CREATE INDEX "ix_ExposureExperiment_uuid" ON "ExposureExperiment" (uuid);
CREATE TABLE "Regimen" (
	repeats INTEGER,
	uuid TEXT NOT NULL,
	interval_between_exposures_id INTEGER,
	time_between_first_and_last_exposure_id INTEGER,
	individual_exposure_duration_id INTEGER,
	PRIMARY KEY (uuid),
	FOREIGN KEY(interval_between_exposures_id) REFERENCES "QuantityValue" (id),
	FOREIGN KEY(time_between_first_and_last_exposure_id) REFERENCES "QuantityValue" (id),
	FOREIGN KEY(individual_exposure_duration_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Regimen_uuid" ON "Regimen" (uuid);
CREATE TABLE "Stressor" (
	chemical TEXT NOT NULL,
	manufacturer TEXT,
	comments TEXT,
	uuid TEXT NOT NULL,
	dose_id INTEGER NOT NULL,
	PRIMARY KEY (uuid),
	FOREIGN KEY(chemical) REFERENCES "ChemicalEntity" (uuid),
	FOREIGN KEY(dose_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Stressor_uuid" ON "Stressor" (uuid);
CREATE TABLE "Study_has_experiments" (
	"Study_uuid" TEXT,
	has_experiments_uuid TEXT,
	PRIMARY KEY ("Study_uuid", has_experiments_uuid),
	FOREIGN KEY("Study_uuid") REFERENCES "Study" (uuid),
	FOREIGN KEY(has_experiments_uuid) REFERENCES "Experiment" (uuid)
);CREATE INDEX "ix_Study_has_experiments_Study_uuid" ON "Study_has_experiments" ("Study_uuid");CREATE INDEX "ix_Study_has_experiments_has_experiments_uuid" ON "Study_has_experiments" (has_experiments_uuid);
CREATE TABLE "Study_contributors" (
	"Study_uuid" TEXT,
	contributors TEXT,
	PRIMARY KEY ("Study_uuid", contributors),
	FOREIGN KEY("Study_uuid") REFERENCES "Study" (uuid)
);CREATE INDEX "ix_Study_contributors_contributors" ON "Study_contributors" (contributors);CREATE INDEX "ix_Study_contributors_Study_uuid" ON "Study_contributors" ("Study_uuid");
CREATE TABLE "ChemicalEntity_synonyms" (
	"ChemicalEntity_uuid" TEXT,
	synonyms TEXT,
	PRIMARY KEY ("ChemicalEntity_uuid", synonyms),
	FOREIGN KEY("ChemicalEntity_uuid") REFERENCES "ChemicalEntity" (uuid)
);CREATE INDEX "ix_ChemicalEntity_synonyms_synonyms" ON "ChemicalEntity_synonyms" (synonyms);CREATE INDEX "ix_ChemicalEntity_synonyms_ChemicalEntity_uuid" ON "ChemicalEntity_synonyms" ("ChemicalEntity_uuid");
CREATE TABLE "PhenotypeObservation" (
	has_phenotype TEXT,
	is_control BOOLEAN,
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid),
	FOREIGN KEY(has_phenotype) REFERENCES "Phenotype" (uuid)
);CREATE INDEX "ix_PhenotypeObservation_uuid" ON "PhenotypeObservation" (uuid);
CREATE TABLE "ExposureEvent" (
	has_route VARCHAR,
	has_regimen TEXT,
	exposure_start_stage TEXT,
	exposure_end_stage TEXT,
	comments TEXT,
	exposure_type VARCHAR,
	has_additional_exposure_conditions TEXT,
	uuid TEXT NOT NULL,
	PRIMARY KEY (uuid),
	FOREIGN KEY(has_regimen) REFERENCES "Regimen" (uuid)
);CREATE INDEX "ix_ExposureEvent_uuid" ON "ExposureEvent" (uuid);
CREATE TABLE "Experiment_has_phenotype_observations" (
	"Experiment_uuid" TEXT,
	has_phenotype_observations_uuid TEXT,
	PRIMARY KEY ("Experiment_uuid", has_phenotype_observations_uuid),
	FOREIGN KEY("Experiment_uuid") REFERENCES "Experiment" (uuid),
	FOREIGN KEY(has_phenotype_observations_uuid) REFERENCES "PhenotypeObservation" (uuid)
);CREATE INDEX "ix_Experiment_has_phenotype_observations_has_phenotype_observations_uuid" ON "Experiment_has_phenotype_observations" (has_phenotype_observations_uuid);CREATE INDEX "ix_Experiment_has_phenotype_observations_Experiment_uuid" ON "Experiment_has_phenotype_observations" ("Experiment_uuid");
CREATE TABLE "Experiment_has_controls" (
	"Experiment_uuid" TEXT,
	has_controls_uuid TEXT,
	PRIMARY KEY ("Experiment_uuid", has_controls_uuid),
	FOREIGN KEY("Experiment_uuid") REFERENCES "Experiment" (uuid),
	FOREIGN KEY(has_controls_uuid) REFERENCES "PhenotypeObservation" (uuid)
);CREATE INDEX "ix_Experiment_has_controls_Experiment_uuid" ON "Experiment_has_controls" ("Experiment_uuid");CREATE INDEX "ix_Experiment_has_controls_has_controls_uuid" ON "Experiment_has_controls" (has_controls_uuid);
CREATE TABLE "PhenotypeObservation_has_exposure_experiments" (
	"PhenotypeObservation_uuid" TEXT,
	has_exposure_experiments_uuid TEXT,
	PRIMARY KEY ("PhenotypeObservation_uuid", has_exposure_experiments_uuid),
	FOREIGN KEY("PhenotypeObservation_uuid") REFERENCES "PhenotypeObservation" (uuid),
	FOREIGN KEY(has_exposure_experiments_uuid) REFERENCES "ExposureExperiment" (uuid)
);CREATE INDEX "ix_PhenotypeObservation_has_exposure_experiments_has_exposure_experiments_uuid" ON "PhenotypeObservation_has_exposure_experiments" (has_exposure_experiments_uuid);CREATE INDEX "ix_PhenotypeObservation_has_exposure_experiments_PhenotypeObservation_uuid" ON "PhenotypeObservation_has_exposure_experiments" ("PhenotypeObservation_uuid");
CREATE TABLE "PhenotypeObservation_has_images" (
	"PhenotypeObservation_uuid" TEXT,
	has_images_uuid TEXT,
	PRIMARY KEY ("PhenotypeObservation_uuid", has_images_uuid),
	FOREIGN KEY("PhenotypeObservation_uuid") REFERENCES "PhenotypeObservation" (uuid),
	FOREIGN KEY(has_images_uuid) REFERENCES "Image" (uuid)
);CREATE INDEX "ix_PhenotypeObservation_has_images_PhenotypeObservation_uuid" ON "PhenotypeObservation_has_images" ("PhenotypeObservation_uuid");CREATE INDEX "ix_PhenotypeObservation_has_images_has_images_uuid" ON "PhenotypeObservation_has_images" (has_images_uuid);
CREATE TABLE "ExposureExperiment_has_exposure_events" (
	"ExposureExperiment_uuid" TEXT,
	has_exposure_events_uuid TEXT,
	PRIMARY KEY ("ExposureExperiment_uuid", has_exposure_events_uuid),
	FOREIGN KEY("ExposureExperiment_uuid") REFERENCES "ExposureExperiment" (uuid),
	FOREIGN KEY(has_exposure_events_uuid) REFERENCES "ExposureEvent" (uuid)
);CREATE INDEX "ix_ExposureExperiment_has_exposure_events_has_exposure_events_uuid" ON "ExposureExperiment_has_exposure_events" (has_exposure_events_uuid);CREATE INDEX "ix_ExposureExperiment_has_exposure_events_ExposureExperiment_uuid" ON "ExposureExperiment_has_exposure_events" ("ExposureExperiment_uuid");
CREATE TABLE "ExposureEvent_has_stressor_chemicals" (
	"ExposureEvent_uuid" TEXT,
	has_stressor_chemicals_uuid TEXT,
	PRIMARY KEY ("ExposureEvent_uuid", has_stressor_chemicals_uuid),
	FOREIGN KEY("ExposureEvent_uuid") REFERENCES "ExposureEvent" (uuid),
	FOREIGN KEY(has_stressor_chemicals_uuid) REFERENCES "Stressor" (uuid)
);CREATE INDEX "ix_ExposureEvent_has_stressor_chemicals_ExposureEvent_uuid" ON "ExposureEvent_has_stressor_chemicals" ("ExposureEvent_uuid");CREATE INDEX "ix_ExposureEvent_has_stressor_chemicals_has_stressor_chemicals_uuid" ON "ExposureEvent_has_stressor_chemicals" (has_stressor_chemicals_uuid);
CREATE TABLE "ExposureEvent_has_vehicles" (
	"ExposureEvent_uuid" TEXT,
	has_vehicles VARCHAR(10),
	PRIMARY KEY ("ExposureEvent_uuid", has_vehicles),
	FOREIGN KEY("ExposureEvent_uuid") REFERENCES "ExposureEvent" (uuid)
);CREATE INDEX "ix_ExposureEvent_has_vehicles_ExposureEvent_uuid" ON "ExposureEvent_has_vehicles" ("ExposureEvent_uuid");CREATE INDEX "ix_ExposureEvent_has_vehicles_has_vehicles" ON "ExposureEvent_has_vehicles" (has_vehicles);

