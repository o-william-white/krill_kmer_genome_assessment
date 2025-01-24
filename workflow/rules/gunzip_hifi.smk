rule gunzip_hifi:
    input:
        "../data_krill_chromosome_assemblies/krill.hifiasm-assembly.fa.gz"
    output:
        temp("results/gunzip_hifi/krill.hifiasm-assembly.fa")
    log:
        "logs/gunzip_hifi/gunzip_hifi.log",
    threads: 1
    shell:
        """
        gunzip -c {input} 1> {output} 2> {log}
        """

