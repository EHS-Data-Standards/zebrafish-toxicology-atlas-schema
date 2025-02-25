# Auto generated from zebrafish_toxicology_atlas_schema.yaml by pythongen.py version: 0.0.1
# Generation date: 2025-02-24T17:30:31
# Schema: zebrafish-toxicology-atlas-schema
#
# id: https://w3id.org/sierra-moxon/zebrafish-toxicology-atlas-schema
# description: Schema to represent metadata associated with the Zebrafish Toxicology Atlas
# license: MIT

import dataclasses
import re
from dataclasses import dataclass
from datetime import (
    date,
    datetime,
    time
)
from typing import (
    Any,
    ClassVar,
    Dict,
    List,
    Optional,
    Union
)

from jsonasobj2 import (
    JsonObj,
    as_dict
)
from linkml_runtime.linkml_model.meta import (
    EnumDefinition,
    PermissibleValue,
    PvFormulaOptions
)
from linkml_runtime.utils.curienamespace import CurieNamespace
from linkml_runtime.utils.dataclass_extensions_376 import dataclasses_init_fn_with_kwargs
from linkml_runtime.utils.enumerations import EnumDefinitionImpl
from linkml_runtime.utils.formatutils import (
    camelcase,
    sfx,
    underscore
)
from linkml_runtime.utils.metamodelcore import (
    bnode,
    empty_dict,
    empty_list
)
from linkml_runtime.utils.slot import Slot
from linkml_runtime.utils.yamlutils import (
    YAMLRoot,
    extended_float,
    extended_int,
    extended_str
)
from rdflib import (
    Namespace,
    URIRef
)

from linkml_runtime.linkml_model.types import String, Uriorcurie
from linkml_runtime.utils.metamodelcore import URIorCURIE

metamodel_version = "1.7.0"
version = None

# Overwrite dataclasses _init_fn to add **kwargs in __init__
dataclasses._init_fn = dataclasses_init_fn_with_kwargs

# Namespaces
PATO = CurieNamespace('PATO', 'http://purl.obolibrary.org/obo/PATO_')
BIOLINK = CurieNamespace('biolink', 'https://w3id.org/biolink/')
EXAMPLE = CurieNamespace('example', 'https://example.org/')
LINKML = CurieNamespace('linkml', 'https://w3id.org/linkml/')
SCHEMA = CurieNamespace('schema', 'http://schema.org/')
ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA = CurieNamespace('zebrafish_toxicology_atlas_schema', 'https://w3id.org/sierra-moxon/zebrafish-toxicology-atlas-schema/')
DEFAULT_ = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA


# Types

# Class references
class NamedThingId(extended_str):
    pass


class FishId(NamedThingId):
    pass


class AlleleId(NamedThingId):
    pass


class GeneId(NamedThingId):
    pass


class ExposureEventId(NamedThingId):
    pass


class ChemicalEntityId(NamedThingId):
    pass


class PhenotypeId(NamedThingId):
    pass


class DevelopmentalStageId(NamedThingId):
    pass


