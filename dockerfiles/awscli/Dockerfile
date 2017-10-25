FROM alpine:latest
MAINTAINER ric@ngd.io

ARG VERSION

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update \
    groff \
    less \
    bash \
    python3 && \
    adduser -D -u 1000 awsuser && \
    pip3 install awscli==${VERSION} && \
    pip3 install boto && \
    pip3 install boto3

WORKDIR /cfg
ENV HOME=/home/awsuser
USER awsuser

ENTRYPOINT ["/usr/bin/aws"]
