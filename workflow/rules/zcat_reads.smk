rule zcat_reads:
    input:
        expand(
            "results/ascp/{sample}_read_{fr}.fq.gz",
            sample=sample_data.index.tolist(),
            fr=["1", "2"]
        ),
    output:
        "results/zcat_reads/reads.fastq",
    log:
        "logs/zcat_reads/zcat_reads.log",
    conda:
        "../envs/conda_env.yaml"
    threads: 1
    shell:
        """
        zcat {input} 1> {output} 2> {log}
        """
