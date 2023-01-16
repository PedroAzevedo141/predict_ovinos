# FROM ubuntu:20.04
FROM nvidia/cuda:11.4.1-runtime-ubuntu20.04

# Avoiding interactive problems when updating
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Recife

# Install the python development environment
ARG USE_PYTHON_3=True
ARG _PY_SUFFIX=${USE_PYTHON_3:+3}
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    ${PYTHON}-dev \
    ${PYTHON}-pip \
    git

RUN ${PIP} install --no-cache-dir --upgrade \
    pip \
    setuptools

RUN ln -s -f $(which ${PYTHON}) /usr/local/bin/python
RUN ${PYTHON} --version

# Installing basic dependencies
RUN apt update && apt install -y \
    build-essential \
    curl \
    openjdk-8-jdk \
    pkg-config \
    swig \
    unzip \
    wget \
    g++ \
    zlib1g-dev \
    zip

# Installing Pytorch and Pytorch Vision
RUN ${PIP} install --no-cache-dir \
    torch==1.10.0+cu111 \
    torchvision==0.11.0+cu111 \
    torchaudio==0.10.0 \
    -f https://download.pytorch.org/whl/torch_stable.html


# Installing dependencies for dataset reading and train reporting
RUN ${PIP} install opencv-python \
    tqdm \
    pandas \
    h5py

# Installing dependencies for reporting and plotting results
RUN ${PIP} install --no-cache-dir \
    sklearn \
    matplotlib \
    seaborn

# Installing the memory profiler
RUN ${PIP} install --no-cache-dir \
    memory_profiler \
    argparse


# Installing Flower framework
RUN ${PIP} install --no-cache-dir \
    flwr==0.18.0

# Minimal Jupyter notebook
RUN ${PIP} install jupyter

# Install pdoc3
RUN ${PIP} install pdoc3
# Install Pytest
RUN ${PIP} install -U pytest
