#!/bin/bash 
#SBATCH --job-name=normalizeVariants
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 7
#SBATCH --mem=10G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

module load bcftools/1.16
module load htslib/1.16
module load vcflib/1.0.0-rc1

# vcf files
FREEBAYES=../../results/05_variantCalling/freebayes/freebayes.vcf.gz
FREEBAYESOUT=../../results/05_variantCalling/freebayes/freebayes_norm.vcf.gz
FREEBAYESAP=../../results/05_variantCalling/freebayes/freebayes_normAP.vcf.gz

GATK=../../results/05_variantCalling/LoFreq/allsamplesvcf.vcf.gz
GATKOUT=../../results/05_variantCalling/LoFreq/LoFreq_norm.vcf.gz
GATKOUTAP=../../results/05_variantCalling/LoFreq/LoFreq_normAP.vcf.gz

BCFTOOLS=../../results/05_variantCalling/bcftools/bcftools.vcf.gz
BCFTOOLSOUT=../../results/05_variantCalling/bcftools/bcftools_norm.vcf.gz
BCFTOOLSOUTAP=../../results/05_variantCalling/bcftools/bcftools_normAP.vcf.gz

# genome
GENOME=../../genome/bothgenome.fasta

# add vcfstreamsort because bcftools has at least one out of order record after vcfallelicprimitives

# freebayes
bcftools view ${FREEBAYES} | 
  bcftools norm -f ${GENOME} -O z -o ${FREEBAYESOUT}

bcftools view ${FREEBAYES} | 
  bcftools norm -f ${GENOME} |
  bgzip >${FREEBAYESAP}
tabix -p vcf ${FREEBAYESAP}

# gatk
bcftools view ${GATK} | 
  bcftools norm -f ${GENOME} -O z -o ${GATKOUT}

bcftools view ${GATK} | 
  bcftools norm -f ${GENOME} |
  bgzip >${GATKOUTAP}
tabix -p vcf ${GATKOUTAP}

# bcftools
bcftools view ${BCFTOOLS} | 
  bcftools norm -f ${GENOME} -O z -o ${BCFTOOLSOUT}

bcftools view ${BCFTOOLS} | 
  bcftools norm -f ${GENOME} |
  bgzip >${BCFTOOLSOUTAP}
tabix -p vcf ${BCFTOOLSOUTAP}

