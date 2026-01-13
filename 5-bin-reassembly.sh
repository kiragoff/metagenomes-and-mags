#!/bin/bash
#SBATCH --ntasks=6
#SBATCH --cpus-per-task=15
#SBATCH --time=36:00:00
#SBATCH --output=solo2-reassemble-classify.out
#SBATCH --error=solo2-reassemble-classify.err
#SBATCH --mail-user=kira.goff@ucalgary.ca
#SBATCH --mail-type=ALL

##5. Bin reassembly

source ~/software/init-conda 
conda activate metawrap-env

metawrap reassemble_bins \
    -o BIN_REASSEMBLY3 \
    -1 /home/kira.goff/peri-meta/clean100/chca-rnaseq_c100_1.fastq \
    -2 /home/kira.goff/peri-meta/clean100/chca-rnaseq_c100_1.fastq \
    -c 90 -x 5 -b BIN_REFINEMENT/metawrap_90_5_bins
conda deactivate


#metawrap reassembly module (strict)
##              bin1-strict3			
##              node	length	    cov	
##              1	    2,101,921	614	
##              2	    629,610	    613	
##              3	    550,864	    606	
##              4	    328,199	    609	
##              5	    164,762	    615	
##              6	    968	        617	
##  total length	    3,776,324	612	avg cov

##checkM
#   bin	            completeness	contamination	GC	    lineage	        N50	    size
#   bin.1.strict	98.98	        0	            0.678	Actinomycetales	550,864	3,776,324