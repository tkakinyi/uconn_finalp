#!/bin/bash 
#SBATCH --job-name=samstats_viralsolo
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=15
#SBATCH --mem=5G
#SBATCH --qos=general
#SBATCH --partition=general

hostname
date

##################################
# calculate stats on alignments
##################################

# calculate alignment statistics for each bam file using samtools

# load software--------------------------------------------------------------------------
module load samtools/1.16.1
module load parallel/20180122

# input, output directories--------------------------------------------------------------

INDIR=../../results/03_Alignment/bwa_align/soloviral
OUTDIR=../../results/04_alignQC/samstats_viralsolo
mkdir -p $OUTDIR

# samtools bam statistics----------------------------------------------------------------
	# use a loop to create command lines for samtools stats
	# pipe commands to `parallel`
for file in $(find $INDIR -name "*bam"); 
do 
SAM=$(basename $file .bam)
echo "samtools stats $file >$OUTDIR/${SAM}.stats"
done | \
parallel -j 15


# put the basic stats all in one file.---------------------------------------------------
FILES=($(find $OUTDIR -name "*.stats" | sort))

grep "^SN" ${FILES[0]} | cut -f 2 > $OUTDIR/SN.txt
for file in ${FILES[@]}
do paste $OUTDIR/SN.txt <(grep ^SN $file | cut -f 3) > $OUTDIR/SN2.txt && \
	mv $OUTDIR/SN2.txt $OUTDIR/SN.txt
	echo $file
done

# add a header with sample names
cat \
<(echo ${FILES[@]} | sed 's,../results/align_stats/,,g' | sed 's/.stats//g' | sed 's/ /\t/g') \
$OUTDIR/SN.txt \
>$OUTDIR/SN2.txt && \
	mv $OUTDIR/SN2.txt $OUTDIR/SN.txt

# run multiQC

module load MultiQC/1.9

# run multiqc on fastqc output
multiqc -f -o $OUTDIR/multiqc $OUTDIR