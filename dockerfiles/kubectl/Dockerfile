FROM alpine:latest
MAINTAINER ric@ngineered.co.uk

ARG KUBECTL_VERSION
ENV kubectl_url="https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

RUN apk add --no-cache --update --virtual .build-deps \
    curl  \
    bash && \
    apk add git && \
    adduser -D -u 1000 kubeuser && \
    curl -OL ${kubectl_url} && \
    mv kubectl /usr/bin/kubectl && \
    chmod a+x /usr/bin/kubectl && \
    apk del .build-deps

WORKDIR /cfg
ENV HOME=/home/kubeuser
USER kubeuser

ENTRYPOINT ["/usr/bin/kubectl"]
