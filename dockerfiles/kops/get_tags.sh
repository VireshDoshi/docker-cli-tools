#!/bin/bash
  echo "Getting all releases"
  curl https://api.github.com/repos/kubernetes/kops/tags | jq -r .[].name | grep -v v > releases
  curl https://api.github.com/repos/kubernetes/kops/tags | jq -r .[].name | grep -v alpha | grep -v beta | grep -v pre | grep -v rc. | grep -v v | head -n1 > latest
