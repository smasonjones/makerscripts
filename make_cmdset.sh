
module load EVM

perl $EVM_HOME/EvmUtils/write_EVM_commands.pl --genome ../Hortaea_thailandica.v1.fasta --weights `pwd`/weights --gene_predictions gene_predictions.gff3 --protein_alignments protein_alignments.gff3 --transcript_alignments transcript_alignments.gff3 \
  --output_file_name evm.out --partitions partitions_list.out > commands.list

