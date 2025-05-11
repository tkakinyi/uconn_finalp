#!/bin/bash 
#SBATCH --job-name=lofreq_indels
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 7
#SBATCH --mem=20G
#SBATCH --qos=general
#SBATCH --partition=xeon
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%A_%a.out
#SBATCH -e %x_%A_%a.err
#SBATCH --array=[1-97]


hostname
date

# make sure partition is specified as `xeon` to prevent slowdowns on amd processors. 

# load required software

module load lofreq/2.1.1

# input/output
INDIR=../../results/03_Alignment/bwa_align/bothgenome

OUTDIR=../../results/05_variantCalling/LoFreq/addindels
mkdir -p $OUTDIR

# sample ID list
ACCLIST=../../metadata/accessionlist.txt
 
# extract one sample ID
SAMPLE=$(sed -n ${SLURM_ARRAY_TASK_ID}p ${ACCLIST})

# set a variable for the reference genome location
GEN=../../genome/bothgenome.fasta

# run haplotype caller on one sample
lofreq indelqual --dindel ${INDIR}/${SAMPLE}.bam  -f ${GEN} -o ${OUTDIR}/${SAMPLE}.bam 




