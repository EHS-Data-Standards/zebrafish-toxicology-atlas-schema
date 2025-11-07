-- # Abstract Class: Entity Description: The base class for all entities in the Zebrafish Toxicology Atlas Schema.
--     * Slot: id
-- # Class: Study Description: A toxicology study containing experiments.
--     * Slot: publication Description: The publication identifier (e.g., PMID, DOI) for the study, or "not published".
--     * Slot: lab Description: The lab where the experiment originated.
--     * Slot: id
-- # Class: Experiment Description: An experiment within a study.
--     * Slot: id
-- # Class: PhenotypeObservation Description: An observation of phenotypes resulting from exposure experiments.
--     * Slot: has_phenotype Description: The phenotype observed.
--     * Slot: is_control Description: Whether this is a control observation.
--     * Slot: id
-- # Class: Phenotype Description: A phenotype observed in the fish as a result of exposure.
--     * Slot: stage Description: The developmental stage.
--     * Slot: has_severity Description: The severity of the phenotype.
--     * Slot: phenotype_term_id Description: The phenotype ontology term identifier.
--     * Slot: id
--     * Slot: has_prevalence_id Description: The prevalence of the phenotype.
-- # Class: ExposureExperiment Description: An experiment exposing fish to chemical stressors.
--     * Slot: has_subject Description: The fish subject of the exposure experiment.
--     * Slot: standard_rearing_conditions Description: Whether standard rearing conditions were used.
--     * Slot: rearing_condition_comments Description: Comments about rearing conditions.
--     * Slot: id
-- # Class: ExposureEvent Description: An instance of a toxicological exposure event in the study.
--     * Slot: has_route Description: The route of exposure.
--     * Slot: has_regimen Description: The regimen for the exposure.
--     * Slot: exposure_start_stage Description: The developmental stage at exposure start.
--     * Slot: exposure_end_stage Description: The developmental stage at exposure end.
--     * Slot: comments Description: Additional comments.
--     * Slot: exposure_type Description: The exposure type.
--     * Slot: has_additional_exposure_conditions Description: Additional exposure conditions.
--     * Slot: id
-- # Class: Regimen Description: The regimen of exposure events.
--     * Slot: repeats Description: Number of repeats in the regimen.
--     * Slot: id
--     * Slot: interval_between_exposures_id Description: Interval between individual exposures.
--     * Slot: time_between_first_and_last_exposure_id Description: Time between first and last individual exposure.
--     * Slot: individual_exposure_duration_id Description: Individual exposure duration.
-- # Class: Stressor Description: A chemical stressor used in exposure experiments.
--     * Slot: chemical Description: Chemical identifier (CHEBI, CAS, or UUID).
--     * Slot: manufacturer Description: The manufacturer of the chemical.
--     * Slot: comments Description: Additional comments.
--     * Slot: id
--     * Slot: dose_id Description: The dose of the chemical.
-- # Class: ChemicalEntity Description: A chemical compound used as a toxicant in the study.
--     * Slot: chebi_id Description: CHEBI identifier for the chemical.
--     * Slot: cas_id Description: CAS identifier for the chemical.
--     * Slot: chemical_name Description: Name of the chemical.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: id
-- # Class: Image Description: An image associated with a phenotype observation.
--     * Slot: uuid Description: UUID identifier.
--     * Slot: magnification Description: The magnification of the image.
--     * Slot: resolution Description: The resolution of the image.
--     * Slot: scale_bar Description: Scale bar information.
--     * Slot: id
-- # Class: Fish Description: A representation of the zebrafish used in the toxicology study.
--     * Slot: name Description: Name or label of an entity.
--     * Slot: id
-- # Class: QuantityValue Description: A value of an attribute that is quantitative and measurable, expressed as a combination of a unit and a numeric value
--     * Slot: id
--     * Slot: has_unit Description: The unit of the quantity value.
--     * Slot: has_numeric_value Description: The numeric value of the quantity value.
-- # Class: Study_has_experiments
--     * Slot: Study_id Description: Autocreated FK slot
--     * Slot: has_experiments_id Description: The experiments in this study.
-- # Class: Study_contributors
--     * Slot: Study_id Description: Autocreated FK slot
--     * Slot: contributors Description: The contributors of the study.
-- # Class: Experiment_has_phenotype_observations
--     * Slot: Experiment_id Description: Autocreated FK slot
--     * Slot: has_phenotype_observations_id Description: The phenotype observations from this experiment.
-- # Class: Experiment_has_controls
--     * Slot: Experiment_id Description: Autocreated FK slot
--     * Slot: has_controls_id Description: The control phenotype observations.
-- # Class: PhenotypeObservation_has_exposure_experiments
--     * Slot: PhenotypeObservation_id Description: Autocreated FK slot
--     * Slot: has_exposure_experiments_id Description: The exposure experiments for this observation.
-- # Class: PhenotypeObservation_has_images
--     * Slot: PhenotypeObservation_id Description: Autocreated FK slot
--     * Slot: has_images_id Description: Images associated with this observation.
-- # Class: ExposureExperiment_has_exposure_events
--     * Slot: ExposureExperiment_id Description: Autocreated FK slot
--     * Slot: has_exposure_events_id Description: The exposure events in this experiment.
-- # Class: ExposureEvent_has_stressor_chemicals
--     * Slot: ExposureEvent_id Description: Autocreated FK slot
--     * Slot: has_stressor_chemicals_id Description: The stressor chemicals used.
-- # Class: ExposureEvent_has_vehicles
--     * Slot: ExposureEvent_id Description: Autocreated FK slot
--     * Slot: has_vehicles Description: The vehicles used in the exposure.
-- # Class: ChemicalEntity_synonyms
--     * Slot: ChemicalEntity_id Description: Autocreated FK slot
--     * Slot: synonyms

