FROM gitpod/workspace-full

# Installazione dei programmi
RUN sudo apt-get update && \
    sudo apt-get install -y bwa samtools bedtools

# Pulizia della cache APT
RUN sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*
