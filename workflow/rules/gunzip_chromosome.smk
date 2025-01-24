rule gunzip_chromosome:
    input:
        "../data_krill_chromosome_assemblies/krill.chromosome.fa.gz"
    output:
        temp("results/gunzip_chromosome/krill.chromosome.fa")
    log:
        "logs/gunzip_chromosome/gunzip_chromosome.log",
    threads: 1
    shell:
        """
        gunzip -c {input} 1> {output} 2> {log}
        """

