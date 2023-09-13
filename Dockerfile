FROM ubuntu:22.04

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && \
    apt-get install -y \
    apt git build-essential cmake libuv1-dev libssl-dev libhwloc-dev && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/cache/apt/archives/* && \
    rm -rf /var/lib/apt/lists/*

COPY . /xmrig
WORKDIR /xmrig

RUN mkdir build && \
    cd build && \
    cmake .. && \
    make

WORKDIR /xmrig/build

ENTRYPOINT ["/xmrig/build/xmrig"]
