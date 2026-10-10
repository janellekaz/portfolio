# My GitHub Portfolio for EVR 628

## Author

Janelle Kaz 
Username: janellekaz

PhD Student | Environmental Science & Policy

## Description

My portfolio on GitHub:
What does Octopus vulgaris want?
This literature review looks into the how and why 
we research the most studied octopus, Octopus vulgaris.

## Project Structure

- `data/raw`: contains the *.xslx file of coded literature
- `scripts/01_processing`: contains a single script that reads the raw data, cleans it up, and exports processed data.
- `scripts/03_content`: contains a script that builds four figures
- `results/img`: Output figures


## About the data

data/processed/recent_vulgaris_clean.rds contains 101 observations of 6 variables
data/processed/recent_vulgaris_ethical_long.rds contains 202 observations of 6 variables


# Octopus vulgaris Literature Coding Info


These 101 most recent studies (2023-2027) of Octopus vulgaris code for
Primary Research Category, Presence of Cognitive/Welfare Insight, Agency,
whether they explicitly recognized welfare or ethics, such as with an ethics statement, 
what method type they used in their research, and an invasiveness score. 

Coding Info:

##Primary Research Category
Each study was categorized according to its primary research category, the guiding reason the study was conducted, framed by its title, abstract, methods, and publication context. Where studies touched multiple aims, priority was given to the most explicit or dominant research domain.
1. Neurobiology & Physiology
Investigates nervous system function, motor pathways, sensory processing, endocrine signals, immune systems, or organ-level physiology. Includes brain mapping, neural stimulation, and hormonal manipulation.
2. Cognition & Behavioral Research
Focuses on learning, memory, perception, problem-solving, personality, or decision-making. Typically includes conditioning paradigms, behavioral discrimination tasks, or social interaction experiments under controlled conditions.
3. Aquaculture & Commercial Rearing
Designed to improve the rearing of O. vulgaris in captivity for human use. Encompasses growth optimization, hatchery design, dietary trials, larval survival, and production-scale welfare assessments.
4. Reproductive & Developmental Biology
Explores reproduction, maturation, egg development, spawning, embryology, paralarval stages, and life-history traits. May include anatomical or molecular tools but is motivated by understanding natural development rather than rearing outcomes.
5. Fisheries Management & Commercial Use
Research motivated by the harvest, management, processing, quality assessment, authentication, traceability, or commercial use of wild-caught octopuses. Includes stock assessment, yield prediction, harvest regulation, catch analysis, seafood quality and safety, product authentication, and fraud detection.
6. Environmental & Ecotoxicological Assessment
Assesses how external stressors (e.g., pollutants, temperature, pH) impact octopus health, development, or survival. Often includes bioindicator studies and toxicology.
7. Genomics & Molecular Characterization
Driven by gene-level insights: barcoding, transcriptomics, proteomics, gene expression, or evolutionary molecular traits. 
8. Biomimetics & Technological Design
Applies O. vulgaris traits (e.g., flexibility, adhesion, neural design) to engineering, robotics, etc. The octopus is used as a model for technical innovation rather than biological insight alone.
9. Comparative Anatomy & Evolution
Seeks phylogenetic, morphological, or functional comparisons across cephalopod or mollusk species. Often includes morphometrics, fossil calibration, and ancestral trait reconstruction.
10. Ecology & Natural History
Motivated by understanding O. vulgaris in its natural context. Includes in situ behavioral observation, foraging studies, midden analysis, den ecology, predator-prey relationships, and habitat use. 
11. Captive Laboratory Husbandry
Focused on baseline care and welfare in captivity. Includes tank enrichment, stress indicators, recognition studies, and habitat design aiming to improve well-being in lab environments and aquaria.

##Cognitive/Welfare Insight Coding
Yes: cognition, behavior, health, affective state, or welfare is an explicit aim or central interpretive purpose. 
Incidental: the paper is about something else, but it briefly mentions or interprets findings in a way that bears on cognition, behavior, health, or welfare. 
No: there is no meaningful connection to cognition or wellbeing.

##Agency Score Definitions 
0: None. Octopuses are treated purely as biological specimens or data points. The animal’s actions are not described in terms of choice, autonomy, or intentionality. 
1: Low. The study mentions behavior but attributes it to automatic responses, reflexes, or physiology. There is no evidence that the animal is treated as an agent with goals, awareness, or problem-solving capacity. 
2: Moderate. The animal is depicted as capable of initiating actions or adapting behavior in meaningful ways, but this is not the focus of the study. Agency may be inferred rather than acknowledged. 
3: High. The study explicitly engages with the octopus as a sentient, decision-making being, through discussion of problem-solving, awareness, learning, or individual variation. 

