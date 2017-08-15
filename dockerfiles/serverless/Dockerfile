FROM alpine:latest
MAINTAINER ric@ngd.io

ARG SERVERLESS_VERSION

RUN apk add --no-cache --update --virtual .build-deps \
    curl  \
    nodejs \
    nodejs-npm \
    python3 \
    bash && \
    adduser -D -u 1000 serverlessuser && \
    npm install serverless@${SERVERLESS_VERSION} -g && \
    pip3 install awscli

WORKDIR /cfg
ENV HOME=/home/serverlessuser
USER serverlessuser

ENTRYPOINT ["/usr/bin/serverless"]
