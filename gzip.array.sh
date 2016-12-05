#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=12:00:00,mem=2gb 
#PBS -N MAKER.arrayjob -j oe

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
gzip *maker.output/*.all.* 
