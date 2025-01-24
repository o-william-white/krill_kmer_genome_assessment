#!/bin/bash
#SBATCH --partition=long
#SBATCH --output=job_run_snakemake_%j.out
#SBATCH --error=job_run_snakemake_%j.err
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=1

source activate sm_hifi_kmer

snakemake \
   --jobs 10 \
   --executor slurm \
   --use-conda \
   --retries 3 \
   --rerun-incomplete \
   --default-resources slurm_account=cropdiv-acc slurm_partition=short \
   --set-resources ascp_ccs:runtime=360 ascp_ccs:mem=1G ascp_ccs:cpus_per_task=1 \
                   ascp_ccs_md5:runtime=360 ascp_ccs_md5:mem=1G ascp_ccs_md5:slurm_partition=short ascp_ccs_md5:cpus_per_task=1 \
		   edit_md5:runtime=360 edit_md5:mem=1G edit_md5:slurm_partition=short edit_md5:cpus_per_task=1 \
                   md5dum_check_ccs:runtime=360 md5dum_check_ccs:mem=1G md5dum_check_ccs:slurm_partition=short md5dum_check_ccs:cpus_per_task=1 \
		   gunzip_ccs:runtime=360 gunzip_ccs:mem=1G gunzip_ccs:cpus_per_task=1 \
		   seqkit_stats:runtime=360 seqkit_stats:mem=1G seqkit_stats:cpus_per_task=1 \
                   jellyfish_count_ccs:runtime=360 jellyfish_count_ccs:mem=100G jellyfish_count_ccs:cpus_per_task=6 \
		   jellyfish_merge_ccs:runtime=1440 jellyfish_merge_ccs:mem=2T jellyfish_merge_ccs:cpus_per_task=1 jellyfish_merge_ccs:slurm_partition=himem \
		   gunzip_hifi:runtime=360 gunzip_hifi:mem=1G gunzip_hifi:cpus_per_task=1 \
		   gunzip_chromosome:runtime=360 gunzip_chromosome:mem=1G gunzip_chromosome:cpus_per_task=1 \
		   jellyfish_count_hifi:runtime=360 jellyfish_count_hifi:mem=100G jellyfish_count_hifi:cpus_per_task=6 \
                   jellyfish_count_chromosome:runtime=360 jellyfish_count_chromosome:mem=100G jellyfish_count_chromosome:cpus_per_task=6 \
		   kat_hifi:runtime=2280 kat_hifi:mem=3T kat_hifi:cpus_per_task=6 kat_hifi:slurm_partition=himem \
		   kat_chromosome:runtime=2280 kat_chromosome:mem=3T kat_chromosome:cpus_per_task=6 kat_chromosome:slurm_partition=himem 

echo Complete!