CREATE TABLE "Entity" (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);CREATE INDEX "ix_Entity_id" ON "Entity" (id);
CREATE TABLE "Study" (
	publication TEXT,
	lab TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);CREATE INDEX "ix_Study_id" ON "Study" (id);
CREATE TABLE "Experiment" (
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);CREATE INDEX "ix_Experiment_id" ON "Experiment" (id);
CREATE TABLE "ChemicalEntity" (
	chebi_id TEXT,
	cas_id TEXT,
	chemical_name TEXT,
	uuid TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);CREATE INDEX "ix_ChemicalEntity_id" ON "ChemicalEntity" (id);
CREATE TABLE "Image" (
	uuid TEXT,
	magnification TEXT,
	resolution TEXT,
	scale_bar TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);CREATE INDEX "ix_Image_id" ON "Image" (id);
CREATE TABLE "Fish" (
	name TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id)
);CREATE INDEX "ix_Fish_id" ON "Fish" (id);
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
	id TEXT NOT NULL,
	has_prevalence_id INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY(has_prevalence_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Phenotype_id" ON "Phenotype" (id);
CREATE TABLE "ExposureExperiment" (
	has_subject TEXT,
	standard_rearing_conditions BOOLEAN,
	rearing_condition_comments TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(has_subject) REFERENCES "Fish" (id)
);CREATE INDEX "ix_ExposureExperiment_id" ON "ExposureExperiment" (id);
CREATE TABLE "Regimen" (
	repeats INTEGER,
	id TEXT NOT NULL,
	interval_between_exposures_id INTEGER,
	time_between_first_and_last_exposure_id INTEGER,
	individual_exposure_duration_id INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY(interval_between_exposures_id) REFERENCES "QuantityValue" (id),
	FOREIGN KEY(time_between_first_and_last_exposure_id) REFERENCES "QuantityValue" (id),
	FOREIGN KEY(individual_exposure_duration_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Regimen_id" ON "Regimen" (id);
CREATE TABLE "Stressor" (
	chemical TEXT NOT NULL,
	manufacturer TEXT,
	comments TEXT,
	id TEXT NOT NULL,
	dose_id INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(chemical) REFERENCES "ChemicalEntity" (id),
	FOREIGN KEY(dose_id) REFERENCES "QuantityValue" (id)
);CREATE INDEX "ix_Stressor_id" ON "Stressor" (id);
CREATE TABLE "Study_has_experiments" (
	"Study_id" TEXT,
	has_experiments_id TEXT,
	PRIMARY KEY ("Study_id", has_experiments_id),
	FOREIGN KEY("Study_id") REFERENCES "Study" (id),
	FOREIGN KEY(has_experiments_id) REFERENCES "Experiment" (id)
);CREATE INDEX "ix_Study_has_experiments_has_experiments_id" ON "Study_has_experiments" (has_experiments_id);CREATE INDEX "ix_Study_has_experiments_Study_id" ON "Study_has_experiments" ("Study_id");
CREATE TABLE "Study_contributors" (
	"Study_id" TEXT,
	contributors TEXT,
	PRIMARY KEY ("Study_id", contributors),
	FOREIGN KEY("Study_id") REFERENCES "Study" (id)
);CREATE INDEX "ix_Study_contributors_Study_id" ON "Study_contributors" ("Study_id");CREATE INDEX "ix_Study_contributors_contributors" ON "Study_contributors" (contributors);
CREATE TABLE "ChemicalEntity_synonyms" (
	"ChemicalEntity_id" TEXT,
	synonyms TEXT,
	PRIMARY KEY ("ChemicalEntity_id", synonyms),
	FOREIGN KEY("ChemicalEntity_id") REFERENCES "ChemicalEntity" (id)
);CREATE INDEX "ix_ChemicalEntity_synonyms_synonyms" ON "ChemicalEntity_synonyms" (synonyms);CREATE INDEX "ix_ChemicalEntity_synonyms_ChemicalEntity_id" ON "ChemicalEntity_synonyms" ("ChemicalEntity_id");
CREATE TABLE "PhenotypeObservation" (
	has_phenotype TEXT,
	is_control BOOLEAN,
	id TEXT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(has_phenotype) REFERENCES "Phenotype" (id)
);CREATE INDEX "ix_PhenotypeObservation_id" ON "PhenotypeObservation" (id);
CREATE TABLE "ExposureEvent" (
	has_route VARCHAR,
	has_regimen TEXT,
	exposure_start_stage TEXT,
	exposure_end_stage TEXT,
	comments TEXT,
	exposure_type VARCHAR,
	has_additional_exposure_conditions TEXT,
	id TEXT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(has_regimen) REFERENCES "Regimen" (id)
);CREATE INDEX "ix_ExposureEvent_id" ON "ExposureEvent" (id);
CREATE TABLE "Experiment_has_phenotype_observations" (
	"Experiment_id" TEXT,
	has_phenotype_observations_id TEXT,
	PRIMARY KEY ("Experiment_id", has_phenotype_observations_id),
	FOREIGN KEY("Experiment_id") REFERENCES "Experiment" (id),
	FOREIGN KEY(has_phenotype_observations_id) REFERENCES "PhenotypeObservation" (id)
);CREATE INDEX "ix_Experiment_has_phenotype_observations_has_phenotype_observations_id" ON "Experiment_has_phenotype_observations" (has_phenotype_observations_id);CREATE INDEX "ix_Experiment_has_phenotype_observations_Experiment_id" ON "Experiment_has_phenotype_observations" ("Experiment_id");
CREATE TABLE "Experiment_has_controls" (
	"Experiment_id" TEXT,
	has_controls_id TEXT,
	PRIMARY KEY ("Experiment_id", has_controls_id),
	FOREIGN KEY("Experiment_id") REFERENCES "Experiment" (id),
	FOREIGN KEY(has_controls_id) REFERENCES "PhenotypeObservation" (id)
);CREATE INDEX "ix_Experiment_has_controls_has_controls_id" ON "Experiment_has_controls" (has_controls_id);CREATE INDEX "ix_Experiment_has_controls_Experiment_id" ON "Experiment_has_controls" ("Experiment_id");
CREATE TABLE "PhenotypeObservation_has_exposure_experiments" (
	"PhenotypeObservation_id" TEXT,
	has_exposure_experiments_id TEXT,
	PRIMARY KEY ("PhenotypeObservation_id", has_exposure_experiments_id),
	FOREIGN KEY("PhenotypeObservation_id") REFERENCES "PhenotypeObservation" (id),
	FOREIGN KEY(has_exposure_experiments_id) REFERENCES "ExposureExperiment" (id)
);CREATE INDEX "ix_PhenotypeObservation_has_exposure_experiments_has_exposure_experiments_id" ON "PhenotypeObservation_has_exposure_experiments" (has_exposure_experiments_id);CREATE INDEX "ix_PhenotypeObservation_has_exposure_experiments_PhenotypeObservation_id" ON "PhenotypeObservation_has_exposure_experiments" ("PhenotypeObservation_id");
CREATE TABLE "PhenotypeObservation_has_images" (
	"PhenotypeObservation_id" TEXT,
	has_images_id TEXT,
	PRIMARY KEY ("PhenotypeObservation_id", has_images_id),
	FOREIGN KEY("PhenotypeObservation_id") REFERENCES "PhenotypeObservation" (id),
	FOREIGN KEY(has_images_id) REFERENCES "Image" (id)
);CREATE INDEX "ix_PhenotypeObservation_has_images_PhenotypeObservation_id" ON "PhenotypeObservation_has_images" ("PhenotypeObservation_id");CREATE INDEX "ix_PhenotypeObservation_has_images_has_images_id" ON "PhenotypeObservation_has_images" (has_images_id);
CREATE TABLE "ExposureExperiment_has_exposure_events" (
	"ExposureExperiment_id" TEXT,
	has_exposure_events_id TEXT,
	PRIMARY KEY ("ExposureExperiment_id", has_exposure_events_id),
	FOREIGN KEY("ExposureExperiment_id") REFERENCES "ExposureExperiment" (id),
	FOREIGN KEY(has_exposure_events_id) REFERENCES "ExposureEvent" (id)
);CREATE INDEX "ix_ExposureExperiment_has_exposure_events_has_exposure_events_id" ON "ExposureExperiment_has_exposure_events" (has_exposure_events_id);CREATE INDEX "ix_ExposureExperiment_has_exposure_events_ExposureExperiment_id" ON "ExposureExperiment_has_exposure_events" ("ExposureExperiment_id");
CREATE TABLE "ExposureEvent_has_stressor_chemicals" (
	"ExposureEvent_id" TEXT,
	has_stressor_chemicals_id TEXT,
	PRIMARY KEY ("ExposureEvent_id", has_stressor_chemicals_id),
	FOREIGN KEY("ExposureEvent_id") REFERENCES "ExposureEvent" (id),
	FOREIGN KEY(has_stressor_chemicals_id) REFERENCES "Stressor" (id)
);CREATE INDEX "ix_ExposureEvent_has_stressor_chemicals_has_stressor_chemicals_id" ON "ExposureEvent_has_stressor_chemicals" (has_stressor_chemicals_id);CREATE INDEX "ix_ExposureEvent_has_stressor_chemicals_ExposureEvent_id" ON "ExposureEvent_has_stressor_chemicals" ("ExposureEvent_id");
CREATE TABLE "ExposureEvent_has_vehicles" (
	"ExposureEvent_id" TEXT,
	has_vehicles VARCHAR(10),
	PRIMARY KEY ("ExposureEvent_id", has_vehicles),
	FOREIGN KEY("ExposureEvent_id") REFERENCES "ExposureEvent" (id)
);CREATE INDEX "ix_ExposureEvent_has_vehicles_ExposureEvent_id" ON "ExposureEvent_has_vehicles" ("ExposureEvent_id");CREATE INDEX "ix_ExposureEvent_has_vehicles_has_vehicles" ON "ExposureEvent_has_vehicles" (has_vehicles);

