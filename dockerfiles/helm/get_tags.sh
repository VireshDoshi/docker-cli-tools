#!/bin/bash
  echo "Getting all releases"
  curl https://api.github.com/repos/kubernetes/helm/tags | jq -r .[].name > releases
  curl https://api.github.com/repos/kubernetes/helm/tags | jq -r .[].name | grep -v alpha | grep -v beta | grep -v pre | grep -v rc. |  head -n1 > latest
