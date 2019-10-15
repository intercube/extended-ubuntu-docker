FROM ubuntu:18.04

LABEL maintainer="Jeroen Ketelaar"

RUN apt-get update && \
    apt-get upgrade -y

# Tools necessary for installing and configuring Ubuntu
RUN apt-get install -y \
    apt-utils \
    locales \
    tzdata

# Timezone
RUN echo "Europe/Amsterdam" | tee /etc/timezone && \
    ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Locale with UTF-8 support
RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && \
    locale-gen && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Adding https support for packages
RUN apt-get update && apt-get install -y apt-transport-https

# Installing Python3
RUN apt-get install -y \ 
    python3.7 \
    python3-pip

# Basic tools
RUN apt-get install -y \
    bash-completion \
    bc \
    cron \
    curl \
    git \
    inetutils-traceroute \
    iputils-ping \
    jq \
    lsof \
    man \
    netcat \
    nmap \
    psmisc \
    screen \
    socat \
    telnet \
    unzip \
    vim \
    sysstat \
    wget

# Admin tools
RUN apt-get install -y \
    expect

# Python development
RUN apt-get install -y python-pip

# C development
RUN apt-get install -y \
    clang \
    gdb

# Config
RUN echo 'defshell -bash' >> /root/.screenrc
RUN echo 'if [ -f /etc/bash_completion ] && ! shopt -oq posix; then' >> /root/.bashrc && \
    echo '    . /etc/bash_completion' >> /root/.bashrc && \
    echo 'fi' >> /root/.bashrc
