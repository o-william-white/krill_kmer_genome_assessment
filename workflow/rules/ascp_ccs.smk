rule ascp_ccs:
    params:
        ccs = get_ccs,
        ftp = get_ftp_path,
    output:
        temp("results/ascp/{sample}.fastq.gz"),
    log:
        "logs/ascp_ccs/{sample}.log",
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l50m \
            aspera_download@183.239.175.39:{params.ftp}/{params.ccs} \
            results/ascp/{params.ccs} &> {log}
        """

