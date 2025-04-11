#!/bin/bash
#SBATCH --partition=himem
#SBATCH --output=job_kat_comp_hifi_%j.out
#SBATCH --error=job_kat_comp_hifi_%j.err
#SBATCH --mem=2T
#SBATCH --cpus-per-task=6

source activate kat 

mkdir -p results/kat_comp_hifi

kat comp \
   -t 6 \
   -o results/kat_comp_hifi/kat \
   results/jellyfish/reads.jf \
   results/jellyfish/krill.hifiasm-assembly.jf   

echo Complete!

