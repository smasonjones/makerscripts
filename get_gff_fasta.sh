#PBS -l nodes=1:ppn=1 -j oe -l walltime=4:00:00

module load maker
D=`dirname \`pwd\``
SPECIES=`basename $D`
fasta_merge -d ../$SPECIES.maker.output/$SPECIES"_master_datastore_index.log"
gff3_merge -d ../$SPECIES.maker.output/$SPECIES"_master_datastore_index.log"
