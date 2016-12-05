#PBS -j oe
D=`dirname \`pwd\``
D2=`dirname $D`
SPECIES=`basename $D2`
cp output/gmhmm.mod ../../$SPECIES.gmes.mod
