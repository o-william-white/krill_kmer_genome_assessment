rule ascp_ccs_md5:
    params:
        ccs_md5 = get_ccs_md5,
        ftp = get_ftp_path,
    output:
        temp("results/ascp/{sample}.fastq.gz.md5.tmp")
    log:
        "logs/ascp_ccs_md5/{sample}.log",
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l50m \
            aspera_download@183.239.175.39:{params.ftp}/{params.ccs_md5} \
            results/ascp/{params.ccs_md5}.tmp &> {log}
        """

