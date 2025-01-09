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
   --default-resources slurm_account=cropdiv-acc slurm_partition=short \
   --set-resources ascp_ccs:runtime=360 ascp_ccs:mem=1G ascp_ccs:cpus_per_task=1 \
                   ascp_ccs_md5:runtime=360 ascp_ccs_md5:mem=1G ascp_ccs_md5:slurm_partition=short ascp_ccs_md5:cpus_per_task=1 \
		   edit_md5:runtime=360 edit_md5:mem=1G edit_md5:slurm_partition=short edit_md5:cpus_per_task=1 \
                   md5dum_check_ccs:runtime=360 md5dum_check_ccs:mem=1G md5dum_check_ccs:slurm_partition=short md5dum_check_ccs:cpus_per_task=1 \
		   zcat_ccs:runtime=360 zcat_ccs:mem=1G zcat_ccs:cpus_per_task=1 \
		   seqkit_stats:runtime=360 seqkit_stats:mem=1G seqkit_stats:cpus_per_task=1 \
                   jellyfish_count:runtime=360 jellyfish_count:mem=100G jellyfish_count:cpus_per_task=6 \
		   jellyfish_merge:runtime=1440 jellyfish_merge:mem=2T jellyfish_merge:cpus_per_task=1 jellyfish_merge:slurm_partition=himem 
echo Complete!

