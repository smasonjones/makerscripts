#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=2:00:00 
#PBS -N MAKER.arrayjob -j oe

module load maker/2.31.8
module load snap
module load RepeatMasker
module load ncbi-blast
module load tRNAscan

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
dest=$(pwd)
#mkdir train
#rsync -ai scripts/train_template/ train/
cd train/genemark
GM=$(qsub -d $(pwd) train_genemark.sh)
cd ../busco
BUSCO=$(qsub -d $(pwd) train_busco.sh)
cd ../..
FIRST=$(qsub -W depend=afterok:$GM:$BUSCO -t 1-10 -d $dest -v L=$N -N MAKER.Hw.$N scripts/maker.sh) 
SECOND=$(qsub -W depend=afterokarray:$FIRST -N MAKER.post.$N -d $dest -v L=$N scripts/maker_after.sh) 
THIRD=$(qsub -W depend=afterok:$SECOND  -N MAKER.snapretrain.$N  -d $dest -v L=$N scripts/snap_retrain.sh)
FOURTH=$(qsub -t 1-10 -W depend=afterok:$THIRD  -d $dest -v L=$N -N MAKER.Hw.$N.re scripts/maker.sh)
qsub -W depend=afterokarray:$FOURTH -d $dest  -N MAKER.repost.$N -v L=$N scripts/maker_after.sh
