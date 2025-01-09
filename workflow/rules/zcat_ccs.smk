rule zcat_ccs:
    input:
        "results/ascp/{sample}.fastq.gz"
    output:
        temp("results/ascp/{sample}.fastq")
    log:
        "logs/zcat_ccs/{sample}.log",
    threads: 1
    shell:
        """
        zcat {input} 1> {output} 2> {log}
        """

