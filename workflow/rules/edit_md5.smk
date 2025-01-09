rule edit_md5:
    input:
        "results/ascp/{sample}.fastq.gz.md5.tmp",
    output:
        temp("results/ascp/{sample}.fastq.gz.md5")
    log:
        "logs/edit_md5/{sample}.log",
    threads: 1
    shell:
        """
        python workflow/scripts/edit_md5.py \
            --input {input} \
            --output {output} &> {log}
        """
