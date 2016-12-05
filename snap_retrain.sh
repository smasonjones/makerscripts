#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=12:00:00,mem=16gb 
#PBS -j oe

module load snap
module load maker
mkdir train
mkdir train/snap
PREF=`basename \`pwd\``
cp *maker.output/*_datastore/*/*/*/*gff train/snap/
cd train/snap/
maker2zff *.gff
fathom -categorize 1000 genome.ann genome.dna
fathom -export 1000 -plus uni.ann uni.dna
forge export.ann export.dna
hmm-assembler.pl pyu . > ../../$PREF.snap.retrain.hmm
cd ../..
mv *maker.output $PREF.maker.output.old
python scripts/maker_retrain.py
 

