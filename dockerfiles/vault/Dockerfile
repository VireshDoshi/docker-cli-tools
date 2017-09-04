FROM alpine:latest
MAINTAINER ric@ngd.io

ARG VERSION
ENV vault_url="https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_linux_amd64.zip"

RUN apk add --no-cache --update --virtual .build-deps \
    curl  \
    unzip \
    bash  \
    git && \
    adduser -D -u 1000 vaultuser && \
    curl -OL ${vault_url} && \
    unzip vault_${VERSION}_linux_amd64.zip && \
    mv vault /usr/bin/vault && \
    chmod a+x /usr/bin/vault && \
    apk del .build-deps

WORKDIR /cfg
ENV HOME=/home/vaultuser
USER vaultuser

ENTRYPOINT ["/usr/bin/vault"]
