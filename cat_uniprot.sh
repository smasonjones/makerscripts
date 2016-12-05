for file in `ls *.aa.fasta`
do
 cat $file uniprot_sprot.fasta > temp
 rm $file
 mv temp $file
done

