FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04
ENV KERAS_BACKEND="tensorflow"
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends \
    # General
    ca-certificates \
    wget \
    git \
    python3-pip \
    python3-dev \
    python3-setuptools \
    libgomp1 \
    && \
    # Clean-up
    apt-get -y autoremove \
    && \
    rm -rf /var/lib/apt/lists/*
# Install Tensorflow
RUN pip3 install --upgrade tensorflow-gpu && pip3 install keras && pip3 install unicodecsv && pip3 install distance && pip3 install jellyfish
ENTRYPOINT /bin/bash