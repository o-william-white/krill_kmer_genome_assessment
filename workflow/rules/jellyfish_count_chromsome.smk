rule jellyfish_count_chromosome:
    input:
        "results/gunzip_chromosome/krill.chromosome.fa",
    output:
        "results/jellyfish/krill.chromosome.jf",
    log:
        "logs/jellyfish/krill.chromosome.log",
    conda:
        "../envs/kat.yaml"
    threads: 6
    shell:
        """
        kat_jellyfish count -m 27 -s 100M --disk -t 6 -C -o {output} {input} &> {log}
        """
