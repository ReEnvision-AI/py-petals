FROM nvcr.io/nvidia/cuda:12.3.1-devel-ubuntu22.04
LABEL maintainer="reenvision-ai"
LABEL repository="py-petals"

WORKDIR /home
# Set en_US.UTF-8 locale by default
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment

# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  wget \
  git \
  && apt-get clean autoclean && rm -rf /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O install_miniconda.sh && \
  bash install_miniconda.sh -b -p /opt/conda && rm install_miniconda.sh
ENV PATH="/opt/conda/bin:${PATH}"

RUN conda install python~=3.10.12 pip && \
    pip install --no-cache-dir "torch>=1.12" && \
    conda clean --all && rm -rf ~/.cache/pip

VOLUME /cache
ENV PETALS_CACHE=/cache

COPY . py-petals/
RUN pip install --no-cache-dir -e py-petals

WORKDIR /home/py-petals/
CMD bash
