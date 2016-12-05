#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=12:00:00,mem=2gb
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
mv $SPECIES.all.maker.proteins.functional.fasta.new $SPECIES.all.maker.proteins.functional.fasta
mv $SPECIES.all.maker.transcripts.functional.fasta.new $SPECIES.all.maker.transcripts.functional.fasta

gzip *all*
