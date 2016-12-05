#PBS -N braker -l nodes=1:ppn=8,mem=32gb,walltime=96:00:00
module load augustus
module load samtools
module load bamtools
module unload perl
module load perl/5.22.0
module load genemarkHMM

perl scripts/braker/braker.pl --overwrite --genome=/rhome/smaso/shared/projects/Hortaea/Hortaea_werneckii/RNAseq/Trinity/GG_map/index/Hw2.fasta --bam=/rhome/smaso/shared/projects/Hortaea/Hortaea_werneckii/RNAseq/Trinity/GG_map/aln/Hw2.3salt.bam --AUGUSTUS_CONFIG_PATH=~/bigdata/augustus.3.0.3/config --GENEMARK_PATH=/opt/linux/centos/7.x/x86_64/pkgs/genemarkHMM/4.21/gmes_petap.pl --BAMTOOLS_PATH=/opt/linux/centos/7.x/x86_64/pkgs/bamtools/2.4.0/bin --species=Hortaea_werneckii

