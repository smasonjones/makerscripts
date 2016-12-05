#PBS -l nodes=1:ppn=4,mem=16gb,walltime=96:00:00
module load stajichlab
module load snap
module load maker
D=`dirname \`pwd\``
D2=`dirname $D`
SPECIES=`basename $D2`
if [ ! -f $SPECIES.snap.hmm]; then
  cegma2zff ../$SPECIES.cegma/output.cegma.gff ../../$SPECIES.fasta
  fathom genome.ann genome.dna -categorize 1000
  fathom uni.ann uni.dna -export 1000 -plus
  mkdir hmm
  cd hmm
  forge ../export.ann ../export.dna
  cd ..

  hmm-assembler.pl -x $SPECIES hmm > ../../$SPECIES.snap_intronlen.hmm
  hmm-assembler.pl $SPECIES hmm > ../../$SPECIES.snap.hmm
fi
