FROM alpine:latest
MAINTAINER ric@ngd.io

ARG VERSION

RUN apk add --no-cache --update --virtual .build-deps \
    curl  \
    nodejs \
    nodejs-npm \
    python3 \
    bash && \
    adduser -D -u 1000 serverlessuser && \
    npm install serverless@${VERSION} -g && \
    pip3 install awscli

WORKDIR /cfg
ENV HOME=/home/serverlessuser
USER serverlessuser

ENTRYPOINT ["/usr/bin/serverless"]
