#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=168:00:00,mem=16gb 
#PBS -N augustus -j oe

module load augustus

PREF='Hortea_thailandica.v1.gb'
randomSplit.pl $PREF 100
name='Hortea_thailandica.v1.maker'
new_species.pl --species=$name --AUGUSTUS_CONFIG_PATH=/bigdata/stajichlab/smaso/augustus.3.0.3/config/
etraining --species=$name $PREF.train --AUGUSTUS_CONFIG_PATH=/bigdata/stajichlab/smaso/augustus.3.0.3/config/
optimize_augustus.pl --species=$name $PREF.train --AUGUSTUS_CONFIG_PATH=/bigdata/stajichlab/smaso/augustus.3.0.3/config/
augustus --species=$name $PREF.test --AUGUSTUS_CONFIG_PATH=/bigdata/stajichlab/smaso/augustus.3.0.3/config/