@dataclass(repr=False)
class NamedThing(YAMLRoot):
    """
    A named entity.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["NamedThing"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:NamedThing"
    class_name: ClassVar[str] = "NamedThing"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.NamedThing

    id: Union[str, NamedThingId] = None
    name: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, NamedThingId):
            self.id = NamedThingId(self.id)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class Fish(NamedThing):
    """
    A representation of the zebrafish used in the toxicology study.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["Fish"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:Fish"
    class_name: ClassVar[str] = "Fish"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Fish

    id: Union[str, FishId] = None
    background: Optional[str] = None
    allele: Optional[Union[str, AlleleId]] = None
    zygosity: Optional[Union[str, URIorCURIE]] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, FishId):
            self.id = FishId(self.id)

        if self.background is not None and not isinstance(self.background, str):
            self.background = str(self.background)

        if self.allele is not None and not isinstance(self.allele, AlleleId):
            self.allele = AlleleId(self.allele)

        if self.zygosity is not None and not isinstance(self.zygosity, URIorCURIE):
            self.zygosity = URIorCURIE(self.zygosity)

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class Allele(NamedThing):
    """
    A representation of the genetic background of the fish.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["Allele"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:Allele"
    class_name: ClassVar[str] = "Allele"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Allele

    id: Union[str, AlleleId] = None
    name: Optional[str] = None
    gene: Optional[Union[str, GeneId]] = None
    variation_type: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, AlleleId):
            self.id = AlleleId(self.id)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        if self.gene is not None and not isinstance(self.gene, GeneId):
            self.gene = GeneId(self.gene)

        if self.variation_type is not None and not isinstance(self.variation_type, str):
            self.variation_type = str(self.variation_type)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class Gene(NamedThing):
    """
    A representation of a gene.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["Gene"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:Gene"
    class_name: ClassVar[str] = "Gene"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Gene

    id: Union[str, GeneId] = None
    name: Optional[str] = None
    symbol: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, GeneId):
            self.id = GeneId(self.id)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        if self.symbol is not None and not isinstance(self.symbol, str):
            self.symbol = str(self.symbol)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class ExposureEvent(NamedThing):
    """
    An instance of a toxicological exposure event in the study.  According to ECTO,  an exposure
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["ExposureEvent"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:ExposureEvent"
    class_name: ClassVar[str] = "ExposureEvent"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.ExposureEvent

    id: Union[str, ExposureEventId] = None
    exposure_substance: Optional[Union[str, ChemicalEntityId]] = None
    exposure_type: Optional[Union[str, "ExposureTypeEnum"]] = None
    concentration: Optional[Union[dict, "Concentration"]] = None
    start_stage: Optional[Union[str, DevelopmentalStageId]] = None
    end_stage: Optional[Union[str, DevelopmentalStageId]] = None
    duration: Optional[Union[dict, "QuantityValue"]] = None
    frequency: Optional[Union[dict, "QuantityValue"]] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, ExposureEventId):
            self.id = ExposureEventId(self.id)

        if self.exposure_substance is not None and not isinstance(self.exposure_substance, ChemicalEntityId):
            self.exposure_substance = ChemicalEntityId(self.exposure_substance)

        if self.concentration is not None and not isinstance(self.concentration, Concentration):
            self.concentration = Concentration(**as_dict(self.concentration))

        if self.start_stage is not None and not isinstance(self.start_stage, DevelopmentalStageId):
            self.start_stage = DevelopmentalStageId(self.start_stage)

        if self.end_stage is not None and not isinstance(self.end_stage, DevelopmentalStageId):
            self.end_stage = DevelopmentalStageId(self.end_stage)

        if self.duration is not None and not isinstance(self.duration, QuantityValue):
            self.duration = QuantityValue(**as_dict(self.duration))

        if self.frequency is not None and not isinstance(self.frequency, QuantityValue):
            self.frequency = QuantityValue(**as_dict(self.frequency))

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class ChemicalEntity(NamedThing):
    """
    A chemical compound used as a toxicant in the study.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["ChemicalEntity"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:ChemicalEntity"
    class_name: ClassVar[str] = "ChemicalEntity"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.ChemicalEntity

    id: Union[str, ChemicalEntityId] = None
    name: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, ChemicalEntityId):
            self.id = ChemicalEntityId(self.id)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class Phenotype(NamedThing):
    """
    A phenotype observed in the fish as a result of exposure.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["Phenotype"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:Phenotype"
    class_name: ClassVar[str] = "Phenotype"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Phenotype

    id: Union[str, PhenotypeId] = None
    name: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, PhenotypeId):
            self.id = PhenotypeId(self.id)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        super().__post_init__(**kwargs)


class Annotation(YAMLRoot):
    """
    Root class for entity annotations.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["Annotation"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:Annotation"
    class_name: ClassVar[str] = "Annotation"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Annotation


@dataclass(repr=False)
class QuantityValue(Annotation):
    """
    A value of an attribute that is quantitative and measurable, expressed as a combination of a unit and a numeric
    value
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["QuantityValue"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:QuantityValue"
    class_name: ClassVar[str] = "QuantityValue"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.QuantityValue

    has_unit: Optional[str] = None
    has_numeric_value: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self.has_unit is not None and not isinstance(self.has_unit, str):
            self.has_unit = str(self.has_unit)

        if self.has_numeric_value is not None and not isinstance(self.has_numeric_value, str):
            self.has_numeric_value = str(self.has_numeric_value)

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class Concentration(QuantityValue):
    """
    The concentration of a chemical.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["Concentration"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:Concentration"
    class_name: ClassVar[str] = "Concentration"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Concentration

    has_unit: Optional[str] = None
    has_numeric_value: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self.has_unit is not None and not isinstance(self.has_unit, str):
            self.has_unit = str(self.has_unit)

        if self.has_numeric_value is not None and not isinstance(self.has_numeric_value, str):
            self.has_numeric_value = str(self.has_numeric_value)

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class DevelopmentalStage(NamedThing):
    """
    A zebrafish developmental stage.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["DevelopmentalStage"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:DevelopmentalStage"
    class_name: ClassVar[str] = "DevelopmentalStage"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.DevelopmentalStage

    id: Union[str, DevelopmentalStageId] = None
    name: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.id):
            self.MissingRequiredField("id")
        if not isinstance(self.id, DevelopmentalStageId):
            self.id = DevelopmentalStageId(self.id)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        if self.name is not None and not isinstance(self.name, str):
            self.name = str(self.name)

        super().__post_init__(**kwargs)


@dataclass(repr=False)
class FishExposureOutcome(YAMLRoot):
    """
    A representation of the phenotype observed in the fish as a result of exposure.
    """
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA["FishExposureOutcome"]
    class_class_curie: ClassVar[str] = "zebrafish_toxicology_atlas_schema:FishExposureOutcome"
    class_name: ClassVar[str] = "FishExposureOutcome"
    class_model_uri: ClassVar[URIRef] = ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.FishExposureOutcome

    fish: Optional[Union[str, FishId]] = None
    exposure_event: Optional[Union[str, ExposureEventId]] = None
    outcome: Optional[Union[Union[str, PhenotypeId], List[Union[str, PhenotypeId]]]] = empty_list()

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self.fish is not None and not isinstance(self.fish, FishId):
            self.fish = FishId(self.fish)

        if self.exposure_event is not None and not isinstance(self.exposure_event, ExposureEventId):
            self.exposure_event = ExposureEventId(self.exposure_event)

        if not isinstance(self.outcome, list):
            self.outcome = [self.outcome] if self.outcome is not None else []
        self.outcome = [v if isinstance(v, PhenotypeId) else PhenotypeId(v) for v in self.outcome]

        super().__post_init__(**kwargs)


# Enumerations
class ExposureTypeEnum(EnumDefinitionImpl):
    """
    An enumeration of exposure types derived from the ECTO ontology.
    """
    _defn = EnumDefinition(
        name="ExposureTypeEnum",
        description="An enumeration of exposure types derived from the ECTO ontology.",
    )

# Slots
class slots:
    pass

slots.id = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, name="id", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('id'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, domain=None, range=URIRef)

slots.name = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.name, name="name", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('name'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.name, domain=None, range=Optional[str])

slots.background = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.background, name="background", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('background'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.background, domain=None, range=Optional[Union[str, URIorCURIE]])

slots.exposure_type = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.exposure_type, name="exposure_type", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('exposure_type'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.exposure_type, domain=None, range=Optional[Union[str, "ExposureTypeEnum"]])

slots.start_stage = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.start_stage, name="start_stage", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('start_stage'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.start_stage, domain=None, range=Optional[Union[str, URIorCURIE]])

slots.end_stage = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.end_stage, name="end_stage", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('end_stage'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.end_stage, domain=None, range=Optional[Union[str, URIorCURIE]])

slots.has_unit = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.has_unit, name="has_unit", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('has_unit'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.has_unit, domain=None, range=Optional[str])

slots.has_numeric_value = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.has_numeric_value, name="has_numeric_value", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('has_numeric_value'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.has_numeric_value, domain=None, range=Optional[str])

slots.treated_with = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.treated_with, name="treated_with", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('treated_with'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.treated_with, domain=None, range=Optional[Union[str, URIorCURIE]])

slots.exposure_substance = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.exposure_substance, name="exposure_substance", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('exposure_substance'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.exposure_substance, domain=None, range=Optional[Union[str, URIorCURIE]])

slots.concentration = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.concentration, name="concentration", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('concentration'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.concentration, domain=None, range=Optional[str])

slots.zygosity = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.zygosity, name="zygosity", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('zygosity'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.zygosity, domain=None, range=Optional[Union[str, URIorCURIE]])

slots.duration = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.duration, name="duration", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('duration'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.duration, domain=None, range=Optional[Union[dict, QuantityValue]])

slots.exposure_event = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.exposure_event, name="exposure_event", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('exposure_event'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.exposure_event, domain=None, range=Optional[Union[str, ExposureEventId]])

slots.fish = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.fish, name="fish", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('fish'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.fish, domain=None, range=Optional[Union[str, FishId]])

slots.outcome = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.outcome, name="outcome", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('outcome'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.outcome, domain=None, range=Optional[Union[Union[str, PhenotypeId], List[Union[str, PhenotypeId]]]])

slots.frequency = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.frequency, name="frequency", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('frequency'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.frequency, domain=None, range=Optional[Union[dict, QuantityValue]])

slots.allele = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.allele, name="allele", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('allele'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.allele, domain=None, range=Optional[Union[str, AlleleId]])

slots.gene = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.gene, name="gene", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('gene'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.gene, domain=None, range=Optional[Union[str, GeneId]])

slots.symbol = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.symbol, name="symbol", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('symbol'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.symbol, domain=None, range=Optional[str])

slots.variation_type = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.variation_type, name="variation_type", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('variation_type'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.variation_type, domain=None, range=Optional[str])

slots.NamedThing_id = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, name="NamedThing_id", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('id'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.NamedThing_id, domain=NamedThing, range=Union[str, NamedThingId])

slots.NamedThing_name = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.name, name="NamedThing_name", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('name'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.NamedThing_name, domain=NamedThing, range=Optional[str])

slots.Fish_id = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, name="Fish_id", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('id'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Fish_id, domain=Fish, range=Union[str, FishId],
                   pattern=re.compile(r'^ZDB:FISH:\d{6}-\d$'))

slots.Fish_background = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.background, name="Fish_background", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('background'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Fish_background, domain=Fish, range=Optional[str])

slots.Allele_id = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, name="Allele_id", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('id'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Allele_id, domain=Allele, range=Union[str, AlleleId],
                   pattern=re.compile(r'^ZFIN:ZDB-GENO-\d{6}-\d$'))

slots.Allele_name = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.name, name="Allele_name", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('name'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Allele_name, domain=Allele, range=Optional[str])

slots.Gene_id = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, name="Gene_id", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('id'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Gene_id, domain=Gene, range=Union[str, GeneId],
                   pattern=re.compile(r'^ZFIN:ZDB-GENE-\d{6}-\d$'))

slots.Gene_name = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.name, name="Gene_name", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('name'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Gene_name, domain=Gene, range=Optional[str])

slots.ExposureEvent_exposure_substance = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.exposure_substance, name="ExposureEvent_exposure_substance", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('exposure_substance'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.ExposureEvent_exposure_substance, domain=ExposureEvent, range=Optional[Union[str, ChemicalEntityId]])

slots.ExposureEvent_concentration = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.concentration, name="ExposureEvent_concentration", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('concentration'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.ExposureEvent_concentration, domain=ExposureEvent, range=Optional[Union[dict, "Concentration"]])

slots.ExposureEvent_start_stage = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.start_stage, name="ExposureEvent_start_stage", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('start_stage'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.ExposureEvent_start_stage, domain=ExposureEvent, range=Optional[Union[str, DevelopmentalStageId]])

slots.ExposureEvent_end_stage = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.end_stage, name="ExposureEvent_end_stage", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('end_stage'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.ExposureEvent_end_stage, domain=ExposureEvent, range=Optional[Union[str, DevelopmentalStageId]])

slots.ChemicalEntity_id = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, name="ChemicalEntity_id", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('id'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.ChemicalEntity_id, domain=ChemicalEntity, range=Union[str, ChemicalEntityId],
                   pattern=re.compile(r'^CHEBI:\d+$'))

slots.ChemicalEntity_name = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.name, name="ChemicalEntity_name", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('name'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.ChemicalEntity_name, domain=ChemicalEntity, range=Optional[str])

slots.Phenotype_id = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, name="Phenotype_id", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('id'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Phenotype_id, domain=Phenotype, range=Union[str, PhenotypeId],
                   pattern=re.compile(r'^ZP:\d+$'))

slots.Phenotype_name = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.name, name="Phenotype_name", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('name'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Phenotype_name, domain=Phenotype, range=Optional[str])

slots.Concentration_has_unit = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.has_unit, name="Concentration_has_unit", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('has_unit'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Concentration_has_unit, domain=Concentration, range=Optional[str])

slots.Concentration_has_numeric_value = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.has_numeric_value, name="Concentration_has_numeric_value", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('has_numeric_value'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.Concentration_has_numeric_value, domain=Concentration, range=Optional[str])

slots.DevelopmentalStage_id = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.id, name="DevelopmentalStage_id", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('id'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.DevelopmentalStage_id, domain=DevelopmentalStage, range=Union[str, DevelopmentalStageId],
                   pattern=re.compile(r'^ZFS:\d+$'))

slots.DevelopmentalStage_name = Slot(uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.name, name="DevelopmentalStage_name", curie=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.curie('name'),
                   model_uri=ZEBRAFISH_TOXICOLOGY_ATLAS_SCHEMA.DevelopmentalStage_name, domain=DevelopmentalStage, range=Optional[str])