process FASTA_CHECK {
    input: 
    path fasta

    output:
    tuple val('genome'), path('genome_checked.fa'), emit: fasta

    script:
    """
    cp $fasta genome_checked.fa
    """

}