rule wget_ccs:
    params:
        ccs = get_ccs,
        ftp = get_ftp_path,
    output:
        temp("results/wget/{sample}.fastq.gz"),
    log:
        "logs/wget_ccs/{sample}.log",
    threads: 1
    shell:
        """
        wget -P results/wget {params.ftp}/{params.ccs} &> {log}
        """

