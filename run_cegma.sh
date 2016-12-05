#PBS -l nodes=1:ppn=8,mem=24gb -N cegma -j oe 

module load cegma
module load hmmer
module load wise
module load geneid
module load snap
module load augustus
module load ncbi-blast/2.2.25+
hostname
D=`dirname \`pwd\``
BASE=`basename $D`


if [ ! -d $BASE.cegma ]; then
 mkdir -p $BASE.cegma
 cd $BASE.cegma
 cegma -g ../../$BASE.fasta -T $PBS_NP --max_intron 2000
else
 echo "CEGMA already run for $BASE ($FILE)"
fi

