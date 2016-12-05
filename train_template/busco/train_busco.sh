#PBS -l nodes=1:ppn=16,mem=32gb,walltime=72:00:00 -N busco

module load busco
module load hmmer
module load python/3.4.3
module unload augustus
module load augustus/3.0.3
D=`dirname \`pwd\``
D2=`dirname $D`
SPECIES=`basename $D2`
CPU=$PBS_NP


export AUGUSTUS_CONFIG_PATH=/bigdata/stajichlab/smaso/augustus.3.0.3/config
ln -s ~/bigdata/busco_lineages/fungi/ ./fungi 
ln -s ../../$SPECIES.fasta ./$SPECIES.fasta
/opt/linux/centos/7.x/x86_64/pkgs/busco/1.1/bin/BUSCO.py -o $SPECIES.busco -in $SPECIES.fasta -l fungi -f -m genome -c $CPU -e 0.1

/bigdata/stajichlab/smaso/augustus.3.0.3/scripts/optimize_augustus.pl --species=$SPECIES.busco run_$SPECIES.busco/training_set_$SPECIES.busco --aug_exec_dir=/bigdata/stajichlab/smaso/augustus.3.0.3/bin/ --AUGUSTUS_CONFIG_PATH=/bigdata/stajichlab/smaso/augustus.3.0.3/config/ --cpus=$CPU
