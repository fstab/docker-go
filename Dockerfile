FROM ubuntu:15.04
MAINTAINER Fabian Stäber, fabian@fstab.de

ENV LAST_UPDATE=2015-09-25

RUN apt-get update && \
    apt-get upgrade -y

# Set the locale (I want to use German Umlauts)
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set the timezone (change this to your local timezone)
RUN echo "Europe/Berlin" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y \
    curl \
    git \
    vim

RUN mkdir /usr/local/go && \
    curl https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz | \
    tar xvzf - -C /usr/local/go --strip-components=1

RUN adduser --disabled-login --gecos '' go
WORKDIR /home/go
USER go

ENV GOROOT /usr/local/go
ENV PATH="$GOROOT/bin:$PATH"
ENV GOPATH /home/go
ENV PATH="$GOPATH/bin:$PATH"
