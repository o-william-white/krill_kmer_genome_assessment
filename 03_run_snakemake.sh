#!/bin/bash
#SBATCH --partition=long
#SBATCH --output=job_run_snakemake_%j.out
#SBATCH --error=job_run_snakemake_%j.err
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=1

source activate sm_kmer

snakemake \
   --jobs 10 \
   --executor slurm \
   --use-conda \
   --rerun-incomplete \
   --default-resources slurm_account=cropdiv-acc slurm_partition=short \
   --set-resources ascp_forward:runtime=360 ascp_forward:mem=1G ascp_forward:cpus_per_task=1 \
                   ascp_forward_md5:runtime=360 ascp_forward_md5:mem=1G ascp_forward_md5:slurm_partition=short ascp_forward_md5:cpus_per_task=1 \
		   ascp_reverse:runtime=360 ascp_reverse:mem=1G ascp_reverse:cpus_per_task=1 \
                   ascp_reverse_md5:runtime=360 ascp_reverse_md5:mem=1G ascp_reverse_md5:slurm_partition=short ascp_reverse_md5:cpus_per_task=1 \
                   md5dum_check_forward:runtime=360 md5dum_check_forward:mem=1G md5dum_check_forward:slurm_partition=short md5dum_check_forward:cpus_per_task=1 \
		   md5dum_check_reverse:runtime=360 md5dum_check_reverse:mem=1G md5dum_check_reverse:slurm_partition=short md5dum_check_reverse:cpus_per_task=1 \
                   zcat_reads:runtime=2280 zcat_reads:mem=1T zcat_reads:slurm_partition=himem zcat_reads:cpus_per_task=1 \
		   jellyfish_count_reads:runtime=4320 jellyfish_count_reads:mem=3T jellyfish_count_reads:cpus_per_task=6 jellyfish_count_reads:slurm_partition=himem \
		   gunzip_hifi:runtime=360 gunzip_hifi:mem=1G gunzip_hifi:cpus_per_task=1 \
		   gunzip_chromosome:runtime=360 gunzip_chromosome:mem=1G gunzip_chromosome:cpus_per_task=1 \
		   jellyfish_count_hifi:runtime=360 jellyfish_count_hifi:mem=100G jellyfish_count_hifi:cpus_per_task=6 \
                   jellyfish_count_chromosome:runtime=360 jellyfish_count_chromosome:mem=100G jellyfish_count_chromosome:cpus_per_task=6 \
		   kat_hifi:runtime=2880 kat_hifi:mem=3T kat_hifi:cpus_per_task=6 kat_hifi:slurm_partition=himem \
		   kat_chromosome:runtime=2880 kat_chromosome:mem=3T kat_chromosome:cpus_per_task=6 kat_chromosome:slurm_partition=himem 

#  --retries 3 \

echo Complete!

