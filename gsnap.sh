module load gmap
module unload perl
module load perl/5.16.3
module load trinity-rnaseq
module load samtools
cd ~/bigdata/MAKER
Trinity --output Rhizopus_delemar.trinity --genome_guided_bam Rhizopus_delemar.bam --genome_guided_max_intron 10000 --max_memory 10G --CPU 10

