#!/bin/bash 
#SBATCH --job-name=lofreq_vcfgz
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


hostname
date

#load software
module load parallel/20180122
module load bcftools/1.16
module load htslib/1.16


OUTDIR=../../results/05_variantCalling/LoFreq/
    mkdir -p ${OUTDIR}
INDIR=../../results/05_variantCalling/LoFreq/getlovcf

export TMPDIR=${OUTDIR}/tmp
    mkdir -p ${TMPDIR}

# compress the files 
#ls ${INDIR}/*.vcf | parallel -j 12 bgzip

find ${INDIR} -type f -name "*vcf.gz" > ${OUTDIR}/vcf.list
bcftools index -f ${OUTDIR}/getlovcf/*.vcf.gz 
bcftools merge -O z -o ${OUTDIR}/allsamplesvcf.vcf.gz --file-list ${OUTDIR}/vcf.list
