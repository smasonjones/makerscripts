#!/bin/bash
#PBS -l nodes=1:ppn=4,walltime=500:00:00,mem=32gb 
#PBS -N MAKER.Hw -j oe

module load maker/2.31.8
module load snap
module load augustus/2.7
module load RepeatMasker
module load ncbi-blast
module load tRNAscan
which augustus

N=$PBS_ARRAYID
if [ ! $N ]; then
 N=$1
fi
if [ ! $N ]; then
 echo "Must provide a number for indexing into, with -t in qsub or on cmdline (eg tophat.arrayjob.sh 2)"
 exit;
fi

PREF=`head -n $N files | tail -n 1`
cd $PREF 
ln -s ../../../scripts/ scripts
maker
cd *maker.output
bash ../scripts/get_gff_fasta.sh
bash ../scripts/make_map_ids.sh
bash ../scripts/run_swissprot_blast.sh
bash ../scripts/add_functional.sh
bash ../scripts/rename_contigs.sh

