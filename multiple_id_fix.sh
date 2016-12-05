#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=72:00:00,mem=16gb
#PBS -j oe
N=$PBS_ARRAYID
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
cd *maker.output
gunzip *all*gz
D=`dirname \`pwd\``
SPECIES=`basename $D`
python ../../../../multiple_id_fix.py $SPECIES.all.maker.transcripts.functional.fasta
python ../../../../multiple_id_fix.py $SPECIES.all.maker.proteins.functional.fasta
gzip *all*
