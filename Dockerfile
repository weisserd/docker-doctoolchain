FROM ubuntu:18.04
LABEL maintainer="Daniel Weisser <daniel.weisser@gmail.com>"
LABEL Description="Docker Container for generating documentation with docToolchain"


RUN apt-get -qq update && apt-get install -qq -y apt-transport-https ca-certificates curl software-properties-common git graphviz openjdk-8-jdk gradle

RUN git clone --recursive https://github.com/docToolchain/docToolchain.git && \
      cd docToolchain && \
      rm -rf .git && \
      rm -rf resources/asciidoctor-reveal.js/.git && \
      rm -rf resources/reveal.js/.git

RUN update-java-alternatives -s java-1.8.0-openjdk-amd64

ENTRYPOINT /bin/bash