##Primary Method Types:
1. Active/Lethal Post-Mortem Tissue Use
Involves the deliberate sacrifice of animals for the purpose of tissue extraction. 
2. Captive Behavioral Experimentation
Research conducted in controlled environments that introduces tasks, stimulus, or manipulation to provoke measurable behavioral responses. 
3. Captive Behavioral Observation
Observational studies conducted in laboratory or aquarium settings where animals are not manipulated, but their spontaneous behaviors are recorded in captivity.
4. Captive Rearing & Physiological Monitoring
Studies that involve raising octopuses from eggs or paralarvae under controlled conditions and include monitoring of growth, development, reproduction, or physiological parameters.
5. In Vivo Surgical / Physiological Intervention
Highly invasive methods involving live surgery, electrode implantation, or in vivo physiological manipulation of conscious or anesthetized animals. Typically scored with high invasiveness.
6. Literature Review / Data Synthesis / Meta-Analysis
No animals are used. Non-empirical works that integrate existing findings from multiple sources to draw theoretical or comparative insights or quantitative reviews that statistically re-analyze data from multiple empirical studies.
8. Observation In-Situ
Non-invasive field-based studies observing wild octopuses in their natural habitats. Examples include diver observations, midden analysis, or in situ ethology.
9. Post-Mortem Tissue Use
Use of deceased animals not actively killed for the study. Tissue samples may come from fisheries or other sources. 
10. Tagging & Release Monitoring
Involves the temporary capture of animals for tagging, followed by release. Tracking may be passive (e.g., via environmental sensors) or involve recapture.


##Invasiveness Scoring Framework (0, NA-PM, A–E)

To evaluate the degree of research-attributable intervention experienced by Octopus vulgaris, each study was assigned an invasiveness score adapted from the Canadian Council on Animal Care framework. Scores reflect procedures conducted for the purposes of the research rather than harms that occurred independently of the study. When multiple procedures were performed, the study was assigned the score corresponding to the most invasive research-attributable procedure.

0 — No Animal Used
No living or dead animal specimen was directly used in the study. Includes literature reviews, meta-analyses, modeling, analyses of previously generated datasets, and other forms of secondary data analysis.

NA-PM — Pre-existing Post-Mortem
Uses whole animals, body parts, tissues, or other biological material from animals that were already deceased and whose capture or death occurred independently of the research. The study did not cause, commission, request, or otherwise induce the capture or killing of the animals.
Examples include specimens obtained from existing commercial seafood supply chains, retail markets, routine fishery landings, strandings, museum collections, or previously archived tissues, provided that the animals were not collected or killed specifically at the researchers' request.
NA-PM is not positioned on the ordinal invasiveness scale because the animal was already deceased before its involvement in the study. It therefore indicates the absence of research-attributable live-animal intervention rather than a particular degree of invasiveness.

A — Non-Contact In Situ
Research involving free-living animals without capture, handling, restraint, confinement, or direct physical manipulation. Includes diver observations, underwater video, den or midden observations, remote monitoring, and environmental DNA sampling where octopuses are not contacted.

B — Non-Invasive Contained
Living animals are temporarily maintained, contained, or observed under human-controlled conditions without invasive manipulation. Animals must be explicitly reported as released following the study. Includes temporary holding or short-term behavioral observation where no invasive procedure is performed.

C — Minor Intervention
Living animals undergo brief handling, restraint, tagging, non-lethal biological sampling, or comparable minor procedures, with explicit evidence that animals were subsequently released. Anesthesia or other appropriate mitigation should be used where relevant to the procedure.

D — Moderate to Severe Intervention
Research involves substantial or prolonged interference with the animal, including long-term captivity, invasive physiological procedures, surgery, substantial tissue sampling, experimental manipulations with meaningful potential for pain or distress, or euthanasia for research purposes. Animals whose capture or killing was specifically caused, commissioned, or requested by the research are included in this category when mortality occurs, regardless of whether researchers themselves performed the capture or killing.

E — Extreme Intervention
Research involves severe procedures with substantial potential for pain, distress, injury, or prolonged impairment without appropriate anesthesia, analgesia, or other mitigation. Examples may include severe noxious stimulation, lesions, paralysis, or comparable interventions performed without adequate pain mitigation.

