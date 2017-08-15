FROM alpine:latest
MAINTAINER ric@ngd.io

ARG TERRAFORM_VERSION
ENV terraform_url="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

RUN apk add --no-cache --update --virtual .build-deps \
    curl  \
    unzip \
    bash  && \
    apk add git && \
    adduser -D -u 1000 terraformuser && \
    curl -OL ${terraform_url} && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/bin/terraform && \
    chmod a+x /usr/bin/terraform && \
    apk del .build-deps

WORKDIR /cfg
ENV HOME=/home/terraformuser
USER terraformuser

ENTRYPOINT ["/usr/bin/terraform"]
