#!/bin/bash
set -e
##Metagenomic assembly of short read Illumina data
##1. Data QC

cd /mnt/work-drive/kira/shortread-meta 
mkdir multiqc
cd multiqc
conda activate fastqc

fastqc ../reads/*.gz -t 6 -o .
conda deactivate

conda activate multiqc
multiqc .
conda deactivate

#as expected. v good quality. 
#bimodal gc dist, with much more contribution from 68% (likely microbacterium)
#reverse reads some polyg tails 

#clean and check data

mkdir ../fastp
cd ../fastp

conda activate fastp
fastp -g \
    -i ../reads/chca-rnaseq_1.fq.gz -I ../reads/chca-rnaseq_2.fq.gz \
    -o chca-rnaseq_c_1.fq.gz -O chca-rnaseq_c_2.fq.gz \
    -h chca-rnaseq.html -j chca-rnaseq.json  -w 9
conda deactivate

mkdir cleanqc
cd cleanqc

conda activate fastqc
fastqc ../*.gz -t 6 -o .
conda deactivate

conda activate multiqc
multiqc .
conda deactivate

mkdir ../../fastpl100
cd ../../fastpl100

conda activate fastp
fastp -g -l 100 \
    -i ../reads/chca-rnaseq_1.fq.gz -I ../reads/chca-rnaseq_2.fq.gz \
    -o chca-rnaseq_c100_1.fq.gz -O chca-rnaseq_c100_2.fq.gz \
    -h chca-rnaseq.html -j chca-rnaseq.json  -w 9
conda deactivate

# fastp output 
# Read1 before filtering:
# total reads: 21613614
# total bases: 3242042100
# Q20 bases: 3218724965(99.2808%)
# Q30 bases: 3101371932(95.6611%)
# Q40 bases: 3101371932(95.6611%)

# Read2 before filtering:
# total reads: 21613614
# total bases: 3242042100
# Q20 bases: 3185951279(98.2699%)
# Q30 bases: 3004031102(92.6586%)
# Q40 bases: 3004031102(92.6586%)

# Read1 after filtering:
# total reads: 21425099
# total bases: 3213629263
# Q20 bases: 3192802602(99.3519%)
# Q30 bases: 3079804735(95.8357%)
# Q40 bases: 3079804735(95.8357%)

# Read2 after filtering:
# total reads: 21425099
# total bases: 3213612571
# Q20 bases: 3167794888(98.5743%)
# Q30 bases: 2995483586(93.2123%)
# Q40 bases: 2995483586(93.2123%)

# Filtering result:
# reads passed filter: 42850198
# reads failed due to low quality: 247464
# reads failed due to too many N: 9636
# reads failed due to too short: 119930
# reads with adapter trimmed: 22510
# bases trimmed due to adapters: 946964

# Duplication rate: 19.6931%

# Insert size peak (evaluated by paired-end reads): 269

# JSON report: chca-rnaseq.json
# HTML report: chca-rnaseq.html

mkdir cleanqc
cd cleanqc
conda activate fastqc

fastqc ../*.gz -t 6 -o .
conda deactivate

conda activate multiqc
multiqc .
conda deactivate
