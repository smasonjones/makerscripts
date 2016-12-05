for i in $(ls *maker.output/*fasta); do 
	BASENAME=$(basename $i)
	COUNT=$(grep \> $i | wc -l)
	echo $BASENAME: $COUNT
done
