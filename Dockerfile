# Use a recent Ubuntu LTS version
FROM ubuntu:25.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install common debugging tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    wget \
    net-tools \
    iputils-ping \
    dnsutils \
    procps \
    vim \
    nano \
    tcpdump \
    strace \
    gdb \
    netcat-openbsd \
    iproute2 \
    lsof \
    htop \
    git \
    traceroute \
    telnet \
    socat \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Keep the container running indefinitely
CMD ["sleep", "infinity"]
