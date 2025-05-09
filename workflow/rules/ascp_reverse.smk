rule ascp_reverse:
    params:
        rev = get_reverse,
        ftp = get_ftp_path,
    output:
        temp("results/ascp/{sample}_read_2.fq.gz"),
    log:
        "logs/ascp_reverse/{sample}.log",
    conda:
        "../envs/aspera-cli.yaml"
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l200m \
            aspera_download@183.239.175.39:{params.ftp}/{params.rev} \
            results/ascp/{params.rev} &> {log}
        """
