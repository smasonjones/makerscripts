#PBS -N EVM -l nodes=1:ppn=8,mem=16gb
module load EVM

$EVM_HOME/EvmUtils/execute_EVM_commands.pl commands.list | tee run.log
$EVM_HOME/EvmUtils/recombine_EVM_partial_outputs.pl --partitions partitions_list.out --output_file_name evm.out

$EVM_HOME/EvmUtils/convert_EVM_outputs_to_GFF3.pl  --partitions partitions_list.out --output evm.out  --genome ../Hortaea_thailandica.v1.fasta

