#!/bin/bash
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=20
#SBATCH --time=2:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH --output=gtdbtk240.out
#SBATCH --error=gtdbtk240.err
#SBATCH --mail-user=kira.goff@ucalgary.ca
#SBATCH --mail-type=ALL

##Metagenomic assembly of short read Illumina data
##6. gtdb-tk speciation

source ~/software/init-conda 
conda activate gtdbtk-240 

WORKDIR='pwd' 

gtdbtk classify_wf \
    --genome_dir . --out_dir gtdbtk-240/ \
    --skip_ani_screen --extension fasta

conda deactivate