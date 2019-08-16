FROM ubuntu:19.10
LABEL maintainer="Daniel Weisser <daniel.weisser@gmail.com>"
LABEL Description="Docker Container for generating documentation with docToolchain"


RUN apt-get -qq update && apt-get install -qq -y apt-transport-https ca-certificates curl software-properties-common git openjdk-8-jdk gradle

RUN git clone https://github.com/docToolchain/docToolchain.git && \
      cd docToolchain && \
      git checkout v1.1.0 && \
      git submodule update -i && \
      gradle tasks && \
      gradle && \
      PATH="/docToolchain/bin:${PATH}"

ENV PATH="/docToolchain/bin:${PATH}"

ENTRYPOINT /bin/bash
