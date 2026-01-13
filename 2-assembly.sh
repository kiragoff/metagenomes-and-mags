#!/bin/bash
set -e
##Metagenomic assembly of short read Illumina data
##2. Assembly

##A. assemble with megahit
mkdir ../../megahit
cd ../../megahit

conda activate megahit
megahit \
    -1 ../fastpl100/chca-rnaseq_c100_1.fq.gz -2 ../fastpl100/chca-rnaseq_c100_2.fq.gz \
    -o out -t 12 -m 0.9
conda deactivate

#2025-08-13 13:18:58 - 230 contigs, total 9580882 bp, min 203 bp, max 1887775 bp, avg 41656 bp, N50 257519 bp
#2025-08-13 13:18:58 - ALL DONE. Time elapsed: 353.305156 seconds 

##B. assemble with metaspades
mkdir ../metaspades
cd ../metaspades
/home/lisa/spades/SPAdes-4.2.0-Linux/bin/metaspades.py \
    -1 /mnt/work-drive/kira/shortread-meta/fastpl100/chca-rnaseq_c100_1.fq.gz \
    -2 /mnt/work-drive/kira/shortread-meta/fastpl100/chca-rnaseq_c100_2.fq.gz \
    -o . -t 12 

## C. pull plasmids with metaplasmidspades 
mkdir ../metaplasmidspades
cd ../metaplasmidspades

/home/lisa/spades/SPAdes-4.2.0-Linux/bin/metaplasmidspades.py \
    -1 /mnt/work-drive/kira/shortread-meta/fastpl100/chca-rnaseq_c100_1.fq.gz \
    -2 /mnt/work-drive/kira/shortread-meta/fastpl100/chca-rnaseq_c100_2.fq.gz \
    -o /mnt/work-drive/kira/shortread-meta/metaplasmidspades \
    -t 12
