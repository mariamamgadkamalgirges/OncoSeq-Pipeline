FROM ubuntu:22.04

LABEL maintainer="Mariam Amgad"
LABEL description="OncoSeq Pipeline - End-to-End Cancer NGS Bioinformatics Pipeline"

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    bwa \
    samtools \
    wget \
    unzip \
    default-jre \
    && apt-get clean

WORKDIR /OncoSeq-Pipeline

COPY . .

CMD ["bash"]
