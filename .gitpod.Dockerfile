#start from the default gitpod workspace
FROM gitpod/workspace-full 

# install bioinformatic tools and Python
RUN sudo apt-get update && \
    sudo apt-get install -y samtools bedtools bwa toilet figlet && \
    sudo apt-get install -y fastqc

# download human genome sequence and annotations
RUN mkdir -p genome && \
    wget -qO- ftp://ftp.ensembl.org/pub/release-104/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz | \
    gunzip > genome/GRCh38_genome.fa && \
    wget -qO- ftp://ftp.ensembl.org/pub/release-104/gtf/homo_sapiens/Homo_sapiens.GRCh38.104.gtf.gz | \
    gunzip > genome/GRCh38_annotation.gtf

# index genome for BWA    
#RUN bwa index genome/GRCh38_genome.fa


# clean the cache
RUN sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*
