#!/bin/bash
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=10
#SBATCH --time=5:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH --output=metawrap.bin.out
#SBATCH --error=metawrap.bin.err
#SBATCH --mail-user=kira.goff@ucalgary.ca
#SBATCH --mail-type=ALL

source ~/software/init-conda 
conda activate metawrap-env

metawrap binning -o initial-bins -a metaspades/contigs.fasta \
    --metabat2 --maxbin2 --concoct clean100/*.fq
metawrap binning --metabat2 -a /home/kira.goff/peri-meta/metaspades/contigs500.fasta \
    -o bins/ /home/kira.goff/peri-meta/clean100/chca-rnaseq_c100_*.fq.gz 
metawrap binning --maxbin2 -a /home/kira.goff/peri-meta/metaspades/contigs500.fasta \
    -o bins/ /home/kira.goff/peri-meta/clean100/chca-rnaseq_c100_*.fq.gz
metawrap binning --concoct -a /home/kira.goff/peri-meta/metaspades/contigs500.fasta \
    -o bins/ /home/kira.goff/peri-meta/clean100/chca-rnaseq_c100_*.fq.gz 

conda deactivate