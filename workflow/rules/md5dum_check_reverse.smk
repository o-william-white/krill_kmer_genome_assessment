checkpoint md5sum_check_reverse:
    input:
        fwd = "results/ascp/{sample}_read_2.fq.gz",
        md5 = "results/ascp/{sample}_read_2.fq.gz.md5",
    output:
        "results/md5sum_check/{sample}_R2.txt"       
    log:
        "logs/md5sum_check/{sample}_R2.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        md5sum -c {input.md5} 1> {output} 2> {log}
        """

