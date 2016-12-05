#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=2:00:00 
#PBS -N MAKER.arrayjob -j oe

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
dest=$(pwd)
FOURTH=$(qsub -t 1-10  -d $dest -N MAKER.Hw.$N.re scripts/maker.sh)
qsub -W depend=afterokarray:$FOURTH -d $dest  -N MAKER.repost.$N scripts/maker_after.sh
