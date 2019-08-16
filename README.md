# docker image for doctoolchain

Basic [Docker](https://www.docker.com/) image to generate [docToolchain](https://github.com/docToolchain/docToolchain) documentations.

## Usage in gitlab-ci

The main reason for this image was the usage within gitlab

A runner can be configured via:

    image: dweisser/docker-doctoolchain

    build:
      stage: build
      script:
        - /docToolchain/bin/doctoolchain <FOLDER> generatePDF
      tags:
        - docker
      artifacts:
        expire_in: 2 weeks
        paths:
         - build/pdf/*.pdf
