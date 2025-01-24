rule jellyfish_count_hifi:
    input:
        "results/gunzip_hifi/krill.hifiasm-assembly.fa",
    output:
        "results/jellyfish/krill.hifiasm-assembly.jf",
    log:
        "logs/jellyfish/krill.hifiasm-assembly.log",
    conda:
        "../envs/kat.yaml"
    threads: 6
    shell:
        """
        kat_jellyfish count -m 27 -s 100M --disk -t 6 -C -o {output} {input} &> {log}
        """
