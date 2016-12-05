#PBS -l nodes=1:ppn=16,walltime=96:00:00,mem=16gb -j oe
module load genemarkHMM
CPU=$PBS_NP
if [ ! $CPU ]; then
 CPU=2
fi
D=`dirname \`pwd\``
D2=`dirname $D`
SPECIES=`basename $D2`
echo $SPECIES
if [ ! -f ../../$SPECIES.gmes.mod ]; then
   perl /rhome/jstajich/src/genome-scripts/gene_prediction/select_long_ctgs.pl ../../$SPECIES.fasta > $SPECIES.long.fasta
   nohup gmes_petap.pl --cores $CPU --fungus --ES --sequence $SPECIES.long.fasta >& train.log
   bash copy_model.sh
fi

