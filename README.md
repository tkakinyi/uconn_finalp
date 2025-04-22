# uconn_finalp
This repo will house a variant calling project to satisfy the requeirements of UConn ISG-5312: Genomic Data Analysis in Practice.
Final project requirements include:
A variation on one of our existing workflows discussed in the course e.g  structural variant detection or phased polyploid genome assembly, based on high throughput sequence data where the data are publicly available and already analyzed and published (completely original projects based on public data would be great, but probably too intense for this course!).

This repo will hold a reanlysis of the paper:
Herold, M., d'Hérouël, A. F., May, P., Delogu, F., Wienecke-Baldacchino, A., Tapp, J., Walczak, C., Wilmes, P., Cauchie, H.-M., Fournier, G., & Ogorzaly, L. (2021). Genome Sequencing of SARS-CoV-2 Allows Monitoring of Variants of Concern through Wastewater. Water, 13(21), 3018. https://doi.org/10.3390/w13213018

The  re-analysis looks at a comparison of characteristic mutations of lineages that are patient-derived  sequences to corresponding mutations detected in wastewater over time and by location (Luxembourg) . They also reconstruct haplotypes of specific genomic regions from short-read data based on mutation co-occurrence. This paper is based on the hypothesis that the concentration of SARS-CoV-2 in wastewater is proportional to the number of COVID-19 cases in the catchment area, allowing water based surveillance.

The use samples from waste water collected from 13 waste water treatment plants, from which sequencing data were obtained for 98 samples, mappings for 92, of which 79 samples had at least 70% reference coverage. SARS-CoV-2 Genome Sequences from Luxembourg Patients were accessed from GISAID and included 9133 sequences with minimum reference genome coverage of 90%. These were aligned to the reference sequence NC_045512.2, calling of single nucleotide polymorphisms (SNPs), and assignment of PANGO lineages with Pangolin v.3.1.7. Virus variant call format (VCF) files were annotated with the SARS-CoV-2 28 April 2020 version of Annovar. Haplotypes were reconstructed with SNPs around 130bp and refined to retain only variants present in sample specific VCF files. The alignment files were run through sample specific statistical analysis in R to determine correlations between allele frequencies in waste water samples and the occurrence in patient derived samples.

![image](https://github.com/user-attachments/assets/b8a1090f-9625-4ac5-8014-507b4ecb94ff)

Comparative analysis may not be feasible considering time constraints, however variant calling analysis on either the clinical samples or the waste water treatment plant samples.

From the paper of reanalysis the data are publicly available as:

Patient-derived sequences were downloaded from GISAID (4 June 2021).
1. Weekly numbers of infected people were obtained from ECDC and downloaded (https://www.ecdc.europa.eu/en/publications-data/data-national-14-day-notification-rate-covid-19; accessed on 22 June 2021).
2. Raw reads for sequencing data derived from WWTP samples have been uploaded to NCBI and are accessible under BioProject PRJNA765031.
3. Preprocessing: IMP3 available from https://git-r3lab.uni.lu/IMP/imp3 accessed on 20 June 2021 includes FastQC available from https://github.com/s-andrews/FastQC accessed on 20 June 2021. 
4. Picard is available from https://github.com/broadinstitute/picard; accessed on 20 June 2021. 
5. The phylodynamics PDP pipeline-based Nextstrain and the variant-calling pipeline using LoFreq are available on https://git-r3lab.uni.lu/covid19-genomics accessed on 20 June 2021. 
6. Code for statistical analyses and generating figures is available in the following repository: https://git.list.lu/malte.herold/coronastep-variant-analysis-scripts/ accessed on 20 June 2021.
