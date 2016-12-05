#!/bin/bash
#PBS -l nodes=1:ppn=2,walltime=500:00:00,mem=16gb 
#PBS -j oe
module load lp_solve
module load maker/2.31.8
module load SNAP
module load RepeatMasker
module load ncbi-blast
module load tRNAscan
maker

