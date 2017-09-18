FROM alpine:latest
MAINTAINER ric@ngineered.co.uk

ARG VERSION
ENV kops_url="https://github.com/kubernetes/kops/releases/download/$VERSION/kops-linux-amd64"

RUN apk add --no-cache --update --virtual .build-deps \
    curl  \
    bash && \
    apk add git \
    groff \
    less \
    python3 && \
    adduser -D -u 1000 kubeuser && \
    curl -OL ${kops_url} && \
    mv kops-linux-amd64 /usr/bin/kops && \
    chmod a+x /usr/bin/kops && \
    pip3 install awscli && \
    apk del .build-deps

WORKDIR /cfg
ENV HOME=/home/kubeuser
USER kubeuser

ENTRYPOINT ["/usr/bin/kops"]
