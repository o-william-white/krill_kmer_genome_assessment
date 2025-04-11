#!/bin/bash
#SBATCH --partition=himem
#SBATCH --output=job_kat_jellyfish_%j.out
#SBATCH --error=job_kat_jellyfish_%j.err
#SBATCH --mem=3999G
#SBATCH --cpus-per-task=12

source activate .snakemake/conda/4c7e2d8ff6b3de21ba2090d481b3291f_ 

mkdir -p results/jellyfish

jellyfish count -m 21 -s 600G --upper-count 255 -t 12 -C -o results/jellyfish/reads.jf results/zcat_reads/reads.fastq

echo Complete!

