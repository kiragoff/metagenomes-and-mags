#!/bin/bash
set -e
##Metagenomic assembly of short read Illumina data
##3a. Local binning 


#let's try installing comebin as a binner and running that as well
#seeing good benchmarks for comebin, metadecoder
#jfc, fought with metawrap forever and the problem is that it doesn't like .fq files, only .fastq

conda update -n base conda

/home/kira.goff/software/miniforge3/envs/comebin_env

conda activate comebin_env

run_comebin.sh -a /mnt/work-drive/kira/shortread-meta/metaspades/contigs1k.fasta \
    -o /mnt/work-drive/kira/shortread-meta/comebin \
    -p /mnt/work-drive/kira/shortread-meta/fastpl100/ \
    -t 12

conda deactivate

#this runs in minutes locally. 
#bins at /mnt/work-drive/kira/shortread-meta/comebin/comebin_res/cluster_res/weight_seed_kmeans_k_2_result.tsv_bins/, 
#checkm at /mnt/work-drive/kira/shortread-meta/comebin/comebin_res/cluster_res/unitem_profile/binning_methods/weight_seed_kmeans_k_2_result.tsv/checkm_bac
#showing 98% complete and no contamination
