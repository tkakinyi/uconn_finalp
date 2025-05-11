#!/bin/bash 
#SBATCH --job-name=createDict
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 7
#SBATCH --mem=10G
#SBATCH --qos=general
#SBATCH --partition=xeon
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err


hostname
date

# make sure partition is specified as `xeon` to prevent slowdowns on amd processors. 

# load required software
module load picard/2.23.9

# input/output
INDIR=../../results/03_Alignment/bwa_align/bothgenome

OUTDIR=../../results/05_variantCalling/LoFreq
mkdir -p $OUTDIR

# set a variable for the reference genome location
GEN=../../genome/bothgenome.fasta

# create required .dict file
java -jar $PICARD CreateSequenceDictionary R=$GEN

