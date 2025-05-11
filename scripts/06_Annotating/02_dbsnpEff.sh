#!/bin/bash
#SBATCH --job-name=dbsnpEff
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=8G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

module load htslib/1.7
module load bcftools/1.6
module load GATK/4.1.3.0

# make a directory if it doesn't exist
OUTDIR=../../genome/SNPeff/data
mkdir -p ${OUTDIR}

# Get annotation files
wget -P ${OUTDIR}/ ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/858/895/GCF_009858895.2_ASM985889v3/GCF_009858895.2_ASM985889v3_genomic.gtf.gz
mv ${OUTDIR}/GCF_009858895.2_ASM985889v3_genomic.gtf.gz ${OUTDIR}/genes.gtf.gz

# Get the genome reference sequence file
OUTDIR2=../../genome/SNPeff/data/genomes/
mkdir -p ${OUTDIR2}
cp ../../genome/MN908947.3.fasta  ${OUTDIR2}
java -jar $SNPEFF  build -gtf22 -v MN908947.3 