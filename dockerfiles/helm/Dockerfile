FROM alpine:latest
MAINTAINER ric@ngd.io

ARG HELM_VERSION
ENV helm_url="https://kubernetes-helm.storage.googleapis.com/helm-${HELM_VERSION}-linux-amd64.tar.gz"

RUN apk add --no-cache --update --virtual .build-deps \
    curl  \
    bash && \
    adduser -D -u 1000 kubeuser && \
    curl -OL ${helm_url} && \
    tar xvfm helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/bin/helm && \
    rm -Rf linux-amd64/ && \
    chmod a+x /usr/bin/helm

WORKDIR /cfg
ENV HOME=/home/kubeuser
USER kubeuser

ENTRYPOINT ["/usr/bin/helm"]
