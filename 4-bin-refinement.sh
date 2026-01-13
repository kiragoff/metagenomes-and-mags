#!/bin/bash
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=10
#SBATCH --time=7:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH --output=refine.out
#SBATCH --error=refine.err
#SBATCH --mail-user=kira.goff@ucalgary.ca
#SBATCH --mail-type=ALL

##4. Bin refinement
##use concoct, maxbin2, and combin bins for metawrap refiner
#FUN FACT ABOUT METAWRAP: it's super picky about file extensions and zipped files
#You have to use files that are not gzipped, with the specific extension .fastq

source ~/software/init-conda 
conda activate metawrap-env

metawrap bin_refinement -o BIN_REFINEMENT \
    -A /home/kira.goff/peri-meta/bins500/comebin_bins \
    -B /home/kira.goff/peri-meta/bins500/maxbin2_bins \
    -C /home/kira.goff/peri-meta/bins500/concoct_bins -c 90 -x 5

conda deactivate
