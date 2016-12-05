module unload perl
module load perl/5.16.3
module load EVM

GENOME=../Friedmanniomyces_simplex.v1.fasta
perl $EVM_HOME/EvmUtils/partition_EVM_inputs.pl --genome $GENOME --gene_predictions gene_predictions.gff3  \
 --protein_alignments protein_alignments.gff3 --transcript_alignments transcript_alignments.gff3 \
 --segmentSize 500000 --overlapSize 10000 --partition_listing partitions_list.out > listing

