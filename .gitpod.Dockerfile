#start from the default gitpod workspace
FROM gitpod/workspace-full 

# install bioinformatic tools and Python
RUN sudo apt-get update && \
    sudo apt-get install -y samtools bedtools bwa toilet && \
    sudo apt-get install -y fastqc

# download human genome sequence and annotations
RUN echo "Downloading human genome and annotation files..." && \
    mkdir genome \
    wget -qO- ftp://ftp.ensembl.org/pub/release-104/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz | \
    gunzip > /workspace/genome/GRCh38_genome.fa && \
    wget -qO- ftp://ftp.ensembl.org/pub/release-104/gtf/homo_sapiens/Homo_sapiens.GRCh38.104.gtf.gz | \
    gunzip > /workspace/genome/GRCh38_annotation.gtf && \
    bwa index /workspace/genome/GRCh38_genome.fa


# clean the cache
RUN sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*
