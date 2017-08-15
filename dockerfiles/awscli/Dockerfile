FROM alpine:latest
MAINTAINER ric@ngd.io

ARG CLI_VERSION

RUN apk add --no-cache --update \
    groff \
    less \
    python3 && \
    adduser -D -u 1000 awsuser && \
    pip3 install awscli==${CLI_VERSION}

WORKDIR /cfg
ENV HOME=/home/awsuser
USER awsuser

ENTRYPOINT ["/usr/bin/aws"]
