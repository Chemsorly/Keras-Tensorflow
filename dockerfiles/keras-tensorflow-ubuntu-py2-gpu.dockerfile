FROM nvidia/cuda:9.0-runtime-ubuntu16.04
ENV KERAS_BACKEND="tensorflow"
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends \
    # General
    ca-certificates \
    wget \
    git \
    python-pip \
    python-dev \
    python-setuptools \
    && \
    # Clean-up
    apt-get -y autoremove \
    && \
    rm -rf /var/lib/apt/lists/*
# Install Tensorflow
RUN pip install --upgrade tensorflow-gpu && pip install keras && pip install unicodecsv && pip install distance && pip install jellyfish
ENTRYPOINT /bin/bash