rule wget_ccs_md5:
    params:
        ccs_md5 = get_ccs_md5,
        ftp = get_ftp_path,
    output:
        temp("results/wget/{sample}.fastq.gz.md5")
    log:
        "logs/wget_ccs_md5/{sample}.log",
    threads: 1
    shell:
        """
        wget -P results/wget {params.ftp}/{params.ccs_md5} &> {log}
        # md5sum files are malformed. Add line break
        echo "\n" >> results/wget/{params.ccs_md5}
        """

