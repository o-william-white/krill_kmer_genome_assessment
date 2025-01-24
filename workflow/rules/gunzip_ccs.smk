rule gunzip_ccs:
    input:
        "results/ascp/{sample}.fastq.gz"
    output:
        temp("results/ascp/{sample}.fastq")
    log:
        "logs/gunzip_ccs/{sample}.log",
    threads: 1
    shell:
        """
        gunzip -c {input} 1> {output} 2> {log}
        """

