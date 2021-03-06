#!/bin/bash

export latest=`curl -Is https://hub.docker.com/v2/repositories/richarvey/${1}/tags/$(cat dockerfiles/${1}/latest)/ | head -n 1|cut -d$' ' -f2`

if [ ${latest} == "200" ]; then
    echo "Build Exists: Nothing to do!"
    exit 0
else
    echo "Building: ${1}"
    cd dockerfiles/${1}/
    for rel in `cat releases`; do 
        export VERSION="${rel}" && \
        export status=`curl -Is https://hub.docker.com/v2/repositories/richarvey/${1}/tags/${VERSION}/ | head -n 1|cut -d$' ' -f2` && \
        if [ $status} == "200" ]; then
            echo "Build Exists: Nothing to do!"
        else
            docker build --build-arg VERSION="${VERSION}" -t "richarvey/${1}:${VERSION}" . && \
            docker push "richarvey/${1}:${VERSION}"
        fi
    done

    latest=`cat latest` && docker tag richarvey/${1}:${latest} richarvey/${1}:latest && docker push "richarvey/${1}:latest"

fi
