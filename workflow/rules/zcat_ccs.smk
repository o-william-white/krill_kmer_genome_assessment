rule zcat_ccs:
    input:
        expand(
            "results/ascp/{sample}.fastq.gz",
            sample=sample_data.index.tolist(),
        ),
    output:
        temp("results/zcat_ccs/ccs.fastq"),
    log:
        "logs/zcat_ccs/zcat_ccs.log",
    conda:
        "../envs/conda_env.yaml"
    threads: 1
    shell:
        """
        zcat {input} 1> {output} 2> {log}
        """
