#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=24:00:00,mem=16gb
#PBS -j oe
N=$PBS_ARRAYID
ln -s ../../../scripts/ scripts
cd *maker.output
bash ../scripts/get_gff_fasta.sh
bash ../scripts/make_mapids.sh
bash ../scripts/map_ids.sh
bash ../scripts/run_swissprot_blast.sh
bash ../scripts/add_functional.sh
bash ../scripts/rename_contigs.sh


