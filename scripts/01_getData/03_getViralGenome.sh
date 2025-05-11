#!/bin/bash 
#SBATCH --job-name=downloadviral_genome
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=10G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err


#The SARS-CoV-2 genome (GenBank: MN908947.3, RefSeq: NC_045512.2) was manually downloaded from the link below and saved in ../genome/MN908947.3.FASTA

#https://www.ncbi.nlm.nih.gov/nuccore/NC_045512.2?report=fasta