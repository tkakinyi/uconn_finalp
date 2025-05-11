#!/bin/bash 
#SBATCH --job-name=bedtoolsnuc
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 5
#SBATCH --mem=5G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

# load required software

module load bedtools/2.29.0
module load samtools/1.16.1

# define and/or create input, output directories

OUTDIR=../../results/04_alignQC/bedtoolsnuc
mkdir -p ${OUTDIR}

GENOME=../../genome/bothgenome.fasta
WIN1KB=../../results/04_alignQC/coverage/bothgenome_1kb.bed

# run bedtools 
bedtools nuc -fi ${GENOME} -bed ${WIN1KB} | bgzip >${OUTDIR}/nuc.bed.gz