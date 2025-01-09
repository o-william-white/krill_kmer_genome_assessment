checkpoint md5sum_check_ccs:
    input:
        ccs = "results/ascp/{sample}.fastq.gz",
        md5 = "results/ascp/{sample}.fastq.gz.md5",
    output:
        "results/md5sum_check/{sample}.txt"       
    log:
        "logs/md5sum_check/{sample}.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        md5sum -c {input.md5} 1> {output} 2> {log}
        """

