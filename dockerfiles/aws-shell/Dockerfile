FROM richarvey/awscli:latest
MAINTAINER ric@ngd.io

USER root

ARG VERSION

RUN pip3 install aws-shell==${VERSION} && \
    pip3 install boto3

WORKDIR /cfg
ENV HOME=/home/awsuser
USER awsuser

ENTRYPOINT ["/usr/bin/aws-shell"]
