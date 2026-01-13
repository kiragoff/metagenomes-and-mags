#!/bin/bash
set -e
##Metagenomic assembly of short read Illumina data
##7. Annotation 

#gene call and annotate with bakta
bakta \
    --db /mnt/work-drive/databases/bakta/db microbacterium3.fa \
    --output bakta \
    --gram + --compliant \
    --genus Microbacterium \
    --locus-tag MICROS \
    --threads 14 --replicons replicon-meta2.csv 

#use a replicon table while calling and annotating
bakta \
    --db /mnt/work-drive/databases/bakta/db peri.fasta \
    --output bakta \
    --gram + --compliant --complete \
    --genus Peribacillus --species butanolivorans  --strain OSPW \
    --locus-tag PBUTOS \
    --threads 14 --replicons replicon-manifest.csv 